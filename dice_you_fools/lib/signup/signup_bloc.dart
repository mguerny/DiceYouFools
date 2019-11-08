import 'dart:async';
import 'dart:math';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:dice_you_fools/user_repository.dart';

import 'package:dice_you_fools/authentication/authentication.dart';
import 'package:dice_you_fools/signup/signup.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;


  SignupBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  SignupState get initialState => SignupInitial();

  @override
  Stream<SignupState> mapEventToState(
      SignupState currentState,
      SignupEvent event,
      ) async* {
    print("event = "+ event.toString());

    if (event is SignUpButtonPressed) {
      yield SignupLoading();
      print("SignUpButtonPressed");
      try{
        final userCreated = await userRepository.signUp(email: event.username, password: event.password, phone: event.phone, name: event.name);
//        authenticationBloc.dispatch(LoggedIn(token: token));

        authenticationBloc.dispatch(CodeValidate());

        yield SignupInitial();
      } catch (error){
        yield SignupFailure(error: error.toString());
      }
    }
    if(event is SignInButtonPressed){
      try {
        authenticationBloc.dispatch(SignedIn());
        yield SignupInitial();
      } catch (error) {
        yield SignupFailure(error: error.toString());
      }
    }
  }


}