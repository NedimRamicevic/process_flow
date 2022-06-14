import 'dart:io';

import 'package:dio/dio.dart';
import 'package:process_flow/views/workers/model/worker.dart';

class WorkerService {
  final Dio _dio = Dio();
  final String urlPath = "https://jsonplaceholder.typicode.com/users";

  Future<List<Worker>?> getWorkers() async {
    Response response = await _dio.get(urlPath);
    if (response.statusCode == HttpStatus.ok) {
      if (response.data is List) {
        return response.data.map((e) => Worker.fromJson(e)).toList();
      }
    }
    return null;
  }
}
