import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(
          "Login Page",
          style: TextStyle(
              color: Colors.purple, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
