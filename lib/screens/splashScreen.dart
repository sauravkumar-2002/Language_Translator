import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:your_translator/screens/Dashboard_Screen.dart';


import '../main.dart';

class splashScreen extends StatefulWidget{

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  var _width=210.0;

  var _height=210.0;



  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 1),(){
      sendToLoginScreen();
    });

  }

  @override
  Widget build(BuildContext context) {

/*
    return Hero(

      tag: "logo",
      child: AnimatedSplashScreen(
        splash: 'assets/images/logo.png',
        duration: 2000,
        curve: Curves.bounceOut ,
        nextScreen: loginScreen(),
        splashTransition: SplashTransition.scaleTransition,
      ),
    );
      */

    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        child: Center(
            child: Hero(
              tag: "logo",
                child: Image.asset('assets/images/trans.png',width: _width,height: _height,)),

            
          ),
        ),
      );


  }

  void sendToLoginScreen() {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 2),
            pageBuilder: (_, __, ___) => dashboardScreen()));
  }
}