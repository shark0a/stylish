import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/Features/auth/data/models/user_response_model.dart';
import 'package:stylish/Features/auth/data/repo/auth_repo.dart';
import 'package:stylish/core/service/services_locator.dart';
import 'package:stylish/core/utils/helper/hive_keys.dart';
import 'package:stylish/core/utils/helper/hive_service.dart';

part 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit(this._authRepo) : super(AuthCubitInitial());
  final AuthRepo _authRepo;

  Future<void> login(loginEmailController, loginPasswordController) async {
    emit(AuthCubitLoading());
    try {
      await _authRepo.login(loginEmailController, loginPasswordController);

      var result = await _authRepo.userDataRequest(1);
      await sl<HiveService>().putData<UserModel>(
        HiveKey.userDataBoxName,
        'userData',
        result,
      );
      log('User data saved to Hive: $result');
      emit(AuthCubitSuccess());
    } catch (e) {
      emit(AuthCubitFailure(errMessage: e.toString()));
    }
  }

  Future<void> signUp(
    signUpEmailController,
    signUpPasswordController,
    signUpPasswordConfirmController,
  ) async {
    emit(AuthCubitLoading());
    try {
      if (signUpPasswordController.text ==
          signUpPasswordConfirmController.text) {
        await _authRepo.signUp(signUpEmailController, signUpPasswordController);
      } else {
        throw 'Passwords fields do not match';
      }
      emit(AuthCubitSuccess());
    } catch (e) {
      emit(AuthCubitFailure(errMessage: e.toString()));
    }
  }
}
