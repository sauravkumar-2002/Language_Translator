import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:your_translator/screens/translateScreen.dart';



var currentAgeValue = 3;
class dashboardScreen extends StatefulWidget {


  @override
  State<dashboardScreen> createState() => _dashboardScreenState();
}

class _dashboardScreenState extends State<dashboardScreen> {
//blue --313586
//orange-- DE6739

  var myopacity = 0.0;


  @override
  void initState() {
    Timer(Duration(milliseconds: 450), () {
      setState(() {
        myopacity = 1.0;
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: AnimatedOpacity(
              opacity: myopacity,
              duration: Duration(seconds: 1),
              child: Container(


                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 12,),
                    Center(
                      child: Hero(
                          tag: "logo",
                          child: Image.asset('assets/images/trans.png',width: 150,height: 150,)),
                    ),
                    SizedBox(height: 18,),
                    Center(
                        child: Text("Your Translator",style: TextStyle(color: Colors.red,fontWeight:FontWeight.bold,fontSize: 24),)
                    ),
                    SizedBox(height: 18,),
                    Center(
                      child: Image.asset('assets/images/image_p.png',width: 240,height: 240,),
                    ),
                    SizedBox(height: 18,),
                    Center(
                      child: Text("Let's Make the Language\nEasy!! ",style: TextStyle(color: Colors.red,fontWeight:FontWeight.bold,fontSize: 24),)
                    ),
                    SizedBox(height: 38,),
                    Padding(
                      padding: const EdgeInsets.only(top: 26.0),
                      child: OutlinedButton(
                        onPressed: () {
                         gotoTranslatePage();

                        },
                        style: OutlinedButton.styleFrom(//<-- SEE HERE
                            side: BorderSide(width: 1.4),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),

                            backgroundColor: Color(0xffF8EBEBFF)
                        ),



                        child: Text('Continue  >> ',
                          style:TextStyle(fontSize: 17,color: Color(0Xff313586),fontWeight: FontWeight.bold),
                        ),
                        //Icon(Icons.arrow_forward_sharp,color: Color(0Xff313586),),


                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }

  void gotoTranslatePage() {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 2),
            pageBuilder: (_, __, ___) => TranslateScreen()));
  }
}





//Height picker

