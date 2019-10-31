import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dice_you_fools/authentication/authentication.dart';

class HomePage extends StatefulWidget {
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<HomePage> {
  AuthenticationBloc authenticationBloc;
  File _sampleImage;
  bool visibleAddButton = true;

  @override
  Widget build(BuildContext context) {
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 255, 218, 1),
      appBar:AppBar(
        elevation: 0,
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(text: "My"),
              TextSpan(text: "Emoji", style: TextStyle(fontWeight: FontWeight.w300),),
            ],
            style: TextStyle(
              fontFamily: "Quicksand",
              fontWeight: FontWeight.w500,
              fontSize: 30.0,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: false,
        backgroundColor: Color.fromRGBO(25, 255, 218, 1),
        actions: <Widget>[
          IconButton(
            onPressed: _logout,
            icon: Image.asset("assets/images/calendar.png",),
          ),
        ],
      ),
    );
  }

  _logout() {
    try {
      authenticationBloc.userRepository.logOut();
      authenticationBloc.dispatch(LoggedOut());
    } catch (error) {
      print(error.toString());
    }
  }
}
