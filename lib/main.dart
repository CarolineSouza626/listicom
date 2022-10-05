import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:listicom/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAvpQzZuwEnKVtDxSPem4FbbDawmxIWSKw",
        authDomain: "shopcom-90018.firebaseapp.com",
        projectId: "shopcom-90018",
        storageBucket: "shopcom-90018.appspot.com",
        messagingSenderId: "429457254138",
        appId: "1:429457254138:web:4ccbc4333abc107b610b43",
        measurementId: "G-QN42RLP5VE"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de aplicaçoes 1.0',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const LoginScreen(),
    );
  }
}
