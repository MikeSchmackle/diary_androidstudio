

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                  color: Color(0XFFB9CD1),
                ),
            ),
          // Text('Sign In',
          //  style: Theme.of(context).,)
          ],
        )
      ),
    );
  }
}
