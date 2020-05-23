import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:forcabarca/models/playermodel.dart';
import 'package:http/http.dart' as http;

class Players extends StatefulWidget {
  @override
  _PlayersState createState() => _PlayersState();
}

bool isLoading = true;

class _PlayersState extends State<Players> {
  List<Playermodel> list = [];
  Playermodel playermodel;

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blueAccent,
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
                          fullName: list[index].fullName,
                          popularName: list[index].popularName,
                          nationality: list[index].nationality,
                          dateOfBirth: list[index].dateOfBirth,
                          position: list[index].position,
                          description: list[index].description,
                          imageURL: list[index].imageURL,
                          age: list[index].age,
                          weight: list[index].weight,
                          height: list[index].height,
                          shirtNumber: list[index].shirtNumber);
                    }),
              ),
            ),
    );
  }

  Future<void> getInfo() async {
    String url = "https://pure-bayou-11893.herokuapp.com/players";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == 200) {
      jsonData["players"].forEach((element) {
        playermodel = Playermodel(
            fullName: element["fullName"],
            popularName: element["popularName"],
            nationality: element["nationality"],
            age: element["age"],
            dateOfBirth: element["dateOfBirth"],
            weight: element["weight"],
            height: element["height"],
            shirtNumber: element["shirtNumber"],
            position: element["position"],
            description: element["description"],
            imageURL: element["imageURL"]);
        list.add(playermodel);
      });
      print(list.length);
    }
    setState(() {
      isLoading = false;
    });
  }
}

class Tiler extends StatelessWidget {
  final String fullName,
      popularName,
      nationality,
      dateOfBirth,
      position,
      description,
      imageURL;
  final int age, weight, height, shirtNumber;

  Tiler(
      {this.fullName,
      this.popularName,
      this.nationality,
      this.age,
      this.dateOfBirth,
      this.weight,
      this.height,
      this.shirtNumber,
      this.position,
      this.description,
      this.imageURL});

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
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Image(
                    image: NetworkImage(imageURL),
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    fullName,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xfffaa907),
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
//                  Text('Date of birth: '+dateOfBirth,style: TextStyle(fontSize: 18.0),),
//                  Text('Nationality: '+nationality,style: TextStyle(fontSize: 18.0),),
//                  Text('Position: '+position,style: TextStyle(fontSize: 18.0),),
                  Text(
                    getDesc(description),
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getDesc(String d) {
    if (d.substring(d.length - 1, d.length) != ".") d += ".";
    if (d.length < 300) return d;
    String ss = d.substring(0, 300);
    for (int i = 300;; i++) {
      ss += d.substring(i, i + 1);
      if (d.substring(i, i + 1) == ".") break;
    }
    return ss;
  }
}
