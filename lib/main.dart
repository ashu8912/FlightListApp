import "package:flutter/material.dart";
import './screens/HomeScreen.dart';

void main(){
  runApp(MyApp());
}
ThemeData appTheme =
    ThemeData(primaryColor: Color(0xFFF3791A), fontFamily: 'Oxygen');
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
           home:HomeScreen(),
           theme: appTheme,
           debugShowCheckedModeBanner: false,
    );
  }
      
}