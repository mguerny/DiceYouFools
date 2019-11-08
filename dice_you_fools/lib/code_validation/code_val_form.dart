import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dice_you_fools/authentication/authentication.dart';
import 'package:dice_you_fools/code_validation/code_val.dart';

class CodeValidationForm extends StatefulWidget {
  final CodeValidationBloc codeValidationBloc;
  final AuthenticationBloc authenticationBloc;


  CodeValidationForm({
    Key key,
    @required this.codeValidationBloc,
    @required this.authenticationBloc,
  }) : super(key: key);

  @override
  State<CodeValidationForm> createState() => _CodeValidationFormState();
}

class _CodeValidationFormState extends State<CodeValidationForm> {
  final _codeValidationController = TextEditingController();

  CodeValidationBloc get _codeValidationBloc => widget.codeValidationBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CodeValidationEvent, CodeValidationState>(
      bloc: _codeValidationBloc,
      builder: (
          BuildContext context,
          CodeValidationState state,
          ) {
        if (state is CodeValidationFailure) {
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
                                TextSpan(text: "Code de Validation", style: TextStyle(fontWeight: FontWeight.w300),),
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
                                  controller: _codeValidationController,
                                  keyboardType: TextInputType.text,
                                  autofocus: false,
                                  style: TextStyle(
                                    fontFamily: "Quicksand",
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Code',
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
                              ButtonTheme(
                                minWidth: MediaQuery.of(context).size.width,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  onPressed:
                                  state is! CodeValidationLoading ? _onCodeValidationButtonPressed : null,
                                  padding: EdgeInsets.all(12),
                                  color: Colors.white,
                                  child: Text('Valider',
                                    style: TextStyle(
                                      color: Colors.green,
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

  _onCodeValidationButtonPressed() {
    _codeValidationBloc.dispatch(CodeValidationButtonPressed(
      code: _codeValidationController.text,
      email: "romain.petit.33@hotmail.fr",
    ));
  }
}