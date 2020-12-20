import 'package:countries_app/pages/all_countries.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Continent extends StatefulWidget{
  @override
  _ContinentState createState() => _ContinentState();

}

class _ContinentState extends State<Continent>{


  AllCountries countries;


/*
  Future<List> getCountries() async{
    var response = await Dio().get('https://restcountries.eu/rest/v2/all');
    return response.data;
  }

  @override
  void initState() {
    countries = getCountries();
    super.initState();
  }
*/


  @override
  Widget build(BuildContext context) {
    //print(countries);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Learn Countries',
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1608268627603-6e5f75aa7fe3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
            fit: BoxFit.cover,
          ),
        ),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            ContinentCard(title: 'Africa', image: 'africa.png'),
            ContinentCard(title: 'Asia', image: 'asia.png'),
            ContinentCard(title: 'Europe', image: 'europe.png'),
            ContinentCard(title: 'North America', image: 'northAmerica.png'),
            ContinentCard(title: 'Oceania', image: 'oceania.png'),
            ContinentCard(title: 'South America', image: 'southAmerica.png'),

          ],
        ),
      ),
    );
  }
}

class ContinentCard extends StatelessWidget {
  final String title;
  final String image;

  const ContinentCard({
    Key key,
    this.title,
    this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.transparent,
      child: Container(
        child: Center(
            child: Text(title, style: TextStyle(color: Colors.blue, backgroundColor: Colors.white, fontSize: 20,
                fontWeight: FontWeight.bold),
            )
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/'+image), fit: BoxFit.fitWidth, alignment: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}

