import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/models/user_model.dart';
import 'package:instagram_clone_flutter/services/auth_service.dart';

class UserProvider with ChangeNotifier {
  UserModel? _userModel;
  final AuthService _authService = AuthService();

  UserModel get getUser => _userModel!;

  Future<void> refreshUer() async {
    UserModel user = await _authService.getUserDetails();
    _userModel = user;
    notifyListeners();
  }
}
