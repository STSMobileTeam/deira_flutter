part of 'citysearch_bloc.dart';

@immutable
abstract class CitysearchState {}

class CitysearchInitial extends CitysearchState {}

class CitysearchBlocLoadingFinishedState extends CitysearchState {}
