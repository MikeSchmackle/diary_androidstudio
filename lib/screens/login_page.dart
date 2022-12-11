import 'package:flutter/material.dart';
import 'package:diary_webapp/widgets/input_decorator.dart';
import 'package:diary_webapp/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailTextController;
  final TextEditingController _passwordTextController;
  final GlobalKey<FormState>? _globalKey;

  const LoginPage(
      {Key? key,
        GlobalKey<FormState>? formKey,
        required TextEditingController emailTextController,
        required TextEditingController passwordTextController})
      : _emailTextController = emailTextController,
        _passwordTextController = passwordTextController,
        _globalKey = formKey,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Color(0XFFB9C2D1),
                ),
              ),
              Text('Sign In', style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: LoginForm(emailTextController: _emailTextController, passwordTextController: _passwordTextController),
                  )
                ],
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Color(0XFFB9C2D1),
                  ))
            ],
          )),
    );
  }


}



