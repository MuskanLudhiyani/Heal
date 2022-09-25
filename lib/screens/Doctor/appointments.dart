import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heal/database.dart';
import 'package:heal/authentication.dart';
import 'package:provider/provider.dart';
import 'package:heal/models/appointment.dart';

import '../../database.dart';

class appointments extends StatefulWidget {
  @override
  _appointmentsState createState() => _appointmentsState();
}

class _appointmentsState extends State<appointments> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<appointment>>.value(
      value: DatabaseService().appoints,
      initialData: [],
      builder: (context, appointments) {
        return appointlist(context);
      },
    );
  }

  Widget appointlist(BuildContext context) {
    final String _uid = FirebaseAuth.instance.currentUser.uid;
    final appoints = Provider.of<List<appointment>>(context);
    print(appoints);
    return Scaffold(
      backgroundColor: Color(0xffEFF0F5),
      body: ListView.builder(
          itemCount: appoints.length,
          itemBuilder: (context, index) {
            DateTime x = DateTime.parse(
                appoints[index].date + " " + appoints[index].time + ":00");
            if (appoints[index].doctor == _uid &&
                appoints[index].approved != 0 &&
                ((x.year > DateTime.now().year) ||
                    (x.month > DateTime.now().month) ||

                    ((x.year == DateTime.now().year) &&
                        (x.month == DateTime.now().month) && x.day >= DateTime.now().day))
            ) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Container(
                      height: 110,
                      width: 500,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(appoints[index].pname,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff4C3C88),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                          Text(
                            appoints[index].time,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                          Text(appoints[index].date,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                          (appoints[index].approved == -1)
                              ? Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            DatabaseService()
                                                .setAppointmentApproved(
                                                    appoints[index].aid);
                                          },
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          )),
                                      ElevatedButton(
                                          onPressed: () {
                                            DatabaseService()
                                                .setAppointmentRejected(
                                                    appoints[index].aid);
                                          },
                                          child: Icon(Icons.clear,
                                              color: Colors.red))
                                    ],
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              );
              // Padding(
              //     padding: EdgeInsets.only(top: 8),
              //     child: Container(
              //       color: Colors.blue[50],
              //       child: Column(
              //         children: [
              //           Text(appoints[index].pname),
              //           Text(appoints[index].time),
              //           Text(appoints[index].date),
              //         ],
              //       ),
              //     ));
            } else {
              return SizedBox(
                height: 0,
              );
            }
          }),
    );
  }
}
