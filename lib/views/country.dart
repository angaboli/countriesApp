import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  var name;
  Country(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(name),
      ),
    );
  }
}
