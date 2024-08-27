part of 'phone_auth_bloc.dart';

@immutable
sealed class PhoneAuthEvent {}

class PhoneAuthValidate extends PhoneAuthEvent {
  String? mobile;
  PhoneAuthValidate({this.mobile}); }