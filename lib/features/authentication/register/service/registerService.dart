import 'package:firebase_auth/firebase_auth.dart';

import 'databaseService.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  //register with email & password
  Future createUserWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      await DataBaseService(uid: user.uid).updateUser();
      return user;
    } catch (e) {
      return null;
    }
  }
}
