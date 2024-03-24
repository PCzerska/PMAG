abstract class AuthenticationEvent {}

class AppStarted extends AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}

class RegisterEvent extends AuthenticationEvent {
  final String email;
  final String password;

  RegisterEvent(this.email, this.password);
}

class LogoutEvent extends AuthenticationEvent {}
