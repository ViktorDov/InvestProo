import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:investpro/domain/repository/auth_supabase_repository.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final formKey = GlobalKey<FormState>();
  final AuthRepository _authRepository = AuthRepository();
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  RegistrationCubit() : super(const RegistrationState()) {
    init();
  }

  void init() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  String? validateName(String? value) {
    if (value!.isEmpty && value.length < 3) {
      return 'Введите корректное имя';
    }
    return null;
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
    if (value != confirmPasswordController.text) {
      return 'Пароли не совпадают';
    }
    return null;
  }

  void onButtonSubmit() {
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;

    if (formKey.currentState!.validate()) {
      emit(
        state.copyWith(
          status: RegistrationStatus.loading,
          formData: RegistrationData(
            name: name,
            email: email,
            password: password,
          ),
        ),
      );
    }
  }

  void signUp() {
    try {
      _authRepository.singUpWithEmailAndPassword(
        email: state.formData!.email,
        password: state.formData!.password,
        name: state.formData!.name,
      );
      emit(state.copyWith(status: RegistrationStatus.success));
    } catch (e) {
      emit(state.copyWith(
          status: RegistrationStatus.error, errorMessage: e.toString()));
      log('ERRRRRROR: ${e.toString()}');
    }
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
