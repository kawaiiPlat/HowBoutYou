import 'package:flutter/material.dart';
import 'package:howboutyou/services/auth.dart';
import 'package:howboutyou/shared/constants.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _inputKey = GlobalKey<FormState>();
  // text field state
  String email = '';
  String password = '';
  String error = '';

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
                  key: _inputKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val!.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Password'),
                        validator: (val) => val!.length < 8
                            ? 'Enter a password that is 8 characters or longer'
                            : null,
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
                            if (_inputKey.currentState!.validate()) {
                              dynamic result =
                                  await _auth.signInWithEmail(email, password);
                              if (result == null) {
                                setState(() => error =
                                    'Could not sign in with those credentials');
                              }
                            }
                          },
                          child: Text("Sign in")),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
