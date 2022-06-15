import 'package:flutter/cupertino.dart';

import '../model/worker.dart';
import '../service/worker_service.dart';

class WorkerViewModel extends ChangeNotifier {
  final WorkerService _workerService = WorkerService();

  List<Worker> workers = [];

  Future<void> getWorkers() async {
    final _workers = await _workerService.getWorkers();
    workers.addAll(_workers);
    notifyListeners();
  }

  Worker getWorkerbyId(String id) {
    final worker = workers.firstWhere((e) => e.id.toString() == id);
    return worker;
  }
}
