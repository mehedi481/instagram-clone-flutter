import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/services/storage_service.dart';
import '../models/user_model.dart' as model;

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

        debugPrint(userCredential.user!.uid);

        String photoUrl = await StorageService()
            .uploadImageToStorage("profilePics", file, false);

        // create user_model instance
        model.UserModel userModel = model.UserModel(
          userName: username,
          uid: userCredential.user!.uid,
          email: email,
          bio: bio,
          photoUrl: photoUrl,
          followers: [],
          following: [],
        );
        // add user to our database
        await _firestore
            .collection("users")
            .doc(userCredential.user!.uid)
            .set(userModel.toJson());
            
        res = "success";
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == "invalid-email") {
        res = "Please Input a Valid Email";
      }
      if (error.code == "email-already-in-use") {
        res = "Email already registered";
      }
    }
    return res;
  }

  // Sign in users
  Future<String> singInUser({
    required String email,
    required String password,
  }) async {
    String res = "some error occurred";
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      res = "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        res = "Please Input a Valid Email";
      }
      if (e.code == "user-not-found") {
        res = "User not Found";
      }
      if (e.code == "wrong-password") {
        res = "Wrong password";
      }
      if (e.code == "email-already-in-use") {
        res = "Email already registered";
      }
    }
    return res;
  }
}
