part of 'phone_auth_bloc.dart';

@immutable
sealed class PhoneAuthState {}

final class PhoneAuthInitial extends PhoneAuthState {}

class PhoneAuthValidationSuccess extends PhoneAuthState {
  String? value;
  PhoneAuthValidationSuccess(this.value);
}

class PhoneAuthValidationFailure extends PhoneAuthState {
  String? value;
  PhoneAuthValidationFailure(this.value);
}