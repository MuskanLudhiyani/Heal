import 'package:heal/models/prescription.dart';
import 'package:flutter/material.dart';
import 'package:heal/database.dart';
import 'package:flutter/material.dart';
import 'package:heal/models/patient.dart';
import 'package:provider/provider.dart';

class presp2 extends StatefulWidget {
  @override
  _presp2State createState() => _presp2State();
  patient s;
  presp2(patient p) {
    s = p;
  }
}

class _presp2State extends State<presp2> {
  @override
  TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<prescription>>.value(
      value: DatabaseService().listp,
      initialData: [],
      builder: (context, patient) {
        return plist(context);
      },
    );
  }

  Widget plist(BuildContext context) {
    final appoints = Provider.of<List<prescription>>(context);
    return new Scaffold(
      backgroundColor: Color(0xffEFF0F5),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Colors.white, style: BorderStyle.solid, width: 1.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xffF0EFFE),
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: appoints.length,
                    itemBuilder: (context, index) {
                      if (appoints[index].puid.contains(widget.s.puid)) {
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Container(
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
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Center(
                                        child: Row(
                                          children: [
                                            Center(
                                              child: Text('Doctor:',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          'Montserrat')),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Center(
                                              child: Text(
                                                  ' ${appoints[index].dname}',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Color(0xff4C3C88),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          'Montserrat')),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Center(
                                        child: Row(
                                          children: [
                                            Center(
                                              child: Text('Disease:',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          'Montserrat')),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Center(
                                              child: Text(
                                                  ' ${appoints[index].disease}',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Color(0xff4C3C88),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          'Montserrat')),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Center(
                                        child: Row(
                                          children: [
                                            Center(
                                              child: Text('Medicines:',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          'Montserrat')),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Flexible(
                                              child: Center(
                                                child: Text(
                                                    '${appoints[index].suggestions}',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color:
                                                            Color(0xff4C3C88),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'Montserrat')),
                                              ),
                                            ),
                                          ],
                                        ),
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
      ),
    );
  }
}
