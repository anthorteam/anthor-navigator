import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, "/home/details");
            },
            child: Text("Go to details"),
          ),
        ),
      ),
    );
  }
}
