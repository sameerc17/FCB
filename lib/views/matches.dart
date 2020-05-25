import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forcabarca/models/matchmodel.dart';
import 'package:http/http.dart' as http;

class Matches extends StatefulWidget {
  @override
  _MatchesState createState() => _MatchesState();
}

bool isLoading = true;
String s1 = '', s2 = '', s3 = '', s4 = '';
int b = 0, o = 0;
List<Matchmodel> list = [];

class _MatchesState extends State<Matches> {
  @override
  void initState() {
    super.initState();
    getMatches();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xff91000f),
                  Color(0xff1d2671),
                ],
              ),
            ),
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blueAccent,
              ),
            ),
          )
        : SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff91000f),
                    Color(0xff1d2671),
                  ],
                ),
              ),
              padding: EdgeInsets.only(top: 8.0),
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Tiler(
                        title: list[index].title,
                        competition: list[index].competition,
                        date: list[index].date,
                        opponent: list[index].opponent,
                        barcelonaGoals: list[index].barcelonaGoals,
                        oppositionGoals: list[index].oppositionGoals);
                  }),
            ),
          );
  }

  Future<void> getMatches() async {
    String url = "https://pure-bayou-11893.herokuapp.com/results/";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == 200) {
      jsonData["results"].forEach((element) {
        Matchmodel matchmodel = new Matchmodel(
            title: element["title"],
            competition: element["competition"],
            date: element["date"],
            opponent: element["opponent"],
            barcelonaGoals: element["barcelonaGoals"],
            oppositionGoals: element["oppositionGoals"]);
        list.add(matchmodel);
      });
      print(list.length);
    } else
      print('lol');
    setState(() {
      isLoading = false;
    });
  }
}

class Tiler extends StatelessWidget {
  final String title, competition, date, opponent;
  final int barcelonaGoals, oppositionGoals;

  Tiler(
      {this.title,
      this.competition,
      this.date,
      this.opponent,
      this.barcelonaGoals,
      this.oppositionGoals});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff414141), Color(0xff000000)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              getTitle(title),
              style: TextStyle(fontSize: 17.0, color: Colors.white),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              getComp(competition),
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Date: " + date,
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Score: " +
                  barcelonaGoals.toString() +
                  "-" +
                  oppositionGoals.toString(),
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  String getComp(String c) {
    if (c == "uefa-champions-league") return "Uefa Champions League";
    return "La Liga";
  }

  String getTitle(String t) {
    return t;
  }
}
