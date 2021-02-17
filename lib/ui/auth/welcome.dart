import 'package:flutter/material.dart';
import 'package:login/router.dart';
import 'package:login/theme/style.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool _revealPassword = false;

  void passwordReveal() {

  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 150),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 100,
                      width: 100,
                    )
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Get Your Money\nUnder Control',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 35, color: whiteColor, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 10),
              Text(
                'Manage your expenses.\nSeamlessly',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white54, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 120),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new ButtonTheme(
                      height: 40.0,
                      minWidth: MediaQuery.of(context).size.width * 0.9,
                      child: RaisedButton.icon(
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(3.0)),
                        elevation: 0.0,
                        color: primaryColor,
                        icon: new Text(''),
                        label: new Text('Login', style: TextStyle(color: whiteColor, fontSize: 20, fontWeight: FontWeight.bold)),
                        onPressed: (){
                          Navigator.of(context).pushNamed(AppRoute.signinScreen);
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    new ButtonTheme(
                      height: 40.0,
                      minWidth: MediaQuery.of(context).size.width * 0.9,
                      child: RaisedButton.icon(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(3.0),
                            side: BorderSide(
                                color: blackColor
                            )
                        ),
                        elevation: 0.0,
                        color: whiteColor,
                        icon: new Text(''),
                        label: new Text('Register', style: TextStyle(color: blackColor, fontSize: 20, fontWeight: FontWeight.bold)),
                        onPressed: (){
                          Navigator.of(context).pushNamed(AppRoute.signupScreen);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
