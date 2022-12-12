import 'package:flutter/material.dart';
import 'package:diary_webapp/widgets/input_decorator.dart';
import 'package:diary_webapp/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController= TextEditingController();
  final GlobalKey<FormState>? _globalKey= GlobalKey<FormState>();

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
                    child: LoginForm(
                        formKey: _globalKey,
                        emailTextController: _emailTextController,
                        passwordTextController: _passwordTextController),
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



