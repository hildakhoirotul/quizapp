import 'package:flutter/material.dart';
// import 'package:quizapp/screens/login_screen.dart';

//create MyApp widget
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main Page"),),
      body: Center(
        child: ElevatedButton(child: Text("Start Quiz"), onPressed: () {}),
      ),
    );
  }
}
