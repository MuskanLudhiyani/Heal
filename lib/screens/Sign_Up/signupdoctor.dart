import 'package:heal/screens/landingpagedoctor.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:heal/database.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class signupdoctor extends StatefulWidget {
  @override
  _signupdoctorState createState() => _signupdoctorState();
}

class _signupdoctorState extends State<signupdoctor> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController speciality = TextEditingController();
  String _gender;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            backgroundColor: Color(0xffEFF0F5),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text('Doctor',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat')),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Color(0xff4C3C88), Colors.red]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
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
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          fillColor: Color(0xffFFFFFF),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                const BorderRadius.all(
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
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          fillColor: Color(0xffFFFFFF),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                const BorderRadius.all(
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
                                      controller: address,
                                      cursorColor: Color(0xff90E5BF),
                                      decoration: InputDecoration(
                                          filled: true,
                                          hintText: "Address",
                                          suffixIcon: GestureDetector(
                                            child: Text(
                                              "",
                                              style: TextStyle(
                                                color: Color(0xff90E5BF),
                                              ),
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          fillColor: Color(0xffFFFFFF),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                const BorderRadius.all(
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
                                      controller: speciality,
                                      cursorColor: Color(0xff90E5BF),
                                      decoration: InputDecoration(
                                          filled: true,
                                          hintText: "Speciality",
                                          suffixIcon: GestureDetector(
                                            child: Text(
                                              "",
                                              style: TextStyle(
                                                color: Color(0xff90E5BF),
                                              ),
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          fillColor: Color(0xffFFFFFF),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                const BorderRadius.all(
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
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      dropdownColor: Colors.white,
                                      value: _gender,
                                      style: TextStyle(color: Colors.white),
                                      items: <String>["M", "F"]
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                                color: Colors.black54),
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
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          fillColor: Color(0xffFFFFFF),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                const BorderRadius.all(
                                              const Radius.circular(10.0),
                                            ),
                                          ))),
                                ),
                              ),

                              SizedBox(
                                height: 10.0,
                              ),
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
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          hintText: "Password",
                                          fillColor: Color(0xffFFFFFF),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                const BorderRadius.all(
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
                                onTap: () async {
                                  try {
                                    final newuser = await _auth
                                        .createUserWithEmailAndPassword(
                                            email: email, password: password);
                                    newuser.user.sendEmailVerification();
                                    await DatabaseService(uid: newuser.user.uid)
                                        .updateDoctorData(
                                            newuser.user.uid,
                                            name.text,
                                            _gender,
                                            phoneNumber.text,
                                            address.text,
                                            speciality.text);

                                    if (newuser != Null) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  (landingpagedoctor())));
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
                                          offset: Offset(2.0,
                                              2.0), // shadow direction: bottom right
                                        )
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Center(
                                          child: Text('Sign Up',
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
                                height: 20,
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            )));
  }
}
