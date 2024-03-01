import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investpro/presentation/constants/app_colors.dart';
import 'package:investpro/presentation/widgets/custom_auth_appbar.dart';

import 'cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.loading) { 
          context.read<LoginCubit>().signIn(); 
        }
        if (state.status == LoginStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state.status == LoginStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Successfully logged in!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      child: const Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 45, vertical: 40),
            child: Column(
              children: [
                CustomAuthAppBar(),
                SizedBox(height: 70),
                InputFormField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InputFormField extends StatefulWidget {
  const InputFormField({super.key});

  @override
  State<InputFormField> createState() => _InputFormFieldState();
}

class _InputFormFieldState extends State<InputFormField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.watch<LoginCubit>().formKey,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Ел. почта',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          LoginInputTextField(),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Пароль',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          PasswordInputWidget(),
          SizedBox(height: 35),
          SignInButton(),
        ],
      ),
    );
  }
}

class LoginInputTextField extends StatefulWidget {
  const LoginInputTextField({super.key});

  @override
  State<LoginInputTextField> createState() => _LoginInputTextFieldState();
}

class _LoginInputTextFieldState extends State<LoginInputTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: context.watch<LoginCubit>().emailController,
      validator: (val) => context.read<LoginCubit>().validateEmail(val),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      style: const TextStyle(color: Colors.grey),
      decoration: const InputDecoration(
        hintText: 'Введите ел. почту',
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        labelStyle: TextStyle(color: Colors.white),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        errorStyle: TextStyle(fontSize: 14),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}

class PasswordInputWidget extends StatefulWidget {
  const PasswordInputWidget({super.key});

  @override
  State<PasswordInputWidget> createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context.watch<LoginCubit>().passwordController,
      validator: (val) => context.read<LoginCubit>().validatePassword(val),
      style: const TextStyle(color: Colors.grey),
      obscureText: isPasswordVisible,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
          icon: Icon(
            isPasswordVisible ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
        ),
        hintText: 'Введите пароль',
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        labelStyle: const TextStyle(color: Colors.white),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        errorStyle: const TextStyle(fontSize: 14),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: context.read<LoginCubit>().onButtonSubmit,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Войти',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
