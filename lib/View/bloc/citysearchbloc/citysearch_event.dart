part of 'citysearch_bloc.dart';

@immutable
abstract class CitysearchEvent {}

class CityEvent extends CitysearchEvent {}

class CitysearchLoadingEvent extends CitysearchEvent {}

