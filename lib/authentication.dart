import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:core';

class authentication {
  final FirebaseAuth _firebaseAuth;
  authentication(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signIn({String email, String pass}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: pass);
      Fluttertoast.showToast(msg: 'Logged In successfully');
      return 'Success';
    } on FirebaseException catch (e) {
      Fluttertoast.showToast(msg: e.message);
      return e.message;
    }
  }

  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
