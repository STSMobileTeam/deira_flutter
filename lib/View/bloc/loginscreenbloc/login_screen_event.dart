part of 'login_screen_bloc.dart';

@immutable
abstract class LoginScreenEvent {}

class loginEvent extends LoginScreenEvent {}

class LoginScreenBlocLoadingEvent extends LoginScreenEvent {}

class LoginScreenBlocLoadingFinishedState extends LoginScreenState {}
