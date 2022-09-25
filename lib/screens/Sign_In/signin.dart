import 'package:heal/authentication.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'signin2.dart';
import 'package:heal/screens/landingpage.dart';

class signin extends StatefulWidget {
  @override
  _signinState createState() => _signinState();
}

class _signinState extends State<signin> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<authentication>(
        create: (_) => authentication(FirebaseAuth.instance),
      ),
      StreamProvider(
        create: (context) => context.read<authentication>().authStateChanges,
      )
    ], child: AuthenticationWrapper());
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      Fluttertoast.showToast(msg: 'Already Logged In');
      return landingpage();
    } else {
      return signin2screen();
    }
  }
}
