part of 'passenger_bloc.dart';

@immutable
abstract class PassengerState {}

class PassengerInitial extends PassengerState {}

class PassengerBlocLoadingState extends PassengerState {}

class PassengerBlocLoadingFinishedState extends PassengerState {}


