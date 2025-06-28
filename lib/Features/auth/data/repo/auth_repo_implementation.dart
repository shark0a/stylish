import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stylish/Features/auth/data/repo/auth_repo.dart';

class AuthRepoImplementation implements AuthRepo {
  final FirebaseAuth _firebaseAuth;

  AuthRepoImplementation({FirebaseAuth? firebaseAuth})
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
}
