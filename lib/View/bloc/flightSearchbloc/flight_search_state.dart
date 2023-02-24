part of 'flight_search_bloc.dart';

@immutable
abstract class FlightSearchState {}

class FlightSearchInitial extends FlightSearchState {}

class PassengerRefreshState extends FlightSearchState {}
