import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class forgotscreen extends StatefulWidget {
  @override
  _forgotscreenState createState() => _forgotscreenState();
}

class _forgotscreenState extends State<forgotscreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: Color(0xffEFF0F5),
          body: SingleChildScrollView(
            child: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xff4C3C88), Colors.red]),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    color: Color(0xff9994FA),
                  ),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-vlGCMM_L_kr6c7zS7JIkAjBwuMlfDz3UXg&usqp=CAU"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      height: 250,
                      width: 250,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Theme(
                    data: ThemeData(
                      primaryColor: Color(0xffFFFFFF),
                      primaryColorDark: Color(0xffFFFFFF),
                    ),
                    child: TextField(
                        controller: email,
                        cursorColor: Color(0xff90E5BF),
                        decoration: InputDecoration(
                            filled: true,
                            hintText: "Email",
                            suffixIcon: GestureDetector(
                              child: Text(
                                "",
                                style: TextStyle(
                                  color: Color(0xff90E5BF),
                                ),
                              ),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            fillColor: Color(0xffFFFFFF),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                            ))),
                  ),
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                    _auth.sendPasswordResetEmail(email: email.text);
                    Fluttertoast.showToast(msg: 'Check your inbox');
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 1.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffF0EFFE),
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(
                                2.0, 2.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text('Forgot Password',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff4C3C88),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat')),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
          )),
    );
  }
}
