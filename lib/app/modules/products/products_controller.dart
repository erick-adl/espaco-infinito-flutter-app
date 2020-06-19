import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:infinito/app/shared/firestore/firestore_database.dart';
import 'package:mobx/mobx.dart';

part 'products_controller.g.dart';

class ProductsController = _ProductsControllerBase with _$ProductsController;

abstract class _ProductsControllerBase with Store {
  final FirestoreDatabase _firestoreDatabase = Modular.get();

  @observable
  String searchKey = "";

  @observable
  bool documentAlreadyAdded = false;

  @action
  setSearchkey(value) => searchKey = value;

  @observable
  bool searchBarShow = true;
  @action
  setSearchBarShow(value) => searchBarShow = value;

  @action
  getDocumentFromFirestore(DocumentSnapshot document) {
    _firestoreDatabase
        .getDocumentFromWishlist(document.documentID)
        .then((value) => {documentAlreadyAdded = value.exists});
  }

  @action
  getProductsFromFirestore(String filter) {
    return _firestoreDatabase.getCollection("produtos", filter: filter);
  }

  @action
  addProductToWishList(DocumentSnapshot document) {
    _firestoreDatabase.addProductToWishList(document.documentID, document.data);

    getDocumentFromFirestore(document);
  }

  @action
  removeProductToWishList(DocumentSnapshot document) {
    _firestoreDatabase.removeProductFromWishList(
      document.documentID,
    );

    getDocumentFromFirestore(document);
  }
}
