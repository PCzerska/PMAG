import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oldmap1/presentation/pages/map.dart';
import 'package:oldmap1/presentation/authentication/authenttication_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFEDE7F6),
        fontFamily: 'Montserrat',
      ),
      home: FutureBuilder<User?>(
        future: FirebaseAuth.instance.authStateChanges().first,
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasData && snapshot.data != null) {
              return const SecondScreen();
            } else {
              return const MyHomePage(title: 'Logowanie do aplikacji');
            }
          }
        },
      ),
    );
  }
}