import 'package:flutter/material.dart';
import 'package:login/helpers/validations.dart';
import 'package:login/theme/style.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

enum LoginStatus { notSignIn, signIn }

class _SigninScreenState extends State<SigninScreen> with SingleTickerProviderStateMixin{
  Animation animation, delayedAnimation, muchDelayAnimation, transform, fadeAnimation;
  AnimationController animationController;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  bool autovalidate = false;
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  bool _isLoading = false;
  Validations validations = new Validations();
  TextEditingController _controllerEmail = new TextEditingController();
  TextEditingController _controllerPassword = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }


  processLogin(context) {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      autovalidate = true; // Start validating on every change.
    } else {
      form.save();

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                SizedBox(height: 100),
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
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text('Welcome back!',
                    style: TextStyle(fontSize: 35, color: whiteColor, fontWeight: FontWeight.w900),
                  )
                ),
                Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Text('Sign in to your account.',
                      style: TextStyle(fontSize: 17, color: whiteColor, fontWeight: FontWeight.w400),
                    )
                ),
                SizedBox(height: 60),
                Column(
                  children: [
                    _buildLoginForm(),
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }

  Container _buildLoginForm() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 15, right: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFF3A3A3C)
                ),
                child:TextFormField(
                  controller: _controllerEmail,
                  validator: validations.validateEmail,
                  style: TextStyle(color: whiteColor),
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: greyColor),
                    border: InputBorder.none,
                  ),
                )
            ),
            SizedBox(height: 10,),
            Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                    color: Color(0xFF3A3A3C)
                ),
                child: TextFormField(
                  controller: _controllerPassword,
                  validator: validations.validatePassword,
                  style: TextStyle(color: whiteColor),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: greyColor),
                    border: InputBorder.none,
                    //suffixIcon: _obscure ? Icon(Icons.remove_red_eye, color: whiteColor,) : Icon(Icons.cancel, color: whiteColor)
                  ),
                )
            ),
            SizedBox(height: 20,),
            ButtonTheme(
              minWidth: double.infinity,
              child: MaterialButton(
                elevation: 0,
                height: 45,
                color: primaryColor,
                textColor: whiteColor,
                onPressed: () {
                  processLogin(context);
                },
                child: Text('Continue'),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            SizedBox(height: 10.0,),
          ],
        ),
      ),
    );
  }
}
