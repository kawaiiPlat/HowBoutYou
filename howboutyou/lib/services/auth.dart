import 'package:firebase_auth/firebase_auth.dart';
import 'package:howboutyou/models/user.dart';
import 'package:howboutyou/services/database.dart';

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
  Future signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register w/ email
  Future registerWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      await DatabaseService(uid: user!.uid).updateUserData('New User');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {}
  }
}
