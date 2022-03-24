import 'package:flutter/material.dart';
import 'package:howboutyou/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: Text("HowBoutYou"),
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0.0,
        actions: <Widget>[
          ElevatedButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text("Log out"))
        ],
      ),
    );
  }
}
