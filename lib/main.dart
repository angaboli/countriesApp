import 'package:countries_app/pages/all_countries.dart';
import 'package:countries_app/pages/continent.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(fontFamily: 'Andika New Basic'),
  ));
}


class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home>{

  int _currentIndex = 0;
  final tabs = [
    Center(child: Text('Contient')),
    Center(child: Text('All countries')),
  ];

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Learn countries', )),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Continent',
                icon: Icon(Icons.map),
              ),
              Tab(
                text: 'All countries',
                icon: Icon(Icons.flag),
              )
            ],
          ),
        ),

      ),
    );
  }



}