part of 'registration_cubit.dart';

enum RegistrationStatus {
  initial,
  loading,
  success,
  error,
}

class RegistrationState extends Equatable {
  final RegistrationStatus status;
  final RegistrationData? formData;
  final String? errorMessage;

  const RegistrationState({
    this.status = RegistrationStatus.initial,
    this.formData,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [status, formData];

  RegistrationState copyWith({
    RegistrationStatus? status,
    RegistrationData? formData,
    String? errorMessage,
  }) {
    return RegistrationState(
      status: status ?? this.status,
      formData: formData ?? this.formData,
      errorMessage: errorMessage,
    );
  }
}

class RegistrationData {
  final String name;
  final String email;
  final String password;

  const RegistrationData({
    required this.name,
    required this.email,
    required this.password,
  });
}
