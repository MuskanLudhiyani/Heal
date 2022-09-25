import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heal/main.dart';
import 'package:heal/screens/Patients/appointments.dart';
import 'package:heal/screens/Patients/content.dart';
import 'package:heal/screens/Patients/makeappointment.dart';
import 'package:heal/screens/Patients/searchdoctors.dart';
import 'package:heal/screens/Patients/settings.dart';
import 'package:heal/screens/Patients/chat.dart';


class landingpagepatient extends StatefulWidget {
  @override
  _landingpagepatientState createState() => _landingpagepatientState();
}

class _landingpagepatientState extends State<landingpagepatient> {
  final uid = FirebaseAuth.instance.currentUser.uid;

  int _selectedpage = 0;
  final pageoptions = [appointments(), searchd(), Content(), ChatBubble(), settingsp()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFF0F5),
      appBar: AppBar(
        title: Text('Heal'),
        backgroundColor: Color(0xff4C3C88),
      ),
      body: pageoptions[_selectedpage],
      bottomNavigationBar: Container(
        color: Colors.red,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.white,

          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.people,
                  color: Colors.black,
                ),
                label : "Appointments"
                // title: Text(
                //   'Appointments',
                //   style: TextStyle(
                //     fontFamily: 'sans',
                //   ),
                // )
            ),

            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                label: "Search Doctors"
                // title: Text(
                //   'Search Doctors',
                //   style: TextStyle(
                //     fontFamily: 'sans',
                //   ),
                // )
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                ),
                label : "Explore"
              // title: Text(
              //   'Appointments',
              //   style: TextStyle(
              //     fontFamily: 'sans',
              //   ),
              // )
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.message,
                  color: Colors.black,
                ),
                label : "Chat"
              // title: Text(
              //   'Appointments',
              //   style: TextStyle(
              //     fontFamily: 'sans',
              //   ),
              // )
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.black,
                ),
                label: "More"
                // title: Text(
                //   'More',
                //   style: TextStyle(
                //     fontFamily: 'sans',
                //   ),
                // )
            )
          ],
          currentIndex: _selectedpage,
          selectedItemColor: Color(0xff4C3C88),
          onTap: (int index) {
            setState(() {
              _selectedpage = index;
            });
          },

          iconSize: 25,
        ),
      ),
    );
  }
}
