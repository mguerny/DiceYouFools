import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super(props);
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthenticationEvent {
  final String token;

  LoggedIn({@required this.token}) : super([token]);

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class SignedIn extends AuthenticationEvent {
  final String token;

  SignedIn({@required this.token}) : super([token]);

  @override
  String toString() => 'SignedIn { token: $token }';
}
class SignedUp extends AuthenticationEvent {
  final String token;

  SignedUp({@required this.token}) : super([token]);

  @override
  String toString() => 'SignedUp { token: $token }';
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}
class CodeValidate extends AuthenticationEvent {
  @override
  String toString() => 'CodeValidation';
}
