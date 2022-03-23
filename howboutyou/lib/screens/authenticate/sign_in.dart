import 'package:flutter/material.dart';
import 'package:howboutyou/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('HowBoutYou'),
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
            new SizedBox(
              width: 300.0,
              height: 80.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  dynamic result = await _auth.signInAnon();
                  if (result == null) {
                    print("error signing in");
                  } else {
                    print("signed in");
                    print("user ID:" + result.uID);
                  }
                },
                child: const Text('Sign in anon'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
