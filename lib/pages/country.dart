import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          ),
          children: <Widget>[
            Card(
              elevation: 10,
              margin: EdgeInsets.symmetric(vertical: 50, horizontal: 0),
              child: Center(
                child: SvgPicture.network(
                    country['flag'],
                  // height: 0.0,
                  width: 340.0,),
              )
            ),
            Card(
              elevation: 10,
              child: Center(
                child: Table(
                    children: [
                      TableRow(children: [
                        Text('Continent', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(country['region'], style: TextStyle(fontSize: 20))
                      ]),
                      TableRow(children: [
                        Text('Name', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(country['name'], style: TextStyle(fontSize: 20)),
                      ]),
                      TableRow(children: [
                        Text('Capital', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(country['capital'], style: TextStyle(fontSize: 20))
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
                ),
              ),
            )
            ]
        ),

        ),


    );
  }
}
