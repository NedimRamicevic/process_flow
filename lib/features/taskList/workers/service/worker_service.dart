import 'dart:io';

import 'package:dio/dio.dart';
import '../model/worker.dart';

class WorkerService {
  final Dio _dio = Dio();
  final String urlPath = "https://jsonplaceholder.typicode.com/users";

  Future<List<Worker>> getWorkers() async {
    Response response = await _dio.get(urlPath);
    if (response.statusCode == HttpStatus.ok) {
      List responseList = response.data as List;
      return responseList.map((e) => Worker.fromJson(e)).toList();
    }
    return [];
  }
}
