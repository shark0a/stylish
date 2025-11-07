import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stylish/Features/auth/data/models/user_response_model.dart';
import 'package:stylish/Features/auth/data/repo/auth_repo.dart';
import 'package:stylish/core/service/api_service.dart';
import 'package:stylish/generated/l10n.dart';

class AuthRepoImplementation implements AuthRepo {
  final FirebaseAuth _firebaseAuth;
  final ApiService apiService;

  AuthRepoImplementation({required this.apiService, FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<void> login(
    TextEditingController loginEmailController,
    TextEditingController loginPasswordController,
  ) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: loginEmailController.text,
        password: loginPasswordController.text,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw 'No user found for that email.';
        case 'wrong-password':
          throw 'Wrong password provided.';
        case 'invalid-credential':
          throw 'Check your email or password.';
        default:
          throw 'Login error: ${e.message}';
      }
    } catch (e) {
      throw 'Unexpected error: ${e.toString()}';
    }
  }

  @override
  Future<void> signUp(
    TextEditingController signUpEmailController,
    TextEditingController signUpPasswordController,
  ) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: signUpEmailController.text,
        password: signUpPasswordController.text,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          throw 'The password provided is too weak.';
        case 'email-already-in-use':
          throw 'The account already exists for that email.';
        default:
          throw 'Signup error: ${e.message}';
      }
    } catch (e) {
      throw 'Unexpected error: $e';
    }
  }

  @override
  Future<UserModel> userDataRequest(int userID) async {
    try {
      var response = await apiService.get('users/$userID');
      return UserModel.fromJson(response);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw S.current.connectionerror;
      } else if (e.response != null) {
        throw S.current.connectionerror;
      } else {
        throw ' ${S.current.connectionerror}: ${e.message}';
      }
    }
  }
}
