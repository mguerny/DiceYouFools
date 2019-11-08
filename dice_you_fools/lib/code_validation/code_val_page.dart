import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dice_you_fools/user_repository.dart';

import 'package:dice_you_fools/authentication/authentication.dart';
import 'package:dice_you_fools/code_validation/code_val.dart';

class CodeValidationPage extends StatefulWidget {
  final UserRepository userRepository;

  CodeValidationPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  State<CodeValidationPage> createState() => _CodeValidationPageState();
}

class _CodeValidationPageState extends State<CodeValidationPage> {
  CodeValidationBloc _codeValidationBloc;
  AuthenticationBloc _authenticationBloc;

  UserRepository get _userRepository => widget.userRepository;

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _codeValidationBloc = CodeValidationBloc(
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
      body: CodeValidationForm(
        authenticationBloc: _authenticationBloc,
        codeValidationBloc: _codeValidationBloc,
      ),
    );
  }

  @override
  void dispose() {
    _codeValidationBloc.dispose();
    super.dispose();
  }
}
