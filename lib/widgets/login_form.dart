import 'package:diary_webapp/widgets/input_decorator.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required TextEditingController emailTextController,
    required TextEditingController passwordTextController,
  }) : _emailTextController = emailTextController, _passwordTextController = passwordTextController, super(key: key);

  final TextEditingController _emailTextController;
  final TextEditingController _passwordTextController;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                  controller: _emailTextController,
                  decoration: buildInputDecoration('email','bubbawatson@livgolf.com')),
            ),
            SizedBox(
                height: 20
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                  obscureText: true,
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
                      hintText: 'yoBang69!')),
            ),
            SizedBox(
                height: 20
            ),
            TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    backgroundColor: Colors.green,
                    textStyle: TextStyle(
                        fontSize: 18
                    )),
                onPressed: () {},
                child: Text('Sign in'))
          ],
        ));
  }
}