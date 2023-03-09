import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pax_operation_event.dart';
part 'pax_operation_state.dart';

class PaxOperationBloc extends Bloc<PaxOperationEvent, PaxOperationState> {
  PaxOperationBloc() : super(PaxOperationInitial()) {
    on<PaxOperationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
