import 'package:flutter/material.dart';
import 'package:stylish/Features/auth/data/models/user_response_model.dart';

abstract class AuthRepo {
  Future<void> signUp(
    TextEditingController loginEmailController,
    TextEditingController loginPasswordController,
  );
  Future<void> login(
    TextEditingController signUpEmailController,
    TextEditingController signUpPasswordController,
  );
  Future<UserModel> userDataRequest(int userID);
}
