import 'package:flutter/material.dart';
import 'package:heal/models/doctor.dart';
import 'makeappointment.dart';

class avc extends StatefulWidget {
  doctor s;
  avc(doctor s) {
    this.s = s;
  }
  @override
  _avcState createState() => _avcState();
}

class _avcState extends State<avc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFF0F5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("About",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat')),
          Center(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://i.pinimg.com/originals/cf/4e/c0/cf4ec0f1cd566491fe962ed9d2f68d67.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              height: 150,
              width: 150,
            ),
          ),
          Container(
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
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name:      Dr. ${widget.s.name}",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff4C3C88),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat')),
                  Text("Speciality:    ${widget.s.speciality}",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff4C3C88),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat')),
                  Text("Address:    ${widget.s.address}",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff4C3C88),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat')),
                  Text("Phone Number:    ${widget.s.phoneNumber} ",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff4C3C88),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat')),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print(widget.s.duid);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        (DoctorsInfo(widget.s))),
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
                      offset:
                          Offset(2.0, 2.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text('Add Appointment',
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
