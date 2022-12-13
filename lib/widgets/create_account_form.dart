import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_webapp/services/service.dart';
import 'package:diary_webapp/widgets/input_decorator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../model/user.dart';
import '../screens/main_page.dart';

class CreateAccountForm extends StatelessWidget {
  const CreateAccountForm({
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
            Text('Please enter a valid email and password that is at least 6 characters '),
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
                    String email = _emailTextController.text;

                    FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text).then((value) {
                        //Create User -avatar/display_name/uid
                        if (value.user!=null){
                          String uid=value.user!.uid;
                          DiaryService()
                            .createUser(email.toString().split('@')[0],context,uid)
                            .then((value) {
                              DiaryService().loginUser(email, _passwordTextController.text)
                              .then((value){
                                return Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainPage(),
                                ));
                              });
                            });
                          }
                    });
                }}, child: Text('Create Account'))
          ]
        ),
    );
  }
}