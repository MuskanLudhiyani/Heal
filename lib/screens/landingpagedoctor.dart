import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:heal/screens/Doctor/appointments.dart';
import 'package:heal/screens/Doctor/searchpatients.dart';
import 'package:heal/screens/Doctor/settings.dart';

class landingpagedoctor extends StatefulWidget {
  @override
  _landingpagedoctorState createState() => _landingpagedoctorState();
}

class _landingpagedoctorState extends State<landingpagedoctor> {
  final uid = FirebaseAuth.instance.currentUser.uid;
  int _selectedpage = 0;
  final pageoptions = [
    appointments(),
    searchp(),
    settingsd()
  ];
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
                label: 'Appointments',

            ),

            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                label:   'Search Patients',

            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.black,
                ),
                label: "More"
            )],
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
