import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:dice_you_fools/user_repository.dart';

import 'package:dice_you_fools/authentication/authentication.dart';
import 'package:dice_you_fools/signin/signin.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;


  SigninBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  SigninState get initialState => SigninInitial();

  @override
  Stream<SigninState> mapEventToState(
      SigninState currentState,
      SigninEvent event,
      ) async* {
    print("event = "+ event.toString());


    if (event is SigninButtonPressed) {
      yield SigninLoading();
      try {
        final token = await userRepository.authenticate(
          email: event.username,
          password: event.password,
        );

        authenticationBloc.dispatch(LoggedIn(token: token));
        yield SigninInitial();
      } catch (error) {
        yield SigninFailure(error: error.toString());
      }
    }
    if(event is SignUpButtonPressed){
      try {
        authenticationBloc.dispatch(SignedUp());
        yield SigninInitial();
      } catch (error) {
        yield SigninFailure(error: error.toString());
      }
    }
  }


}