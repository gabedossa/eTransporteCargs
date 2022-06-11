import 'package:app/models/users/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersServer{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; 

  addUser(Users users){
    _firestore.collection('users').add(users.toMap());
  }
}