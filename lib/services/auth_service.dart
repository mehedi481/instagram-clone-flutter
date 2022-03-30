import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/services/storage_service.dart';
import 'package:instagram_clone_flutter/utils/utils.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign Up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty ||
          username.isNotEmpty ||
          file != null) {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);

        print(userCredential.user!.uid);

        String photoUrl = await StorageService()
            .uploadImageToStorage("profilePics", file, false);

        // add user to our database
        await _firestore.collection("users").doc(userCredential.user!.uid).set({
          "userName": username,
          "email": email,
          "bio": bio,
          "uid": userCredential.user!.uid,
          "followers": [],
          "following": [],
          "photoUrl": photoUrl,
        });
        res = "success";
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == "invalid-email") {
        res = "Please Input a Valid Email";
        print("Please Input a Valid Email");
      }
      if (error.code == "email-already-in-use") {
        print("Email already registered");
      }
      print(error.code.toString());
    }
    return res;
  }
}
