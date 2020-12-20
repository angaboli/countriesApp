import 'package:countries_app/pages/country.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class AllCountries extends StatefulWidget {
  @override
  _AllCountriesState createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {

  List countries;

  getCountries() async{
    var response = await Dio().get('https://restcountries.eu/rest/v2/all');
    return response.data;
  }

  @override
  void initState() {
    getCountries().then((data){
      countries = data;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print(countries);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('Learn Countries | All countries',
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1551921038-a9009c20adb3?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGVhcnRofGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                fit: BoxFit.cover,
              )
          ),
          child: ListView.builder( itemBuilder: (BuildContext context,int index){
            return GestureDetector(
              onTap: ()
              {
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context)=> Country(countries[index]),
                    ));
              },

              child: Card(
                elevation: 10,
                /*leading: CircleAvatar(
                        child: SvgPicture.network(country['flag']),
                      ),*/
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),

                  child: Text(

                    countries[index]['name'],
                    style: TextStyle(fontSize: 18),
                  ),

                ),
              ),
            );}

          ),
        )
    );
  }
}
