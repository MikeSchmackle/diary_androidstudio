import 'package:flutter/material.dart';
import 'package:diary_webapp/widgets/input_decorator.dart';

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
                    child: Form(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                                controller: _emailTextController,
                                decoration: buildInputDecoration('email','bubbawatson@livgolf.com')),
                          TextFormField(
                              controller: _passwordTextController,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide:
                                      BorderSide(color: Colors.blue) //BorderSide
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide:
                                      BorderSide(color: Color(0XFF69639f))),
                                  labelText: 'password',
                                  hintText: 'yoBang69!'))
                          ],
                        )),
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

