import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IFirestoreDatabase {
  Stream<QuerySnapshot> getCollection(String collection,
      {String filter = "", String orderBy = "nome"});
}
