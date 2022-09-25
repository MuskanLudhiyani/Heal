import 'package:heal/screens/landingpagepatient.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:heal/database.dart';
import 'package:fluttertoast/fluttertoast.dart';

class signuppatient extends StatefulWidget {
  @override
  _signuppatientState createState() => _signuppatientState();
}

class _signuppatientState extends State<signuppatient> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController bloodgroup = TextEditingController();
  TextEditingController trustedContact1 = TextEditingController();
  TextEditingController trustedContact2 = TextEditingController();
  TextEditingController trustedContact3 = TextEditingController();
  String _gender;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            backgroundColor: Color(0xffEFF0F5),
            body: SingleChildScrollView(

              child:Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 50,),
                    Text("Patient",
                        style: TextStyle(
                            fontSize: 30,
                            color:Colors.red,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat')),
                    SizedBox(height: 20,),

                    Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xff4C3C88), Colors.red]),
                          borderRadius: BorderRadius.all(Radius.circular(10)),),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 40,
                            ),

                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Theme(
                                data: ThemeData(
                                  primaryColor: Color(0xffFFFFFF),
                                  primaryColorDark: Color(0xffFFFFFF),
                                ),
                                child: TextField(
                                    controller: name,
                                    cursorColor: Color(0xff90E5BF),
                                    decoration: InputDecoration(
                                        filled: true,
                                        hintText: "Name",
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
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Theme(
                                data: ThemeData(
                                  primaryColor: Color(0xffFFFFFF),
                                  primaryColorDark: Color(0xffFFFFFF),
                                ),
                                child: TextField(
                                    controller: phoneNumber,
                                    cursorColor: Color(0xff90E5BF),
                                    decoration: InputDecoration(
                                        filled: true,
                                        hintText: "Phone Number",
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
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Theme(
                                data: ThemeData(
                                  primaryColor: Color(0xffFFFFFF),
                                  primaryColorDark: Color(0xffFFFFFF),
                                ),
                                child: TextField(
                                    controller: bloodgroup,
                                    cursorColor: Color(0xff90E5BF),
                                    decoration: InputDecoration(
                                        filled: true,
                                        hintText: "Blood Group",
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
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Theme(
                                    data: ThemeData(
                                      primaryColor: Color(0xffFFFFFF),
                                      primaryColorDark: Color(0xffFFFFFF),
                                    ),
                                    child: Container(
                                      width: 150,
                                      child: TextField(
                                          controller: age,
                                          cursorColor: Color(0xff90E5BF),
                                          decoration: InputDecoration(
                                              filled: true,
                                              hintText: "Age",
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
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 0,0, 0),
                                      child: DropdownButton<String>(
                                        focusColor: Colors.black54,
                                        isExpanded: true,
                                        value: _gender,
                                        elevation: 5,
                                        style: TextStyle(color: Colors.white),
                                        items: <String>["M", "F"]
                                            .map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(color: Colors.black54),
                                            ),
                                          );
                                        }).toList(),
                                        hint: Text(
                                          "Gender",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        onChanged: (String value) {
                                          setState(() {
                                            _gender = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Theme(
                                data: ThemeData(
                                  primaryColor: Color(0xffFFFFFF),
                                  primaryColorDark: Color(0xffFFFFFF),
                                ),
                                child: TextField(
                                    onChanged: (value) {
                                      email = value;
                                    },
                                    keyboardType: TextInputType.emailAddress,
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
                                    onChanged: (value) {
                                      password = value;
                                    },
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
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Theme(
                                data: ThemeData(
                                  primaryColor: Color(0xffFFFFFF),
                                  primaryColorDark: Color(0xffFFFFFF),
                                ),
                                child: TextField(
                                    controller: trustedContact1,
                                    cursorColor: Color(0xff90E5BF),
                                    decoration: InputDecoration(
                                        filled: true,
                                        hintText: "Trusted Contact 1",
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
                                    controller: trustedContact2,
                                    cursorColor: Color(0xff90E5BF),
                                    decoration: InputDecoration(
                                        filled: true,
                                        hintText: "Trusted Contact 2",
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
                                    controller: trustedContact3,
                                    cursorColor: Color(0xff90E5BF),
                                    decoration: InputDecoration(
                                        filled: true,
                                        hintText: "Trusted Contact 3",
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

                            // SizedBox(height: 10.0),
                            // Padding(
                            //   padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            //   child: Theme(
                            //     data: ThemeData(
                            //       primaryColor: Color(0xffFFFFFF),
                            //       primaryColorDark: Color(0xffFFFFFF),
                            //     ),
                            //     child: TextField(
                            //         obscureText: true,
                            //         controller: cpassword,
                            //         cursorColor: Color(0xff90E5BF),
                            //         decoration: InputDecoration(
                            //             filled: true,
                            //             contentPadding:
                            //             EdgeInsets.symmetric(horizontal: 15),
                            //             hintText: "Confirm Password",
                            //             fillColor: Color(0xffFFFFFF),
                            //             border: OutlineInputBorder(
                            //               borderSide: BorderSide.none,
                            //               borderRadius: const BorderRadius.all(
                            //                 const Radius.circular(10.0),
                            //               ),
                            //             ))),
                            //   ),
                            // ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap:  () async {
                                // print(email);
                                // print(password);
                                try {
                                  final newuser =
                                  await _auth.createUserWithEmailAndPassword(
                                      email: email, password: password);
                                  newuser.user.sendEmailVerification();
                                  await DatabaseService(uid: newuser.user.uid)
                                      .updatePatientData(
                                        newuser.user.uid,
                                      name.text,
                                      int.parse(age.text),
                                      _gender,
                                      phoneNumber.text,
                                      bloodgroup.text,
                                  trustedContact2.text,
                                  trustedContact1.text,
                                  trustedContact3.text);

                                  if (newuser != Null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                landingpagepatient()));
                                  }
                                } on FirebaseException catch (e) {
                                  Fluttertoast.showToast(msg: e.message);
                                  print(e);
                                }
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
                                        child: Text('Sign Up',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color:Color(0xff4C3C88),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat')),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),


                            SizedBox(
                              height: 20,
                            ),
                          ],
                        )),

                  ],
                ),
              ),


            )));
  }
}
