import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'oneway_cupit_event.dart';
part 'oneway_cupit_state.dart';

class OnewayCupitBloc extends Bloc<OnewayCupitEvent, OnewayCupitState> {
  OnewayCupitBloc() : super(OnewayCupitInitial()) {
    on<OnewayCupitEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
