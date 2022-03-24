import 'package:flutter/material.dart';
import 'package:howboutyou/models/user.dart';
import 'package:howboutyou/screens/authenticate/authenticate.dart';
import 'package:howboutyou/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<customUser?>(context);

    // return either home or auth
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
