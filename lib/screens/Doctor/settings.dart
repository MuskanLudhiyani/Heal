import 'package:heal/screens/Sign_In/signin.dart';
import 'package:flutter/material.dart';
import 'package:heal/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:heal/models/doctor.dart';
import 'package:provider/provider.dart';
import 'package:heal/database.dart';

class settingsd extends StatefulWidget {
  @override
  _settingsdState createState() => _settingsdState();
}

class _settingsdState extends State<settingsd> {
  final authentication auth = authentication(FirebaseAuth.instance);
  final String _uid = FirebaseAuth.instance.currentUser.uid;

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
            child: Column(children: <Widget>[
          SizedBox(
            height: 10,
          ),
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
              height: 200,
              width: 200,
            ),
          ),
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: appoints.length,
                  itemBuilder: (context, index) {
                    print(_uid);
                    print(index);
                    print(appoints[index].duid);
                    if (appoints[index].duid == _uid) {
                      doctor s = appoints[index];
                      print(s.duid);
                      print(_uid);

                      return Padding(
                        padding: const EdgeInsets.all(20.0),
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
                                offset: Offset(
                                    2.0, 2.0), // shadow direction: bottom right
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
                                Text("Name:      Dr. ${s.name}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff4C3C88),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat')),
                                Text("Speciality:    ${s.speciality}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff4C3C88),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat')),
                                Text("Address:    ${s.address}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff4C3C88),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat')),
                                Text("Phone Number:    ${s.phoneNumber} ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff4C3C88),
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat')),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  })),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              await auth.signOut();
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
                      child: Text('Sign Out',
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
            height: 10,
          )
        ])));
  }

// child: GestureDetector(
//   onTap: () async {
//     await auth.signOut();
//   },
//   child: Padding(
//     padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//     child: Container(
//       height: 50,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(
//             color: Colors.white, style: BorderStyle.solid, width: 1.0),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Color(0xffF0EFFE),
//             blurRadius: 2.0,
//             spreadRadius: 0.0,
//             offset: Offset(2.0, 2.0), // shadow direction: bottom right
//           )
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Center(
//             child: Text('Sign Out',
//                 style: TextStyle(
//                     fontSize: 20,
//                     color: Color(0xff4C3C88),
//                     fontWeight: FontWeight.bold,
//                     fontFamily: 'Montserrat')),
//           )
//         ],
//       ),
//     ),
//   ),
// ),

}
