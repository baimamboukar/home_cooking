import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_cooking/models/models.dart';
import 'package:home_cooking/providers/providers.dart';

class Database {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final Reader _read;
  Database(this._read);
  //=====*****USER AUTHENTICATION*****=====//
  Future<bool> createUser(
      {required String id, required Cuisinier cuisinier}) async {
    try {
      _firestore.collection('students').doc(id).set({}).then((_) async {
        getUser(id);
      });

      return true;
    } on FirebaseException catch (err) {
      return false;
    }
  }

  bool getUser(String uid) {
    try {
      _firestore
          .collection('students')
          .doc(uid)
          .get(const GetOptions(source: Source.serverAndCache))
          .then((doc) {
        Cuisinier cuisinier = Cuisinier.fromDocumentSnapshot(doc.data() ?? {});
        _read(cuisinierControllerProvider.notifier).data = cuisinier;
      });
      return true;
    } on FirebaseException catch (err) {
      return false;
    }
  }
}
