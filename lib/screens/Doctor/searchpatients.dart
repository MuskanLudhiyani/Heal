import 'package:heal/database.dart';
import 'package:heal/screens/Doctor/aboutpatient.dart';
import 'package:heal/screens/Doctor/appointments.dart';
import 'package:heal/screens/Doctor/presp.dart';
import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:heal/models/patient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'addprescriptions.dart';
import 'addprescriptions.dart';

class searchp extends StatefulWidget {
  @override
  _searchpState createState() => _searchpState();
}

class _searchpState extends State<searchp> {
  List<patient> appoints = [];
  TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<patient>>.value(
      value: DatabaseService().patientlist,
      initialData: [],
      builder: (context, patient) {
        return plist(context);
      },
    );
  }

  Widget plist(BuildContext context) {
    final appoints = Provider.of<List<patient>>(context);
    return new Scaffold(
      backgroundColor: Color(0xffEFF0F5),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Colors.white, style: BorderStyle.solid, width: 1.0),
          color: Color(0xffEFF0F5),
          boxShadow: [
            BoxShadow(
              color: Color(0xffF0EFFE),
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
          ],
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Theme(
                data: ThemeData(
                  primaryColor: Color(0xffFFFFFF),
                  primaryColorDark: Color(0xffFFFFFF),
                ),
                child: TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      setState(() {});
                    },
                    controller: controller,
                    cursorColor: Color(0xff90E5BF),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        hintText: "Search",
                        contentPadding: EdgeInsets.zero,
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                        suffixIcon: GestureDetector(
                          child: Text(
                            "",
                            style: TextStyle(
                              color: Color(0xff90E5BF),
                            ),
                          ),
                        ),
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
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: appoints.length,
                  itemBuilder: (context, index) {
                    if (controller.text.isEmpty) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        (ap(appoints[index]))),
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
                                      offset: Offset(2.0,
                                          2.0), // shadow direction: bottom right
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Text('${appoints[index].name}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Color(0xff4C3C88),
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Montserrat')),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      );
                      //   ListTile(
                      //   title:
                      //   Text(' '),
                      // );
                    } else if (appoints[index]
                            .name
                            .toLowerCase()
                            .contains(controller.text) ||
                        appoints[index]
                            .name
                            .toLowerCase()
                            .contains(controller.text)) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        (ap(appoints[index]))),
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
                                      offset: Offset(2.0,
                                          2.0), // shadow direction: bottom right
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Text('${appoints[index].name}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Color(0xff4C3C88),
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Montserrat')),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      );
                      GestureDetector(
                        onTap: () {},
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: Text('${appoints[index].name}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xff4C3C88),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat')),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                      //   ListTile(
                      //   title:
                      //   Text('${appoints[index].name} '),
                      // );
                    } else {
                      return Container();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
