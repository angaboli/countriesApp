import 'package:countries_app/pages/all_countries.dart';
import 'package:countries_app/pages/continent.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: new Continent(),
  ));
}


class _HomePage extends StatefulWidget {
  // This widget is the root of your application.
  //final continentPageKey = GlobalKey<_ContinentState>();
  final continent = List<Continent>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Learn Countries',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: DefaultTabController(
          length: 2,
          initialIndex: 1,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Learn Countries"),
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: "Continents",
                  ),
                  Tab(
                    text: "All Countries",
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: [
              /*Continent(key: continentPageKey, continent: this.continent,),
              AllCountries(key: allCountriesPageKey, allCountries: this.allCountries),*/
              ],
            ),
          ),
        ));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}



