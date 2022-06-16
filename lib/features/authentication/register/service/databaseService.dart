import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  // reference to collection
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("brew");

  final String uid;

  DataBaseService({required this.uid});

  Future updateUser(
      {String name = "new member",
      String sugar = "0",
      int strength = 100}) async {
    return await brewCollection.doc(uid).set(
        {'name': name, 'sugar': sugar, 'strength': strength},
        SetOptions(merge: true));
  }
}
