import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:othmane_bouhanib/screens/home_screen.dart';
import 'package:othmane_bouhanib/screens/profil_copie';
import 'package:othmane_bouhanib/screens/signin_screen.dart';
import 'package:othmane_bouhanib/screens/profil';
import 'package:othmane_bouhanib/screens/chercher.dart';
import 'package:othmane_bouhanib/screens/signup_screen.dart';
import 'package:othmane_bouhanib/screens/panier.dart';

import 'screens/add_vetement_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
    apiKey: "AIzaSyBTy8DaI2QA0tyqmfg4O2XIQhvI6wpeolU",
    appId: "1:602394318520:web:108a9b9859f8e7a751064d",
    messagingSenderId: "602394318520",
    projectId: "signin-example-3db05",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/profil": (context) => ProfilPage(),
        "/chercher": (context) => const ChercherPage(),
        "/liste_vetement": (context) => const HomeScreen(),
        "/panier": (context) => const PanierPage(),
      },
      title: 'MIAGED',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignInScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(),
    );
  }
}
