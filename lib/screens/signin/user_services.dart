import 'package:app/models/user/user_local.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firestore = FirebaseFirestore.instance;

class UserServices {
  UserLocal? userLocal;

    Future<void> signIn(UserLocal userLocal, { Function? onSucess, Function? onFail }) async {
    try {
      User? user = (await _auth.signInWithEmailAndPassword(
              email: userLocal.user_email!, password: userLocal.user_senha!))
          .user;
          this.userLocal = userLocal;
          this.userLocal!.user_id = user!.uid;
          onSucess!();
    } on PlatformException catch (e) {
      onFail!(debugPrint(e.toString()));
    }
  }

  Future<void>signUp(UserLocal userLocal, { Function? onSucess, Function? onFail }) async{
    try {
     User? user = (await _auth.createUserWithEmailAndPassword(email: userLocal.user_email!, password: userLocal.user_senha!)).user;
     this.userLocal = userLocal;
     this.userLocal!.user_id = user!.uid;
     onSucess!();
    } catch (e) {
      onFail!(e);
    }
  }
}
