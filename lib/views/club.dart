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
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      child: Column(
                        children: <Widget>[
                          Text('$s1',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0)),
                          Image(
                            image: NetworkImage(s4),
//                          fit: BoxFit.fitWidth,
                            height: 250.0,
                          ),
                          Container(
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
                              child: Text('$s2',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0)),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
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
                              child: Text('$s3',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0)),
                            ),
                          ),
                        ],
                      ),
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
