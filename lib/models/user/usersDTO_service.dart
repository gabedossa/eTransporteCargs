import 'package:app/models/user/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersDTOServices{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; 

  addUser(Users users){
    _firestore.collection('users').add(users.toMap());
  }
}