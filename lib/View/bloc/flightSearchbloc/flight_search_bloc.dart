import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'flight_search_event.dart';
part 'flight_search_state.dart';

class FlightSearchBloc extends Bloc<FlightSearchEvent, FlightSearchState> {

  bool roundtripshow = false;


  FlightSearchBloc() : super(FlightSearchInitial()) {
    on<FlightSearchEvent>((event, emit) {

    });
  }
}
