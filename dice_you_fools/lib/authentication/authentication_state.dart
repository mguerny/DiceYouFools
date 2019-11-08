import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {}

class AuthenticationUninitialized extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUninitialized';
}

class AuthenticationAuthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationAuthenticated';
}

class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  String toString() => 'AuthenticationUnauthenticated';
}

class AuthentificationSignIn extends AuthenticationState {
  @override
  String toString() => 'AuthenticationSignIn';
}

class AuthentificationCodeValidate extends AuthenticationState {
  @override
  String toString() => 'AUthentificationCodeValidate';
}


class AuthentificationSignUp extends AuthenticationState {
  @override
  String toString() => 'AuthentificationSignUp';
}

class AuthenticationLoading extends AuthenticationState {
  @override
  String toString() => 'AuthenticationLoading';
}

class GameListDisplay extends AuthenticationState{
  @override
  String toString() => 'GameListDisplay';
}

class GameCreaDisplay extends AuthenticationState{
  @override
  String toString() => 'GameCreaDisplay';
}

class GameDispDisplay extends AuthenticationState{
  @override
  String toString() => 'GameDispDisplay';
}

class UserDispDisplay extends AuthenticationState{
  @override
  String toString() => 'UserDispDisplay';
}
