import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  User? currentUser;

  void getWorker(User worker) {
    currentUser = worker;
    notifyListeners();
  }
}
