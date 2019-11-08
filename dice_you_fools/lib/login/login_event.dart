import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  LoginButtonPressed({
    @required this.username,
    @required this.password,
  }) : super([username, password]);

  @override
  String toString() =>
      'LoginButtonPressed { username: $username, password: $password }';
}

class AppleSignInButtonPressed extends LoginEvent{
  AppleSignInButtonPressed();
}

class SignInButtonPressed extends LoginEvent {
  SignInButtonPressed(): super();

  @override
  String toString() =>
      'SignInButtonPressed ';

}

class SignUpButtonPressed extends LoginEvent{
  SignUpButtonPressed(): super();
  @override
  String toString() => 'SignUpButtonPressed';
}

class CodeValidateButtonPressed extends LoginEvent{
  final String email;
  final String code;

  CodeValidateButtonPressed({
    @required this.code,
    @required this.email
  }) : super([code, email]);
}

class GoogleButtonPressed extends LoginEvent {


  GoogleButtonPressed(): super();

  @override
  String toString() =>
      'GoogleButtonPressed ';
}
