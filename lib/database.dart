import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heal/models/chat.dart';
import '../models/appointment.dart';
import '../models/doctor.dart';
import '../models/patient.dart';
import '../models/prescription.dart';



class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference patients =
      FirebaseFirestore.instance.collection('patients');
  final CollectionReference doctors =
      FirebaseFirestore.instance.collection('doctors');
  final CollectionReference appointments =
      FirebaseFirestore.instance.collection('appointments');
  final CollectionReference prescriptions =
      FirebaseFirestore.instance.collection('prescriptions');
  final CollectionReference chats =
  FirebaseFirestore.instance.collection("chat");

  Future updatePatientData(
    String puid,
    String name,
    int age,
    String gender,
    String phoneNumber,
    String bloodGroup,
    String trustedContact1,
    String trustedContact2,
    String trustedContact3,
  ) async {
    return await patients
        .doc(uid)
        .set({
          'puid': puid,
          'name': name,
          'age': age,
          'gender': gender,
          'phoneNumber': phoneNumber,
          'bloodGroup': bloodGroup,
          'trustedContact1' : trustedContact1,
          'trustedContact2' : trustedContact2,
          'trustedContact3' : trustedContact3
        })
        .then((value) => print("User added successfully"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future updateChatData(
      String message,
      String senderUid,
      Timestamp time,
      ) async {
    return await chats
        .doc(uid)
        .set({
      'message': message,
      'senderUid': senderUid,
      'time': time
    })
        .then((value) => print("message sent"))
        .catchError((error) => print("Failed to add user: $error"));
  }
  Future updateDoctorData(
    String duid,
    String name,
    String gender,
    String phoneNumber,
    String address,
    String speciality,
  ) async {
    return await doctors
        .doc(uid)
        .set({
          'duid': duid,
          'name': name,
          'gender': gender,
          'phoneNumber': phoneNumber,
          'address': address,
          'speciality': speciality,
        })
        .then((value) => print("User added successfully"))
        .catchError((error) => print("Failed to add user: $error"));
  }


  Future updateAppointmentData(
    String dname,
    String pname,
    String duid,
    String puid,
    String date,
    String time,
    int approved,
  ) async {
    DocumentReference documentReference = appointments.doc();
    return await documentReference
        .set({
          'aid': documentReference.id,
          'dname': dname,
          'pname': pname,
          'doctor': duid,
          'patient': puid,
          'date': date,
          'time': time,
          'approved': approved,
        })
        .then((value) => print("Appointment added successfully"))
        .catchError((error) => print("Failed to add appointment: $error"));
  }

  Future setAppointmentApproved(String aid) async {
    return await appointments.doc(aid).update({'approved': 1});
  }

  Future setAppointmentRejected(String aid) async {
    return await appointments.doc(aid).update({'approved': 0});
  }

  Future deleteAppointment(String aid) async {
    return await appointments.doc(aid).delete();
  }

  Future<bool> checkIfDoctor() {
    return doctors.doc(uid).get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print("doctor true");
        return true;
      } else {
        print("doctor false");
        return false;
      }
    });
  }

  Future<bool> checkIfPatient() async {
    return await patients
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print("patient true");
        return true;
      } else {
        print("patient false");
        return false;
      }
    });
  }

  Stream<List<appointment>> get appoints {
    //print(appointments.snapshots().map(appointmentListFromSnapshot).first.toString());
    return appointments.snapshots().map(appointmentListFromSnapshot);
  }

  List<appointment> appointmentListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return appointment(
          aid: doc.data()['aid'] ?? '',
          date: doc.data()['date'] ?? '',
          dname: doc.data()['dname'] ?? '',
          doctor: doc.data()['doctor'] ?? '',
          patient: doc.data()['patient'] ?? '',
          pname: doc.data()['pname'] ?? '',
          time: doc.data()['time'] ?? '',
          approved: doc.data()['approved'] ?? -1);
    }).toList();
  }

  List<chat> chatListFromSnapshot(QuerySnapshot snapshot){
    List map =  snapshot.docs.map((doc) {
      return chat(
          message: doc.data()['message'] ?? '',
          senderId: doc.data()['senderUid'] ?? '',
          time: doc.data()['time'].toString() ?? '');
    }).toList();
        map.sort(( a, b) {
      return (a.time).compareTo(b.time) ;
        });
        return map;
  }
  Stream<List<chat>> get messages{
    return chats.snapshots().map(chatListFromSnapshot);
  }

  Stream<List<patient>> get patientlist {
    return patients.snapshots().map(patientListFromSnapshot);
  }

  List<patient> patientListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return patient(
          puid: doc.data()['puid'] ?? '',
          name: doc.data()['name'] ?? '',
          gender: doc.data()['gender'] ?? '',
          bloodGroup: doc.data()['bloodGroup'] ?? '',
          phoneNumber: doc.data()['phoneNumber'] ?? '',
          age: doc.data()['age'] ?? 0,
          trustedContact1: doc.data()['trustedContact1'] ?? '',
          trustedContact2: doc.data()['trustedContact2'] ?? '',
          trustedContact3: doc.data()['trustedContact3'] ?? '',
      );
    }).toList();
  }

  Stream<List<doctor>> get doctorlist {
    return doctors.snapshots().map(doctorListFromSnapshot);
  }

  List<doctor> doctorListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return doctor(
          duid: doc.data()['duid'] ?? '',
          name: doc.data()['name'] ?? '',
          gender: doc.data()['gender'] ?? '',
          speciality: doc.data()['speciality'] ?? '',
          phoneNumber: doc.data()['phoneNumber'] ?? '',
          address: doc.data()['address'] ?? '');
    }).toList();
  }

  Stream<List<prescription>> get listp {
    return prescriptions.snapshots().map(prescriptionListFromSnapshot);
  }

  List<prescription> prescriptionListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return prescription(
          disease: doc.data()['disease'] ?? '',
          dname: doc.data()['dname'] ?? '',
          pname: doc.data()['pname'] ?? '',
          puid: doc.data()['puid'] ?? '',
          suggestions: doc.data()['suggestions'] ?? '');
    }).toList();
  }

  Future addPrescriptionToPatient(String puid, String pname, String dname,
      String disease, String suggestions) async {
    DocumentReference documentReference = prescriptions.doc();
    return await documentReference
        .set({
          'presid': documentReference.id,
          'puid': puid,
          'pname': pname,
          'dname': dname,
          'disease': disease,
          'suggestions': suggestions
        })
        .then((value) => print("Prescription added successfully"))
        .catchError((error) => print("Failed to add prescription: $error"));
  }
}
