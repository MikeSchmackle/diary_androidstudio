import 'package:diary_webapp/widgets/input_decorator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/main_page.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required TextEditingController emailTextController,
    required TextEditingController passwordTextController,
    GlobalKey<FormState>? formKey
  }) : _emailTextController = emailTextController,
        _passwordTextController = passwordTextController,
        _globalKey = formKey,
        super(key: key);
  final TextEditingController _emailTextController;
  final TextEditingController _passwordTextController;
  final GlobalKey<FormState>? _globalKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                validator: (value){
                  return value!.isEmpty ? 'Please enter an email' : null;
                },
                  controller: _emailTextController,
                  decoration: buildInputDecoration('email','bubbawatson@livgolf.com')),
            ),
            SizedBox(
                height: 20
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                  validator: (value){
                    return value!.isEmpty ? 'Please enter a password' : null;
                  },
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
                onPressed: () {
                  if ( _globalKey!.currentState!.validate()) {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text)
                        .then((value) {
                      return Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return MainPage();
                          },
                          ));
                    });
                  }
                },
                child: Text('Sign in'))
          ],
        ));
  }
}