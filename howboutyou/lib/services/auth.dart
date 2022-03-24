import 'package:firebase_auth/firebase_auth.dart';
import 'package:howboutyou/models/user.dart';

class AuthService {
  // underscore signals private property
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object from Firebase user
  customUser? _userFromFirebaseUser(User? user) {
    return user != null ? customUser(uID: user.uid) : null;
  }

  // change user stream
  Stream<customUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential credential = await _auth.signInAnonymously();
      User? user = credential.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  // sign in w/ email

  // register w/ email

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {}
  }
}
