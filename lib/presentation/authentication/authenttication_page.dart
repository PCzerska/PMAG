import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oldmap1/common/utils/toast_utils.dart';
import 'package:oldmap1/presentation/pages/map.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _registerEmailController = TextEditingController();
  final TextEditingController _registerPasswordController = TextEditingController();
  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Logowanie do aplikacji'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.network(
                  'https://supergify.pl/images/stories/Zoo/krok__6_.gif',
                  height: 100,
                  width: 100,
                ),
                TextFormField(
                  controller: _registerEmailController,
                  decoration: const InputDecoration(
                    hintText: 'E-mail',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _registerPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Hasło',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _register,
                  child: const Text('Zarejestruj się'),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _loginEmailController,
                  decoration: const InputDecoration(
                    hintText: 'Login',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _loginPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Hasło',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('Zaloguj się'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _register() {
    String email = _registerEmailController.text;
    String password = _registerPasswordController.text;
    _auth.createUserWithEmailAndPassword(email: email, password: password)
        .then((_) {
      ToastUtils.showToast("Zarejestrowano pomyślnie");
    })
        .catchError((error) {
      ToastUtils.showToast("Wystąpił błąd podczas rejestracji: ${error.toString()}");
    });
  }

  void _login() {
    String email = _loginEmailController.text;
    String password = _loginPasswordController.text;
    _auth.signInWithEmailAndPassword(email: email, password: password)
        .then((_) {
      ToastUtils.showToast("Zalogowano pomyślnie");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SecondScreen()),
      );
    })
        .catchError((error) {
      // Komunikat o błędzie logowania
      ToastUtils.showToast("Wystąpił błąd podczas logowania: ${error.toString()}");
    });
  }
}