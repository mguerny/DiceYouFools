import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:dice_you_fools/authentication/authentication.dart';
import 'package:dice_you_fools/login/login.dart';


class LoginForm extends StatefulWidget {
  final LoginBloc loginBloc;
  final AuthenticationBloc authenticationBloc;


  LoginForm({
    Key key,
    @required this.loginBloc,
    @required this.authenticationBloc,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  LoginBloc get _loginBloc => widget.loginBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginEvent, LoginState>(
      bloc: _loginBloc,
      builder: (
        BuildContext context,
        LoginState state,
      ) {
        if (state is LoginFailure) {
          _onWidgetDidBuild(() {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.red,
              ),
            );
          });
        }

        return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                image: ExactAssetImage('assets/images/gandalf.jpg'),
                fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Dice',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "Helvetica",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 62.0,
                                  color: Colors.white,
                                ),
                              ),
                              Text('You',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "Helvetica",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 62.0,
                                  color: Colors.white,
                                ),
                              ),
                              Text('Fool !',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "Helvetica",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 62.0,
                                  color: Colors.white,
                                ),
                              ),
                              Text('Your game manager',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "Helvetica",
                                  fontWeight: FontWeight.w100,
                                  fontSize: 25.0,
                                  color: Color.fromRGBO(147, 147, 147, 1),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 100.0),
                          Padding(
                            padding: EdgeInsets.only(left: 24.0, right: 24.0),
                            child: Column(
                              children: <Widget>[
                                AppleSignInButton(
                                  onPressed: _onAppleSignInPressed,
                                ),
                                SizedBox(height: 38.0),
                                ButtonTheme(
                                  minWidth: MediaQuery.of(context).size.width,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    onPressed:
                                    state is! LoginLoading ? _onSigninButtonPressed : null,
                                    padding: EdgeInsets.all(12),
                                    color: Colors.white,
                                    child: Text('Se connecter',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontFamily: "Quicksand",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.0),
                          FlatButton(
                            onPressed: state is! LoginLoading ? _onSignUpButtonPressed : null,
                            child: Text(
                              'Pas encore inscrit ? C\'est par ici ! ',
                              style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                                fontFamily: "Quicksand",
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                    ),
                  ),
                ),
              ),
            ),
          );
      },
    );
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  _onAppleSignInPressed(){
    _loginBloc.dispatch(AppleSignInButtonPressed());
  }

  _onSigninButtonPressed() {
    _loginBloc.dispatch(SignInButtonPressed());
  }


  _onSignUpButtonPressed(){
    _loginBloc.dispatch(SignUpButtonPressed());
  }

}
