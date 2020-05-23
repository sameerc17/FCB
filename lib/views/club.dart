import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Club extends StatefulWidget {
  @override
  _ClubState createState() => _ClubState();
}

bool isloading = true;
String s1 = '',
    s2 = '',
    s3 = '',
    s4 =
        'https://www.fcbarcelonanoticias.com/uploads/s1/20/14/47/fc-barcelona-201447.png';

class _ClubState extends State<Club> {
  @override
  void initState() {
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blueAccent,
              ),
            )
          : SafeArea(
            child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                    child: Column(
                      children: <Widget>[
                        Text('$s1',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.0)),
                        Image(
                          image: NetworkImage(s4),
                          fit: BoxFit.fitWidth,
                          height: 250.0,
                        ),
                        Text('$s2',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.0)),
                        Text('$s3',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.0)),
                      ],
                    ),
                  ),
                ),
              ),
          ),
    );
  }

  Future<void> getInfo() async {
    String url = "https://pure-bayou-11893.herokuapp.com/general";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == 200) {
      jsonData["clubInfo"].forEach((element) {
        setState(() {
          s1 = element["clubName"];
          s2 = element["managerName"];
          s3 = element["clubHistory"];
          isloading = false;
        });
      });
    } else
      print('lol');
  }
}
