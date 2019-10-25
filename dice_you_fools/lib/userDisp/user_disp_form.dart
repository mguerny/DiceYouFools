import 'package:dice_you_fools/model/user.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_disp_bloc.dart';
import 'user_disp_event.dart';
import 'user_disp_state.dart';


class UserDispForm extends StatefulWidget {
  final UserDispBloc userDispBloc;


  UserDispForm({
    Key key,
    @required this.userDispBloc,
  }) : super(key: key);

  @override
  State<UserDispForm> createState() => _UserDispFormState();
}

class _UserDispFormState extends State<UserDispForm> {

  UserDispBloc get _userDispBloc => widget.userDispBloc;

  @override
  Widget build(BuildContext context) {
    
    final User user = ModalRoute.of(context).settings.arguments;

    return BlocBuilder<UserDispEvent, UserDispState>(
      bloc: _userDispBloc,
      builder: (
        BuildContext context,
        UserDispState state,
      ) {
        return Form(
          child: SafeArea(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: [
                Padding( // USER NAME
                  padding: const EdgeInsets.only(
                    left: 0,
                    top: 20,
                    right: 0,
                    bottom: 20,
                  ),
                  child: Text(
                    user.name,
                    style: TextStyle(
                        fontFamily: "Helvetica",
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0,
                        color: Colors.black,
                      ),
                  ),
                ),
                Padding( // USER EMAIL
                  padding: const EdgeInsets.only(
                    left: 0,
                    top: 20,
                    right: 0,
                    bottom: 20,
                  ),
                  child: Text(
                    user.email,
                    style: TextStyle(
                        fontFamily: "Helvetica",
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}