import 'package:flutter/material.dart';
import 'package:heal/authentication.dart';
import 'package:provider/provider.dart';
import 'package:heal/screens/Sign_In/forgot.dart';

class signin2screen extends StatefulWidget {
  @override
  _signin2screenState createState() => _signin2screenState();
}

class _signin2screenState extends State<signin2screen> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();




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
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Theme(
                    data: ThemeData(
                      primaryColor: Color(0xffFFFFFF),
                      primaryColorDark: Color(0xffFFFFFF),
                    ),
                    child: TextField(
                        obscureText: true,
                        controller: password,
                        cursorColor: Color(0xff90E5BF),
                        decoration: InputDecoration(
                            filled: true,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            hintText: "Password",
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

                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    context.read<authentication>().signIn(
                          email: email.text.trim(),
                          pass: password.text.trim(),
                        );
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
                            child: Text('Sign In',
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
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => forgotscreen()));
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
