import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'multiple_requests_event.dart';
part 'multiple_requests_state.dart';

class MultipleRequestsBloc {
  final List<String> _urls = [
    'https://jsonplaceholder.typicode.com/posts',
    'https://jsonplaceholder.typicode.com/comments',
    'https://jsonplaceholder.typicode.com/albums',
    'https://jsonplaceholder.typicode.com/photos',
    'https://jsonplaceholder.typicode.com/todos',
  ];

  final List<StreamController<Response>> _streamControllers = List.generate(5, (_) => StreamController<Response>(),);

  final Dio _dio = Dio();

  void sendRequest(int index, Map<String, dynamic> data) {
    final url = _urls[index];
    final streamController = _streamControllers[index];
    _dio.post(url, data: data).then((response) {
      streamController.add(response);
    }).catchError((error) {
      streamController.addError(error);
    });
  }

  Stream<Response> getResponseStream(int index) {
    return _streamControllers[index].stream;
  }

  void dispose() {
    for (final streamController in _streamControllers) {
      streamController.close();
    }
  }
}