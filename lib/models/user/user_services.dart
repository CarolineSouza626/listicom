import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:listicom/models/user/user.dart';

class UserServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DocumentReference get firestoRef => _firestore.doc('user/${userLocal!.id}');
  UserLocal? userLocal;
  Future<void> registro(UserLocal userLocal) async {
    User? user = (await _auth.createUserWithEmailAndPassword(
            email: userLocal.email!, password: userLocal.password!))
        .user;

    userLocal.id = user!.uid;
    this.userLocal = userLocal;
  }

  Future<void> saveData() async {
    await firestoRef.set(userLocal!.toMap());
  }
}
