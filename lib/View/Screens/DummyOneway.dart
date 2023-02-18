import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBloc extends Cubit<List<String>> {
  MyBloc() : super([]);

  void sendRequests() async {
    // Send multiple requests and add responses to state list
    final responses = await Future.wait([
      _sendRequest('https://jsonplaceholder.typicode.com/posts', {'id': 1}),
      _sendRequest('https://jsonplaceholder.typicode.com/comments', {'id': 2}),
      _sendRequest('https://jsonplaceholder.typicode.com/albums', {'id': 3}),
      _sendRequest('https://jsonplaceholder.typicode.com/photos', {'id': 4}),
      _sendRequest('https://jsonplaceholder.typicode.com/todos', {'id': 5}),
    ]);
    emit([...state, ...responses.map((response) => response.data)]);
  }

  Future<Response> _sendRequest(String url, Map<String, dynamic> data) async {
    final dio = Dio();
    final response = await dio.post(url, data: data);
    return response;
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => MyBloc(),
        child: Column(
          children: [
            SizedBox(height: 80,),
            ElevatedButton(
              onPressed: () {
                context.read<MyBloc>().sendRequests();
              },
              child: Text('Send requests'),
            ),
            Expanded(
              child: BlocBuilder<MyBloc, List<String>>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      return Text(state[index]);
                    },
                  );
                },
              ),
            ),
            BlocListener<MyBloc, List<String>>(
              listener: (context, state) {
                if (state.length == 5) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('All requests complete')),
                  );
                }
              },
              child: SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}


