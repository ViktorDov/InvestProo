part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  error,
}

class LoginState extends Equatable {
  final LoginStatus status;
  final LoginFormData? formData;
  final String? errorMessage;

  const LoginState({
    this.status = LoginStatus.initial,
    this.formData,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [status, formData, errorMessage];

  LoginState copyWith({
    LoginStatus? status,
    LoginFormData? formData,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      formData: formData ?? this.formData,
      errorMessage: errorMessage,
    );
  }
}

class LoginFormData {
  final String email;
  final String password;

  const LoginFormData({
    required this.email,
    required this.password,
  });
}
