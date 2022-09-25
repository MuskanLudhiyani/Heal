import 'package:flutter/material.dart';
import 'package:heal/database.dart';
import 'package:heal/models/patient.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class addPrescription extends StatefulWidget {
  @override
  _addPrescriptionState createState() => _addPrescriptionState();
  patient s;
  addPrescription(patient p) {
    s = p;
  }
}

class _addPrescriptionState extends State<addPrescription> {
  TextEditingController pname = TextEditingController();
  TextEditingController puid = TextEditingController();
  TextEditingController dname = TextEditingController();
  TextEditingController disease = TextEditingController();
  TextEditingController suggestion = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFF0F5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Patient's Name : ${widget.s.name}",
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff4C3C88),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat')),
          TextField(
              controller: dname,
              cursorColor: Color(0xff90E5BF),
              decoration: InputDecoration(
                  filled: true,
                  hintText: "Doctor's Name",
                  suffixIcon: GestureDetector(
                    child: Text(
                      "",
                      style: TextStyle(
                        color: Color(0xff90E5BF),
                      ),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  fillColor: Color(0xffFFFFFF),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ))),
          TextField(
              controller: disease,
              cursorColor: Color(0xff90E5BF),
              decoration: InputDecoration(
                  filled: true,
                  hintText: "Disease",
                  suffixIcon: GestureDetector(
                    child: Text(
                      "",
                      style: TextStyle(
                        color: Color(0xff90E5BF),
                      ),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  fillColor: Color(0xffFFFFFF),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ))),
          TextField(
              controller: suggestion,
              cursorColor: Color(0xff90E5BF),
              decoration: InputDecoration(
                  filled: true,
                  hintText: "Suggestion",
                  suffixIcon: GestureDetector(
                    child: Text(
                      "",
                      style: TextStyle(
                        color: Color(0xff90E5BF),
                      ),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  fillColor: Color(0xffFFFFFF),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ))),
          GestureDetector(
            onTap: () async {
              try {
                await DatabaseService().addPrescriptionToPatient(widget.s.puid,
                    widget.s.name, dname.text, disease.text, suggestion.text);
                Fluttertoast.showToast(msg: 'Added Prescription');
                Navigator.pop(context, true);
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
                      offset:
                          Offset(2.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text('Add Prescription',
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
      ),
    );
  }
}
