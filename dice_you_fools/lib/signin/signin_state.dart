import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class SigninState extends Equatable {
  SigninState([List props = const []]) : super(props);
}


class SigninInitial extends SigninState {
  @override
  String toString() => 'SigninInitial';
}

class SigninLoading extends SigninState {
  @override
  String toString() => 'SigninLoading';
}

class SigninFailure extends SigninState {
  final String error;

  SigninFailure({@required this.error}) : super([error]);

  @override
  String toString() => 'SigninFailure { error: $error }';
}