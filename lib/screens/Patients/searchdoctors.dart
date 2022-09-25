import 'package:flutter/material.dart';
import 'package:heal/models/doctor.dart';
import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:heal/models/patient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'about.dart';
import 'package:provider/provider.dart';
import 'package:heal/database.dart';

class searchd extends StatefulWidget {
  @override
  _searchdState createState() => _searchdState();
}

class _searchdState extends State<searchd> {
  @override
  List<doctor> appoints = [];
  TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<doctor>>.value(
      value: DatabaseService().doctorlist,
      initialData: [],
      builder: (context, patient) {
        return plist(context);
      },
    );
  }

  Widget plist(BuildContext context) {
    final appoints = Provider.of<List<doctor>>(context);
    return new Scaffold(
      backgroundColor: Color(0xffEFF0F5),
      body: Container(
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
                              print(appoints[index].duid);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        (avc(appoints[index]))),
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
                    } else if (appoints[index]
                            .name
                            .toLowerCase()
                            .contains(controller.text) ||
                        appoints[index]
                            .name
                            .toLowerCase()
                            .contains(controller.text) ||
                        appoints[index]
                            .speciality
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
                                          avc(appoints[index])));
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
                            height: 20,
                          )
                        ],
                      );
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
