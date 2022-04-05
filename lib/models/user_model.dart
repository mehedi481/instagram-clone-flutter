import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String uid;
  final String photoUrl;
  final String bio;
  final String userName;
  final List following;
  final List followers;

  const UserModel({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.bio,
    required this.userName,
    required this.following,
    required this.followers,
  });

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "email": email,
        "bio": bio,
        "uid": uid,
        "photoUrl": photoUrl,
        "following": following,
        "followers": followers,
      };

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      email: snapshot["email"],
      uid: snapshot["uid"],
      photoUrl: snapshot["photoUrl"],
      bio: snapshot["bio"],
      userName: snapshot["userName"],
      following: snapshot["following"],
      followers: snapshot["followers"],
    );
  }
}
