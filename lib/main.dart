//import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_webapp/screens/get_started_page.dart';
import 'package:flutter/material.dart';
//import 'screens/main_page.dart';

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: FirebaseOptions(
         apiKey: "AIzaSyCa4n9kdshjrnWGiQvJdshT3g3prT_zfLo",
         authDomain: "diary-app-course-67fbc.firebaseapp.com",
         projectId: "diary-app-course-67fbc",
         storageBucket: "diary-app-course-67fbc.appspot.com",
         messagingSenderId: "279474906769",
         appId: "1:279474906769:web:f1621c6663717b9c798130"
     ),
   );
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Diary Book',
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primarySwatch: Colors.green),
        home: GettingStartedPage());
  }
}

 class GetInfo extends StatelessWidget {
  const GetInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('diaries').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Issue accessing Firestore Collection');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading');
          }
          return new ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              return new ListTile(
                title: Text(document.get('display_name')),
                subtitle: Text(document.get('profession')),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
