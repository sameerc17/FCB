import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class UCL extends StatefulWidget {
  @override
  _UCLState createState() => _UCLState();
}

bool isLoading=true;
String s1='',s2='',s3='',s4='';
int b=0,o=0;

class _UCLState extends State<UCL> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<void> getUcl() async {
    String url = "https://pure-bayou-11893.herokuapp.com/results/uefa-champions-league";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == 200) {
      jsonData["clubInfo"].forEach((element) {
        s1=element[0];

      });
    } else
      print('lol');
  }
}
