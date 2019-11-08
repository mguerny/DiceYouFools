import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class SigninEvent extends Equatable {
  SigninEvent([List props = const []]) : super(props);
}

class SigninButtonPressed extends SigninEvent {
  final String username;
  final String password;

  SigninButtonPressed({
    @required this.username,
    @required this.password,
  }) : super([username, password]);

  @override
  String toString() =>
      'LoginButtonPressed { username: $username, password: $password }';
}

class SignUpButtonPressed extends SigninEvent {
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