import 'package:flutter/cupertino.dart';
import 'package:process_flow/features/taskList/workers/model/worker.dart';

class WorkerProvider extends ChangeNotifier {
  Worker? currentWorker;

  void getWorker(Worker worker) {
    currentWorker = worker;
    notifyListeners();
  }
}
