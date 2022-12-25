import 'package:flutter/material.dart';
import 'package:quizapp/screens/home_screen.dart';

//create MyApp widget
class LoginPage extends StatelessWidget {
const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            child: Text("Login"),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return HomeScreen();
              }
              )
              );
            }
            ),
      ),
    );
  }
}
