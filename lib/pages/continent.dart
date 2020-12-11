
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Continent extends StatefulWidget{
  @override
  _ContinentState createState() => _ContinentState();

}

class _ContinentState extends State<Continent>{
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
          ),),
      ),
    );
  }
}

