import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dice_you_fools/user_repository.dart';

import 'package:dice_you_fools/authentication/authentication.dart';
import 'package:dice_you_fools/signup/signup.dart';

class SignupPage extends StatefulWidget {
  final UserRepository userRepository;

  SignupPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  SignupBloc _signupBloc;
  AuthenticationBloc _authenticationBloc;

  UserRepository get _userRepository => widget.userRepository;

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _signupBloc = SignupBloc(
      userRepository: _userRepository,
      authenticationBloc: _authenticationBloc,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Login'),
      ),*/
      body: SignupForm(
        authenticationBloc: _authenticationBloc,
        signupBloc: _signupBloc,
      ),
    );
  }

  @override
  void dispose() {
    _signupBloc.dispose();
    super.dispose();
  }
}