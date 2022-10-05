import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class UserLocal {
  String? id;
  String? name;
  String? socialmedia;
  String? email;
  String? password;
  String? confimpasswordd;
  UserLocal({
    this.id,
    this.name,
    this.socialmedia,
    this.email,
    this.password,
    this.confimpasswordd,
  });

  UserLocal.fromDocument(DocumentSnapshot doc) {
    id = doc.id;
    name = doc.get('name') as String;
    email = doc.get('email') as String;
    socialmedia = doc.get('socialmedia') as String;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'socialmedia': socialmedia,
    };
  }
}
