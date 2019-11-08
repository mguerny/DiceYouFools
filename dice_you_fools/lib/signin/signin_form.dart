import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dice_you_fools/authentication/authentication.dart';
import 'package:dice_you_fools/signin/signin.dart';

class SigninForm extends StatefulWidget {
  final SigninBloc signinBloc;
  final AuthenticationBloc authenticationBloc;


  SigninForm({
    Key key,
    @required this.signinBloc,
    @required this.authenticationBloc,
  }) : super(key: key);

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  SigninBloc get _signinBloc => widget.signinBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SigninEvent, SigninState>(
      bloc: _signinBloc,
      builder: (
          BuildContext context,
          SigninState state,
          ) {
        if (state is SigninFailure) {
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
                        Center(
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(text: "Connexion", style: TextStyle(fontWeight: FontWeight.w300),),
                              ],
                              style: TextStyle(
                                fontFamily: "Quicksand",
                                fontWeight: FontWeight.w500,
                                fontSize: 62.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 48.0),
                        Padding(
                          padding: EdgeInsets.only(left: 24.0, right: 24.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(32.0)
                                ),
                                child: TextFormField(
                                  controller: _usernameController,
                                  keyboardType: TextInputType.emailAddress,
                                  autofocus: false,
                                  style: TextStyle(
                                    fontFamily: "Quicksand",
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                      fontFamily: "Quicksand",
                                      fontWeight: FontWeight.w300,
                                      fontSize: 22.0,
                                    ),
                                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(32.0)
                                ),
                                child:
                                TextFormField(
                                  controller: _passwordController,
                                  autofocus: false,
                                  obscureText: true,
                                  style: TextStyle(
                                    fontFamily: "Quicksand",
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Mot de passe',
                                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                    hintStyle: TextStyle(
                                      fontFamily: "Quicksand",
                                      fontWeight: FontWeight.w300,
                                      fontSize: 22.0,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 36.0),
                              ButtonTheme(
                                minWidth: MediaQuery.of(context).size.width,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  onPressed:
                                  state is! SigninLoading ? _onSigninButtonPressed : null,
                                  padding: EdgeInsets.all(12),
                                  color: Colors.white,
                                  child: Text('Se connecter',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontFamily: "Quicksand",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22.0,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.0),
                              FlatButton(
                                onPressed: state is! SigninLoading ? _onSignUpButtonPressed : null,
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
                      ]
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

  _onSigninButtonPressed() {
    _signinBloc.dispatch(SigninButtonPressed(
      username: _usernameController.text,
      password: _passwordController.text,
    ));
  }

  _onSignUpButtonPressed(){
    _signinBloc.dispatch(SignUpButtonPressed(
      username: _usernameController.text,
      password: _passwordController.text,
    ));
  }
}