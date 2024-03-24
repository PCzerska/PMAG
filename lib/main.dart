import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oldmap1/presentation/authentication/app_widget.dart';
import 'firebase_options.dart';
import 'package:oldmap1/presentation/authentication/authentication_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(),
      child: const MyApp(),
    ),
  );
}
