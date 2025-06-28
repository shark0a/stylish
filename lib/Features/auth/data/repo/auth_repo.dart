import 'package:flutter/material.dart';

abstract class AuthRepo {
  Future<void> signUp(TextEditingController loginEmailController, TextEditingController loginPasswordController);
  Future<void> login(TextEditingController signUpEmailController, TextEditingController signUpPasswordController);
}
