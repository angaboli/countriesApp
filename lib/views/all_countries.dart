import 'package:countries_app/views/country.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AllCountries extends StatefulWidget {
  @override
  _AllCountriesState createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {

  Future<List> countries;

  Future<List> getCountries() async{
    var response = await Dio().get('https://restcountries.eu/rest/v2/all');
    return response.data;
  }

  @override
  void initState() {
    countries = getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(countries);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('Learn Countries',
            style: TextStyle(fontFamily: 'Andika New Basic'),
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
          child: FutureBuilder<List>(
            future: countries,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot){
              if(snapshot.hasData){
                return ListView.builder( itemBuilder: (BuildContext context,int index){
                  return GestureDetector(
                    onTap: ()
                    {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context)=> Country(snapshot.data[index]),
                      ));
                    },

                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),

                        child: Text(
                          snapshot.data[index]['name'],
                          style: TextStyle(fontSize: 18, fontFamily: 'Andika New Basic' ),
                        ),
                      ),
                    ),
                  );}

                );
              }
              return null;
            },
          ),
          /*child: ListView(children: [


        GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Country("Canada")
            ));
          },
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Text(
                'Canada',
                style: TextStyle(fontSize: 18, fontFamily: 'Andika New Basic' ),
              ),
            ),
          ),
        ),
      ]
      ),*/
        )
    );
  }
}
