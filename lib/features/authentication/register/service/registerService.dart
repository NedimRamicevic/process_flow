import 'package:firebase_auth/firebase_auth.dart';
import 'databaseService.dart';

class RegisterAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  //register with email & password
  Future createUserWithEmailAndPassword(
      String email, String password, String name, String lastName) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      await DataBaseService(uid: user.uid).updateWorker(
          id: user.uid, name: name, lastName: lastName, eMail: email);
      return user;
    } catch (e) {
      return null;
    }
  }
}
