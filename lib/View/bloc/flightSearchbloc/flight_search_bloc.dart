import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'flight_search_event.dart';
part 'flight_search_state.dart';

class FlightSearchBloc extends Bloc<FlightSearchEvent, FlightSearchState> {

  bool roundtripshow = false;

  String fromCityCode = "No City",toCityCode = "No City";
  String fromCityName = "Select City", toCityName = "Select City";

  int adulttxt = 1;
  int childrentxt = 0;
  int infanttxt = 0;


  FlightSearchBloc() : super(FlightSearchInitial()) {
    on<FlightSearchEvent>((event, emit) {

      if(event is PassengerRefreshEvent){
        emit(PassengerRefreshState());
      }

    });
  }
}
