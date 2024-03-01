import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/repository/auth_supabase_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final AuthRepository _authRepository = AuthRepository();

  final formKey = GlobalKey<FormState>();

  LoginCubit() : super(const LoginState()) {
    init();
  }

  void init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Введите email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Введите корректный email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Введите пароль';
    }
    if (value.length < 6) {
      return 'Пароль должен содержать не менее 6 символов';
    }
    return null;
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  void onButtonSubmit() {
    final email = emailController.text;
    final password = passwordController.text;

    if (formKey.currentState!.validate()) {
      emit(
        state.copyWith(
          status: LoginStatus.loading,
          formData: LoginFormData(
            email: email,
            password: password,
          ),
        ),
      );
    }
  }

  void signIn() {
    try {
      _authRepository.logInWithEmailAndPassword(
        email: state.formData!.email,
        password: state.formData!.password,
      );
      emit(state.copyWith(status: LoginStatus.success));
    } catch (e) {
      emit(state.copyWith(
          status: LoginStatus.error, errorMessage: e.toString()));
      log('ERRRRRROR: ${e.toString()}');
    }
  }
}
