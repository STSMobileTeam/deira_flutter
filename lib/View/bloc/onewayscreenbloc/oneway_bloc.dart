import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'oneway_event.dart';
part 'oneway_state.dart';

class OnewayBloc extends Bloc<OnewayEvent, OnewayState> {
  OnewayBloc() : super(OnewayInitial()) {
    on<OnewayEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
