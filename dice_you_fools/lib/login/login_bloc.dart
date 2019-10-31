import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:dice_you_fools/user_repository.dart';

import 'package:dice_you_fools/authentication/authentication.dart';
import 'package:dice_you_fools/login/login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginState currentState,
    LoginEvent event,
  ) async* {
    print("event = "+ event.toString());
      if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.authenticate(
          email: event.username,
          password: event.password,
        );

        authenticationBloc.dispatch(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
    if(event is SignUpButtonPressed){
      yield LoginLoading();
      print("SignUpButtonPressed");
      try{
        final token = await userRepository.signUp(email: event.username, password: event.password);
//        authenticationBloc.dispatch(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error){
        yield LoginFailure(error: error.toString());
      }
    }
    if(event is AppleSignInButtonPressed){
      try{
        final token = await userRepository.signInWithApple();
        authenticationBloc.dispatch(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error){
        yield LoginFailure(error: error.toString());
      }
    }
    if(event is CodeValidateButtonPressed){
      yield LoginLoading();
      print("CodeValidateButtonPressed");
      try{
        print("code validation " + event.code);
        print("email validation " + event.email);
        final token = await userRepository.smsValidation(email: event.email, code: event.code);
        //authenticationBloc.dispatch(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error){
        yield LoginFailure(error: error.toString());
      }
    }

  }
}
