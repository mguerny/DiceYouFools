import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class CodeValidationEvent extends Equatable {
  CodeValidationEvent([List props = const []]) : super(props);
}

class CodeValidationButtonPressed extends CodeValidationEvent {
  final String code;
  final String email;

  CodeValidationButtonPressed({
    @required this.code,
    @required this.email,

  }) : super([code, email]);

  @override
  String toString() =>
      'CodeValidationButtonPressed { code: $code, email: $email }';
}
