import 'dart:collection';
import 'dart:math';

import 'package:countries_app/pages/all_countries.dart';
import 'package:countries_app/pages/country.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../continent_card.dart';

class RandomCountry extends StatefulWidget{
  @override
  _RandomCountryState createState() => _RandomCountryState();

}

class _RandomCountryState extends State<RandomCountry>{

  List countries = [];
  List filteredContinent = [];

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

  List _filterContinent(value){
    setState(() {
      filteredContinent =
          countries.where((country) => country['region'] ==  value ).toList();
    });
    return filteredContinent;
  }



  @override
  Widget build(BuildContext context) {
    var rng = new Random();
    for(var country in countries){
      print(rng.nextInt(countries.length));
      print(country);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Learn Countries',
        ),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://images.unsplash.com/photo-1598292977405-b31b7062aeee?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
              fit: BoxFit.cover,
            ),
          ),
          child: GridView(

           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
            ),
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: -80),
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.blueGrey.withOpacity(.2),
                            Colors.blueGrey.withOpacity(.1),
                          ]
                      )
                  ),
                  child: Center(
                   // child: SvgPicture.network(
                     // country['flag'],
                      // height: 0.0,
                     // width: 340.0,),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.blueGrey.withOpacity(.4),
                            Colors.blueGrey.withOpacity(.2),
                          ]
                      )
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      /*child: Table(
                          children: [
                            TableRow(children: [
                              Text('Name', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              Text(country['name'], style: TextStyle(fontSize: 20)),
                            ]),
                            TableRow(children: [
                              Text('Capital', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              Text(country['capital'], style: TextStyle(fontSize: 20))
                            ]),
                            TableRow(children: [
                              Text('Continent', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              Text(country['region'], style: TextStyle(fontSize: 20))
                            ]),
                            TableRow(children: [
                              Text('Population', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              Text(country['population'].toString(), style: TextStyle(fontSize: 20))
                            ]),
                            TableRow(children: [
                              Text('Area', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              Text(country['area'].toString(), style: TextStyle(fontSize: 20))
                            ]),
                            TableRow(children: [
                              Text('TimeZone', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              Text(country['timezones'].toString(), style: TextStyle(fontSize: 20))
                            ]),
                            TableRow(children: [
                              Text('Currency', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              Text(country['currencies'][0]['name'], style: TextStyle(fontSize: 20))
                            ]),
                          ]
                      ),*/
                    ),
                  ),
                )
              ]
          ),
      ),
      );
  }
}