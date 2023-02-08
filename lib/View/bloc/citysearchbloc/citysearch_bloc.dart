import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'citysearch_event.dart';
part 'citysearch_state.dart';

class CitysearchBloc extends Bloc<CitysearchEvent, CitysearchState> {
  CitysearchBloc() : super(CitysearchInitial()) {
    on<CitysearchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
