import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  var country;
  Country(this.country);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(country['name']),
      ),
      body: ,
    );
  }
}
