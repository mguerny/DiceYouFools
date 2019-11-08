import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class SignupEvent extends Equatable {
  SignupEvent([List props = const []]) : super(props);
}

class SignUpButtonPressed extends SignupEvent {
  final String username;
  final String password;
  final String phone;
  final String name;

  SignUpButtonPressed({
    @required this.username,
    @required this.password,
    @required this.phone,
    @required this.name
  }) : super([username, password, phone, name]);

  @override
  String toString() =>
      'SignUpButtonPressed { username: $username, password: $password, phone: $phone, name: $name }';

}

class SignInButtonPressed extends SignupEvent {
  SignInButtonPressed(): super();

  @override
  String toString() =>
      'SignInButtonPressed ';
}