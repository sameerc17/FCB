import 'package:flutter/material.dart';

import 'views/club.dart';
import 'views/players.dart';
import 'views/ucl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  print('Clicked');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Club(),
                    ),
                  );
                },
                child: Wrap(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'About the club',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: (){
                  print('Clicked');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Players(),
                    ),
                  );
                },
                child: Wrap(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'About the players',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Wrap(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Recent La Liga results',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: (){
                  print('Clicked');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UCL(),
                    ),
                  );
                },
                child: Wrap(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Recent UEFA Champions League results',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Wrap(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Recent Copa Del Rey results',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
