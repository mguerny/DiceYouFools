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

class SignUpButtonPressed extends LoginEvent {
  final String username;
  final String password;

  SignUpButtonPressed({
    @required this.username,
    @required this.password,
  }) : super([username, password]);

  @override
  String toString() =>
      'SignUpButtonPressed { username: $username, password: $password }';

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
