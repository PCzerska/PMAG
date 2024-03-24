import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:oldmap1/presentation/authentication/app_widget.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).whenComplete(() {
    runApp(const MyApp());
  });
}