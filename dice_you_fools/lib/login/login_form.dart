import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

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
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

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

        return Form(
          child: SafeArea(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: [
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: "My"),
                        TextSpan(text: "Emoji", style: TextStyle(fontWeight: FontWeight.w300),),
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
                      color: Color.fromRGBO(0, 223, 186, 1),
                    ),
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.w300,
                        fontSize: 22.0,
                        color: Color.fromRGBO(0, 223, 186, 1),
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
                      color: Color.fromRGBO(0, 223, 186, 1),
                    ),
                    decoration: InputDecoration(
                      hintText: 'Mot de passe',
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      hintStyle: TextStyle(
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.w300,
                        fontSize: 22.0,
                        color: Color.fromRGBO(0, 223, 186, 1),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){},
                  child: Text(
                    'Mot de passe oublié ?',
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(height: 38.0),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  onPressed:
                  state is! LoginLoading ? _onLoginButtonPressed : null,
                  padding: EdgeInsets.all(12),
                  color: Colors.white,
                  child: Text('Connexion', style: TextStyle(color: Colors.red, fontFamily: "Quicksand", fontWeight: FontWeight.w500, fontSize: 22.0,)),
                ),
                SizedBox(height: 8.0),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  onPressed:
                  state is! LoginLoading ? _onGoogleButtonPressed : null,

                  padding: EdgeInsets.all(12),
                  color: Colors.red,
                  child: Text('Google', style: TextStyle(color: Colors.white, fontFamily: "Quicksand", fontWeight: FontWeight.w500,fontSize: 22.0,)),
                ),
                FlatButton(
                  onPressed: (){},
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
                Container(
                  child:
                  state is LoginLoading ? CircularProgressIndicator() : null,
                  height: 30,
                  width: 30,
                ),
              ],
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

  _onLoginButtonPressed() {
    _loginBloc.dispatch(LoginButtonPressed(
      username: _usernameController.text,
      password: _passwordController.text,
    ));
  }
  _onGoogleButtonPressed(){
    _loginBloc.dispatch(GoogleButtonPressed());
  }
}
