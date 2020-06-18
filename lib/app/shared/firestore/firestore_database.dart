import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/shared/auth_firebase/auth_controller.dart';
import 'package:intl/intl.dart';

import 'firestore_database_interface.dart';

class FirestoreDatabase implements IFirestoreDatabase {
  AuthController _authControoler = Modular.get();

  bool isLoggedIn() {
    return _authControoler.user != null;
  }

  @override
  Stream<QuerySnapshot> getCollection(String collection,
      {String filter = "", String orderBy = "nome"}) {
    if (isLoggedIn()) {
      return Firestore.instance
          .collection('produtos')
          .where('nome',
              isGreaterThanOrEqualTo: toBeginningOfSentenceCase(filter))
          .where('nome', isLessThan: toBeginningOfSentenceCase(filter) + "z")
          .orderBy(orderBy)
          .snapshots();
    }
    return null;
  }

  setDocument(String document, Map<String, dynamic> data) {
    if (isLoggedIn()) {
      Firestore.instance
          .collection("wishlist")
          .document(document)
          .setData(data, merge: true)
          .then((_) {
        print("success!");
      });
    }
  }

  addProductToWishList(String document, Map<String, dynamic> data) {
    if (isLoggedIn()) {
      Firestore.instance
          .collection("users_wishlist")
          .document(document)
          .collection("wishlist")
          .document()
          .setData(data, merge: true)
          .then((_) {
        print("success!");
      });
    }
  }
}
