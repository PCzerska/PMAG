import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';


// Eventy
abstract class AuthenticationEvent {}

class AppStarted extends AuthenticationEvent {}

class UserLoggedIn extends AuthenticationEvent {}

class UserLoggedOut extends AuthenticationEvent {}

// Stany
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticatedState extends AuthenticationState {}

class UnauthenticatedState extends AuthenticationState {}

// Bloc
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthenticationBloc() : super(AuthenticationInitial());

  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event,
      ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is UserLoggedIn) {
      yield* _mapUserLoggedInToState();
    } else if (event is UserLoggedOut) {
      yield* _mapUserLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        yield AuthenticatedState();
      } else {
        yield UnauthenticatedState();
      }
    } catch (_) {
      yield UnauthenticatedState();
    }
  }

  Stream<AuthenticationState> _mapUserLoggedInToState() async* {
    yield AuthenticatedState();
  }

  Stream<AuthenticationState> _mapUserLoggedOutToState() async* {
    yield UnauthenticatedState();
  }
}
