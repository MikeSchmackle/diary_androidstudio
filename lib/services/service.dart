
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import '../model/user.dart';

class DiaryService{
  final CollectionReference userCollectionReference =
    FirebaseFirestore.instance.collection('users');

  Future<void> loginUser(String email, String password) async{
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return;
  }
  Future<void> createUser(String displayName, BuildContext context, String uid) async{
      MUser user = MUser(
      avatarUrl: 'https://amazon.com',
      profession: 'Captain',
      uid: uid,
      displayName: displayName,
      );
      userCollectionReference.add(user.toMap());
      return;
  }
}