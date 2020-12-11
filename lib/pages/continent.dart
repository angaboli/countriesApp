
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Continent extends StatefulWidget{
  @override
  _ContinentState createState() => _ContinentState();

}

class _ContinentState extends State<Continent>{

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
          ),
        ),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            ContinentCard(title: 'Africa'),
            ContinentCard(title: 'America'),
            ContinentCard(title: 'Asia'),
            ContinentCard(title: 'Europe'),

         ],
        ),
      ),
    );
  }
}

class ContinentCard extends StatelessWidget {
  final String title;
  const ContinentCard({
    Key key,
    this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        child: Center(child: Text(title,
          style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold),
        )
        ),
    );
  }
}

