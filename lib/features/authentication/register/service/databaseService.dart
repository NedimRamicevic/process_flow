import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  // reference to collection
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("workers");

  final String uid;

  DataBaseService({required this.uid});

  Future updateWorker({
    required String id,
    required String name,
    required String lastName,
    required String eMail,
  }) async {
    return await brewCollection.doc(uid).set(
        {'id': id, 'name': name, 'last Name': lastName, 'eMail': eMail},
        SetOptions(merge: true));
  }
}
