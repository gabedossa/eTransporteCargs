import 'package:app/models/user/user_local.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class usersServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addUser(UserLocal users) {
    _firestore.collection('users').add(users.toMap());
  }
}
