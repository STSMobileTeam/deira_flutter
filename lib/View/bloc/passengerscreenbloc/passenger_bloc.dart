import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'passenger_event.dart';
part 'passenger_state.dart';

class PassengerBloc extends Bloc<PassengerEvent, PassengerState> {
  PassengerBloc() : super(PassengerInitial()) {
    on<PassengerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
