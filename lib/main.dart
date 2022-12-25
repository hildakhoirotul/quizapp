import 'package:flutter/material.dart';
import 'package:quizapp/login_page.dart';
import 'package:quizapp/screens/home_screen.dart';
// import 'package:quizapp/screens/login_screen.dart';

//run main method
void main() {
  //runapp method
  runApp(
    const MyApp(),
  );
}

//create MyApp widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //remove debug banner
      debugShowCheckedModeBanner: false,
      // set homepage
      // home: HomeScreen(),
      home: LoginPage(),
    );
  }
}
