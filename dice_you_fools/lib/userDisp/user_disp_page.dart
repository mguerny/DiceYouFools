import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_disp_bloc.dart';
import 'user_disp_form.dart';

class UserDispPage extends StatefulWidget {

  UserDispPage({Key key});

  @override
  State<UserDispPage> createState() => _UserDispPageState();
}

class _UserDispPageState extends State<UserDispPage> {
  UserDispBloc _userDispBloc;

  @override
  void initState() {
    _userDispBloc = UserDispBloc(
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 233, 233, 1),
      body: UserDispForm(
        userDispBloc: _userDispBloc,
      ),
    );
  }

  @override
  void dispose() {
    _userDispBloc.dispose();
    super.dispose();
  }
}
