import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 255, 217, 1),
      body: Center (
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/myemoji.png',
              width: 320,
              height: 320,
              /*color: Colors.red,
              colorBlendMode: BlendMode.multiply,*/
              fit: BoxFit.cover,
            ),
            RichText(
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
          ],
        ),
      ),
    );
  }
}
