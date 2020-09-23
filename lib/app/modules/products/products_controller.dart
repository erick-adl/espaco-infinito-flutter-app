import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/state_manager.dart';

import 'package:infinito/app/shared/firestore/firestore_database.dart';

class ProductsController extends GetxController {
  final FirestoreDatabase _firestoreDatabase = Modular.get();

  final documentAlreadyAdded = false.obs;
  final searchKey = "".obs;
  final searchBarShow = true.obs;

  setSearchkey(value) => searchKey.value = value;
  setSearchBarShow(value) => searchBarShow.value = value;

  getDocumentFromFirestore(DocumentSnapshot document) {
    _firestoreDatabase
        .getDocumentFromWishlist(document.documentID)
        .then((value) => {documentAlreadyAdded.value = value.exists});
  }

  getProductsFromFirestore(String filter) {
    return _firestoreDatabase.getCollection("produtos", filter: filter);
  }

  addProductToWishList(DocumentSnapshot document) {
    _firestoreDatabase.addProductToWishList(document.documentID, document.data);

    getDocumentFromFirestore(document);
  }

  removeProductToWishList(DocumentSnapshot document) {
    _firestoreDatabase.removeProductFromWishList(
      document.documentID,
    );

    getDocumentFromFirestore(document);
  }
}
