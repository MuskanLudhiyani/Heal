import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heal/database.dart';
import 'package:heal/authentication.dart';
import 'package:provider/provider.dart';
import 'package:heal/models/appointment.dart';

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
    return Scaffold(
      backgroundColor: Color(0xffEFF0F5),
      body: ListView.builder(
          itemCount: appoints.length,
          itemBuilder: (context, index) {
            String y = (appoints[index].date).toString() +
                " " +
                appoints[index].time.toString() +
                ":00";
            print(y);
            print("yeh hai y");
            DateTime x = DateTime.parse(y);
            if (appoints[index].patient == _uid &&
                ((x.year > DateTime.now().year) ||
                (x.month > DateTime.now().month) ||

                ((x.year == DateTime.now().year) &&
                    (x.month == DateTime.now().month) && x.day >= DateTime.now().day))) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Container( 
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
                            Text(appoints[index].dname,
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
                            approvedStatus(appoints[index].approved),
                            ElevatedButton(
                                onPressed: () {
                                  DatabaseService()
                                      .deleteAppointment(appoints[index].aid);
                                },
                                child: Text('Delete Appointment'))
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
              return SizedBox(
                height: 0,
              );
            }
          }),
    );
  }
}

Widget approvedStatus(approved) {
  if (approved == 0) {
    return Text('Rejected',
        style: TextStyle(
            fontSize: 15,
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat'));
  }
  if (approved == 1) {
    return Text('Approved',
        style: TextStyle(
            fontSize: 15,
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat'));
  }
  return Text('Pending',
      style: TextStyle(
          fontSize: 15,
          color: Colors.orange,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat'));
}
