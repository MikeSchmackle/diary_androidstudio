

import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(String label, String hint) {
  return InputDecoration(
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
      labelText: label,
      hintText: hint);
}