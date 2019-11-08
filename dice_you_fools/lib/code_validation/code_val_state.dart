import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class CodeValidationState extends Equatable {
  CodeValidationState([List props = const []]) : super(props);
}


class CodeValidationInitial extends CodeValidationState {
  @override
  String toString() => 'CodeValidationInitial';
}

class CodeValidationLoading extends CodeValidationState {
  @override
  String toString() => 'CodeValidationLoading';
}

class CodeValidationFailure extends CodeValidationState {
  final String error;

  CodeValidationFailure({@required this.error}) : super([error]);

  @override
  String toString() => 'CodeValidationFailure { error: $error }';
}