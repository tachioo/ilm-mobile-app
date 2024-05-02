import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseStorage _firestore = FirebaseStorage.instance;

class StoreData {
  var currentUser = FirebaseAuth.instance.currentUser;

  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveData({
    required Uint8List file,
  }) async {
    String resp = " Some Error Occurred";
    try {
      if (file.isNotEmpty) {
        print("the user id is : ${currentUser!.uid}");
        String imageUrl =
            await uploadImageToStorage("students/${currentUser!.uid}", file);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser!.uid)
            .set({
          'imageLink': imageUrl,
        }, SetOptions(merge: true));

        resp = 'success';
        print('sucess woi');
      }
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }

  Future<String> saveTutorData({
    required Uint8List? file,
  }) async {
    String resp = " Some Error Occurred";
    try {
      if (file!.isNotEmpty) {
        print("the user id is : ${currentUser!.uid}");
        String imageUrl =
            await uploadImageToStorage("tutors/${currentUser!.uid}", file);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser!.uid)
            .set({
          'tutorImageLink': imageUrl,
        }, SetOptions(merge: true));

        resp = 'success';
        print('sucess tutorImageLink woi');
      }
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }

  Future<String> saveSchool({
    required String schoolName,
    required String location,
  }) async {
    String res = " Some Error Occurred";
    try {
      if (schoolName.isNotEmpty || location.isNotEmpty) {
        print('school name is ${schoolName}');
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser!.uid)
            .set({
          'schoolName': schoolName,
        }, SetOptions(merge: true));
        res = 'success';
        print('success lesgo');
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> saveWork({
    required String workLocation,
  }) async {
    String res = " Some Error Occurred";
    try {
      if (workLocation.isNotEmpty) {
        print('Work location name is ${workLocation}');
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser!.uid)
            .set({
          'workLocation': workLocation,
        }, SetOptions(merge: true));
        res = 'success workLocation';
        print('success workLocation lesgo');
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> saveUserInfo({
    required String firstName,
    required String lastName,
    required String fullName,
    required String email,
    required String phoneNum,
    required String idenCard,
    required String gender,
    required String birthDate,
    required String address,
  }) async {
    String res = " Some Error Occurred";
    try {
      if (firstName.isNotEmpty ||
          lastName.isNotEmpty ||
          fullName.isNotEmpty ||
          email.isNotEmpty ||
          phoneNum.isNotEmpty ||
          idenCard.isNotEmpty ||
          gender.isNotEmpty ||
          // birthDate.isNotEmpty ||
          address.isNotEmpty) {
        print('you saved your info fullName is ${fullName}');
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser!.uid)
            .set({
          'firstName': firstName,
          'lastName': lastName,
          'fullName': fullName,
          'email': email,
          'phoneNum': phoneNum,
          'identificationCard': idenCard,
          'gender': gender,
          // 'birthDate': birthDate,
          'address': address,
        }, SetOptions(merge: true));
        res = 'success';
        print('info saved lesgo');
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> saveLanguage({
    required Iterable languages,
  }) async {
    String res = " Some Error Occurred";
    try {
      if (languages.isNotEmpty) {
        print('Your languages are ${languages}');
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser!.uid)
            .set({
          'languages': languages,
        }, SetOptions(merge: true));
        res = 'success';
        print('success language lesgo');
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> saveTutoringSuject({
    required Iterable tutoringSubjects,
  }) async {
    String res = " Some Error Occurred";
    try {
      if (tutoringSubjects.isNotEmpty) {
        print('Your tutoringSubject are ${tutoringSubjects}');
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser!.uid)
            .set({
          'tutoringSubjects': tutoringSubjects,
        }, SetOptions(merge: true));
        res = 'success';
        print('success tutoringSubjects lesgo');
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> changeToTutor({
    required bool isTutor,
  }) async {
    String res = " Some Error Occurred";
    try {
      if (isTutor) {
        print('Your isTutor is ${isTutor}');
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser!.uid)
            .set({
          'isTutor': true,
        }, SetOptions(merge: true));
        res = 'success isTutor';
        print('success isTutor lesgo');
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> changeToStudent({
    required bool isStudent,
  }) async {
    String res = " Some Error Occurred";
    try {
      if (isStudent) {
        print('Your isStudent is ${isStudent}');
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser!.uid)
            .set({
          'isStudent': true,
        }, SetOptions(merge: true));
        res = 'success isStudent';
        print('success isStudent lesgo');
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future loggingOut({
    DateTime? loginTime,
    DateTime? logoutTime,
  }) async {
    String res = " Some Error Occurred";

    print('Your logoutTime ${logoutTime}');
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .set({
      'loginTime': loginTime,
      'logoutTime': logoutTime,
    }, SetOptions(merge: true));
    res = 'success logout';
    print('success logout lesgo');

    return await FirebaseAuth.instance.signOut();
  }
}
