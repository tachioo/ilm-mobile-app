import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  //firebase auth instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var currentUser = FirebaseAuth.instance.currentUser;

  //firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //sign user in
  Future<UserCredential> signInWithEmailandPassword(String email,
      String password, DateTime? loginTime, DateTime? logoutTime) async {
    try {
      //sign in
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      // add a new document for the user in users collection if it doeesnt already exists
      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        'loginTime': loginTime,
        'logoutTime': logoutTime,
      }, SetOptions(merge: true));

      return userCredential;
    }
    // catch any errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // create new user
  Future<UserCredential> signUpWithEmailandPassword(
    String firstName,
    String lastName,
    String fullName,
    String email,
    String password,
    String phoneNum,
    String identificationCard,
    String gender,
    String birthDate,
    String imageLink,
    bool isStudent,
    bool isTutor,
    String poscode,
    String city,
    String state,
    String addressFirstLine,
    String addressSecondLine,
    String fullAddress,
    DateTime? loginTime,
    DateTime? logoutTime,
  ) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //after creating new user, create a new document for the user in the users collection

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'firstName': firstName,
        'lastName': lastName,
        'fullName': fullName,
        'email': email,
        'phoneNum': phoneNum,
        'identificationCard': identificationCard,
        'gender': gender,
        'birthDate': birthDate,
        'isStudent': isStudent,
        'isTutor': isTutor,
        'poscode': poscode,
        'city': city,
        'state': state,
        'addressFirstLine': addressFirstLine,
        'addressSecondLine': addressSecondLine,
        'address': fullAddress,
        'loginTime': loginTime,
        'logoutTime': logoutTime,
      });

      await _firestore
          .collection('users/${userCredential.user!.uid}/private')
          .doc('profile')
          .set({
        'identificationCard': identificationCard,
      });

      await _firestore
          .collection('users/${userCredential.user!.uid}/private')
          .doc('log')
          .set({
        'loginTime': loginTime,
        'logoutTime': logoutTime,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign out
  Future<void> signOut({DateTime? loginTime, DateTime? logoutTime}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .set({
      'loginTime': loginTime,
      'logoutTime': logoutTime,
    }, SetOptions(merge: true));
    return await FirebaseAuth.instance.signOut();
  }
}
