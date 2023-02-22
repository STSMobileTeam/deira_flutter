part of 'oneway_bloc.dart';

@immutable
abstract class OnewayState {}

class OnewayInitial extends OnewayState {}

class OnewayBlocLoadingFinishedState extends OnewayState {}

class OnewayAllResponsesReceivedState extends OnewayState {}
