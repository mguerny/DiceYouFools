import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:dice_you_fools/user_repository.dart';

import 'package:dice_you_fools/authentication/authentication.dart';
import 'package:dice_you_fools/code_validation/code_val.dart';

class CodeValidationBloc extends Bloc<CodeValidationEvent, CodeValidationState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  CodeValidationBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  CodeValidationState get initialState => CodeValidationInitial();

  @override
  Stream<CodeValidationState> mapEventToState(
      CodeValidationState currentState,
      CodeValidationEvent event,
      ) async* {
    print("event = "+ event.toString());

    if(event is CodeValidationButtonPressed){
      yield CodeValidationLoading();
      print("CodeValidateButtonPressed");
      try{
        print("code validation " + event.code);
        final token = await userRepository.smsValidation(code: event.code, email: event.email);
        authenticationBloc.dispatch(LoggedIn(token: "token"));
        yield CodeValidationInitial();
      } catch (error){
        yield CodeValidationFailure(error: error.toString());
      }
    }
  }
}
