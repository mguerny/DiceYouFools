import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dice_you_fools/authentication/authentication.dart';
import 'package:dice_you_fools/signup/signup.dart';

class SignupForm extends StatefulWidget {
  final SignupBloc signupBloc;
  final AuthenticationBloc authenticationBloc;


  SignupForm({
    Key key,
    @required this.signupBloc,
    @required this.authenticationBloc,
  }) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _nameController = TextEditingController();

  SignupBloc get _signupBloc => widget.signupBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupEvent, SignupState>(
      bloc: _signupBloc,
      builder: (
          BuildContext context,
          SignupState state,
          ) {
        if (state is SignupFailure) {
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
                                TextSpan(text: "Inscription", style: TextStyle(fontWeight: FontWeight.w300),),
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
                              SizedBox(height: 20.0),
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
                              SizedBox(height: 20.0),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(32.0)
                                ),
                                child: TextFormField(
                                  controller: _phoneNumberController,
                                  keyboardType: TextInputType.phone,
                                  autofocus: false,
                                  style: TextStyle(
                                    fontFamily: "Quicksand",
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Numéro de téléphone',
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
                              SizedBox(height: 20.0),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(32.0)
                                ),
                                child: TextFormField(
                                  controller: _nameController,
                                  keyboardType: TextInputType.text,
                                  autofocus: false,
                                  style: TextStyle(
                                    fontFamily: "Quicksand",
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Prénom',
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
                              SizedBox(height: 36.0),
                              ButtonTheme(
                                minWidth: MediaQuery.of(context).size.width,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  onPressed:
                                  state is! SignupLoading ? _onSignUpButtonPressed : null,
                                  padding: EdgeInsets.all(12),
                                  color: Colors.white,
                                  child: Text('S\'inscrire',
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
                                onPressed: state is! SignupLoading ? _onSignInButtonPressed : null,
                                child: Text(
                                  'Vous avez déjà un compte ? C\'est par ici',
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

  _onSignInButtonPressed() {
   _signupBloc.dispatch(SignInButtonPressed());
  }

  _onSignUpButtonPressed(){
    _signupBloc.dispatch(SignUpButtonPressed(
      username: _usernameController.text,
      password: _passwordController.text,
      phone: _phoneNumberController.text,
      name: _nameController.text,
    ));
  }
}