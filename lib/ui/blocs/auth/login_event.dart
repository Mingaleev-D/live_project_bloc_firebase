part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class RequestGoogleLoginEvent extends LoginEvent {}

class RequestGitHubLoginEvent extends LoginEvent {}
