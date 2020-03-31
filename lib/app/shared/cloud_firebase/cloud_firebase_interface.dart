import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ICloudFirebase {
  Future<QuerySnapshot> getCollection(String collection);
}
