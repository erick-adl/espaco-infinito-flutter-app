import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/shared/firestore/firestore_database.dart';
import 'package:mobx/mobx.dart';

part 'wishlist_controller.g.dart';

class WishlistController = _WishlistControllerBase with _$WishlistController;

abstract class _WishlistControllerBase with Store {
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
  getWishlistFromFirestore(String filter) {
    return _firestoreDatabase.getWishList(filter: filter);
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
