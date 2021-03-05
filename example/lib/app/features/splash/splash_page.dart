import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, "/home");
            },
            child: Text("Go to home"),
          ),
        ),
      ),
    );
  }
}
