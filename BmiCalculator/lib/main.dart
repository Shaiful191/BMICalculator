import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0A0D22),
        scaffoldBackgroundColor: Color(0xff1D1F33),
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
        //accentColor: Colors.purple,
        
       

      ),

      debugShowCheckedModeBanner: false,
      title: 'Demeo pp',
       home: HomePage(),
       );
  }
}


