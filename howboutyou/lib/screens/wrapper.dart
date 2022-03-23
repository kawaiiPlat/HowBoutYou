import 'package:flutter/material.dart';
import 'package:howboutyou/screens/authenticate/authenticate.dart';
import 'package:howboutyou/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return either home or auth
    return Authenticate();
  }
}
