import 'dart:math';

import 'package:countries_app/pages/country.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AllCountries extends StatefulWidget {

  var continent;

  AllCountries({Key key,@required this.continent}) : super(key : key);

  @override
  _AllCountriesState createState() => _AllCountriesState(continent);
}

class _AllCountriesState extends State<AllCountries> {


  List countries = [];
  List filteredContinent = [];
  bool isSearching = false ;

  var continent;

  _AllCountriesState(this.continent);


  getCountries() async{
    var response = await Dio().get('https://restcountries.eu/rest/v2/all');
    return response.data;
  }

  @override
  void initState() {
    getCountries().then((data){
      setState(() {
        countries = filteredContinent = data;
      });
    });
    super.initState();
  }

  void _filterContinent(value){
    print(this.continent);
    filteredContinent = this.continent;
    setState(() {
      filteredContinent =
          countries.where((country) => country['region'].toLowerCase() ==  value ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {

    //print(countries);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: !isSearching ? Text('Learn countries')
          : TextField(
            onChanged: (value){
              _filterContinent(value);
            },
             style: TextStyle(color: Colors.white),
              decoration: InputDecoration(hintText: "Europe",
              hintStyle: TextStyle(color: Colors.white))
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                setState(() {
                  this.isSearching = !this.isSearching;
                  filteredContinent = countries;
                });

              },
            )
          ],

        ),
        body: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1551921038-a9009c20adb3?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGVhcnRofGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                fit: BoxFit.cover,
              )
          ),
          child: filteredContinent.length > 0 ? ListView.builder(
              itemCount: filteredContinent.length,
              itemBuilder: (BuildContext context,int index){
            return GestureDetector(
              onTap: ()
              {
                Navigator.of(context).push(
                    SizeRoute(page : Country(filteredContinent[index]),
                    ));
              },

              child: Card(
                elevation: 10,
                /*leading: CircleAvatar(
                        child: SvgPicture.network(country['flag']),
                      ),*/
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 10.0,
                          child: SvgPicture.network(
                            filteredContinent[index]['flag'],
                            height: 30.0,
                            width: 40.0,
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      Text(
                        filteredContinent[index]['name'],
                        style: TextStyle(fontSize: 18),
                      ),

                    ],

                  ),
                ),
              ),
            );}

          ):Center(child: CircularProgressIndicator()),
        )
    );
  }
}

class SizeRoute extends PageRouteBuilder {
  final Widget page;
  SizeRoute({this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        Align(
          child: SizeTransition(
            sizeFactor: animation,
            child: child,
          ),
        ),
  );
}