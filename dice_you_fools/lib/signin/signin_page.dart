import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dice_you_fools/user_repository.dart';

import 'package:dice_you_fools/authentication/authentication.dart';
import 'package:dice_you_fools/signin/signin.dart';

class SigninPage extends StatefulWidget {
  final UserRepository userRepository;

  SigninPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  SigninBloc _signinBloc;
  AuthenticationBloc _authenticationBloc;

  UserRepository get _userRepository => widget.userRepository;

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _signinBloc = SigninBloc(
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
      body: SigninForm(
        authenticationBloc: _authenticationBloc,
        signinBloc: _signinBloc,
      ),
    );
  }

  @override
  void dispose() {
    _signinBloc.dispose();
    super.dispose();
  }
}