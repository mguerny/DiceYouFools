import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dice_you_fools/user_repository.dart';

import 'package:dice_you_fools/authentication/authentication.dart';
import 'package:dice_you_fools/splash/splash.dart';
import 'package:dice_you_fools/login/login.dart';
import 'package:dice_you_fools/home/home.dart';
import 'package:dice_you_fools/common/common.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    print(error);
  }
}

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(App(userRepository: UserRepository()));
}

class App extends StatefulWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  State<App> createState() => _AppState();

}

class _AppState extends State<App> {
  AuthenticationBloc _authenticationBloc;
  UserRepository get _userRepository => widget.userRepository;



  @override
  void initState() {
    _authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
    _authenticationBloc.dispatch(AppStarted());
    super.initState();
  }

  @override
  void dispose() {
    _authenticationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      bloc: _authenticationBloc,
      child: MaterialApp(
        home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
          bloc: _authenticationBloc,
          builder: (BuildContext context, AuthenticationState state) {
            if (state is AuthenticationUninitialized) {
              return SplashPage();
            }
            if (state is AuthenticationAuthenticated) {
              return HomePage();
            }
            if (state is AuthenticationUnauthenticated) {
              return LoginPage(userRepository: _userRepository);
            }
            if (state is AuthenticationLoading) {
              return LoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}
