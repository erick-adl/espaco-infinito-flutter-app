import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/shared/auth_firebase/auth_controller.dart';
import 'package:intl/intl.dart';

import 'firestore_database_interface.dart';

class FirestoreDatabase implements IFirestoreDatabase {
  AuthController _authController = Modular.get();

  bool isLoggedIn() {
    return _authController.user != null;
  }

  @override
  Stream<QuerySnapshot> getCollection(String collection,
      {String filter = "", String orderBy = "nome"}) {
    if (isLoggedIn()) {
      return Firestore.instance
          .collection(collection)
          .where('nome',
              isGreaterThanOrEqualTo: toBeginningOfSentenceCase(filter))
          .where('nome', isLessThan: toBeginningOfSentenceCase(filter) + "z")
          .orderBy(orderBy)
          .snapshots();
    }
    return null;
  }

  Stream<QuerySnapshot> getWishList(
      {String filter = "", String orderBy = "nome"}) {
    if (isLoggedIn()) {
      return Firestore.instance
          .collection('users_wishlist')
          .document(_authController.user.uid)
          .collection("wishlist")
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
        print("setted!");
      });
    }
  }

  Future<DocumentSnapshot> getDocumentFromWishlist(String documentID) {
    if (isLoggedIn()) {
      return Firestore.instance
          .collection("users_wishlist")
          .document(_authController.user.uid)
          .collection("wishlist")
          .document(documentID)
          .get();
    }
    return null;
  }

  addProductToWishList(String documentID, Map<String, dynamic> data) {
    if (isLoggedIn()) {
      Firestore.instance
          .collection("users_wishlist")
          .document(_authController.user.uid)
          .collection("wishlist")
          .document(documentID)
          .setData(data, merge: true)
          .then((_) {
        print("Added!");
      });
    }
  }

  removeProductFromWishList(String documentID) {
    if (isLoggedIn()) {
      Firestore.instance
          .collection("users_wishlist")
          .document(_authController.user.uid)
          .collection("wishlist")
          .document(documentID)
          .delete()
          .then((_) {
        print("removed!");
      });
    }
  }
}
