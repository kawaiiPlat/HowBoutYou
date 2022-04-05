import 'package:flutter/material.dart';
import 'package:howboutyou/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign in to HowBoutYou'),
        actions: <Widget>[
          ElevatedButton.icon(
            onPressed: () => widget.toggleView(),
            icon: Icon(Icons.person),
            label: Text('Register'),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new SizedBox(
                width: 300.0,
                //height: 64.0,
                child: Form(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.pinkAccent),
                              textStyle: MaterialStateProperty.all(
                                  TextStyle(color: Colors.white))),
                          onPressed: () async {
                            print(email);
                            print(password);
                          },
                          child: Text("Sign in"))
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
