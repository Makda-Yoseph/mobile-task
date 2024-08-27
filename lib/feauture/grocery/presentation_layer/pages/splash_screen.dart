
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget{
  SplashScreen({super.key});
  @override
  State<SplashScreen>createState()=>SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
     Future.delayed(Duration(seconds: 5), () {
      Navigator.pushNamed(context, '/homepage');
      dispose();
    });
  }
  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays:SystemUiOverlay.values);
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/foodimg.jpeg'),
            fit: BoxFit.cover
            )
        ),
        child: Container(
          padding: EdgeInsets.only(top: 100),
          width: double.infinity,
          height: double.infinity,
          
          child: Center(
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(left: 10,right: 10,top:200,bottom: 50),
              child: Column(
                children: [
                  SizedBox(
                    height: 111,
                  ),
                  Container(
                    width:200,
                    height: 115,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text('Welcome',style: GoogleFonts.roboto(
                        letterSpacing: 2.5,
                          color: Color.fromRGBO(255, 255, 255, 1),  
                          fontSize: 1000, 
                        ),
                        
                        textAlign: TextAlign.center,
                        ),
                    ),
                    
                    
                  ),
                    Text(' SPEEDY CHOW',style: GoogleFonts.roboto(color:Colors.white,fontSize: 36),)
                    ],
                
              ),
            ),
          ),
        ),
      ),
    );
  }
}