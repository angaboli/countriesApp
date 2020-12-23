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
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
          ),
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 0),
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
                child: SvgPicture.network(
                    country['flag'],
                  // height: 0.0,
                  width: 340.0,),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0),
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
                  child: Table(
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
                  ),
                ),
              ),
            )
            ]
        ),

        ),


    );
  }
}
