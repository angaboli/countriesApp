import 'package:countries_app/views/country.dart';
import 'package:flutter/material.dart';

class AllCountries extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Learn Countries',
          style: TextStyle(fontFamily: 'Andila New Basic'),
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
        child: ListView(children: [

          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Country()
              ));
            },

            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),

                child: Text(
                  'France',
                  style: TextStyle(fontSize: 18, fontFamily: 'Andika New Basic' ),
                ),
              ),
            ),
          ),
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Country()
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
      ),
      )
    );
  }
}
