import 'dart:async';
import 'package:flutter/material.dart';
import 'StartPage.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor:Colors.blue,
    accentColor: Colors.blueAccent,
    fontFamily: 'Caveat',
  ),
  debugShowCheckedModeBanner: false,
  home: SplashScreen(),
));

class SplashScreen extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();

    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 10), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => StartPage()));
  }
//  final String assetName = 'assets/hoome.svg';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          FlareActor(
            'assets/splash.flr',
            fit: BoxFit.cover,
            animation: 'rest',
          ),
          Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width - 256.0),
//              padding: EdgeInsets.all(0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Tata Usaha',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 32.0
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width - 256.0),
            child:Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  CircularProgressIndicator(
                    backgroundColor: Colors.lightGreenAccent,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'LA! product',
                    style: TextStyle(
                        color: Colors.white54
                    ),
                  )
                ],
              ),
            ),),
        ],
      ),
    );
  }
}
