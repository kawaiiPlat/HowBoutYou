import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:howboutyou/services/auth.dart';
import 'package:howboutyou/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: DatabaseService().usersStream,
      initialData: null,
      child: Scaffold(
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new SizedBox(
                width: 300.0,
                height: 80.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {},
                  child: const Text('Create Event'),
                ),
              ),
              new SizedBox(height: 50.0),
              new SizedBox(
                width: 300.0,
                height: 80.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {},
                  child: const Text('View Event'),
                ),
              ),
              new SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
