import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/shared/firestore/firestore_database.dart';
import 'package:mobx/mobx.dart';

part 'wishlist_controller.g.dart';

class WishlistController = _WishlistControllerBase with _$WishlistController;

abstract class _WishlistControllerBase with Store {
  final FirestoreDatabase _firestoreDatabase = Modular.get();

  @observable
  bool documentAlreadyAdded = false;

  @observable
  bool shareButtonShow = true;
  @action
  setShareButtonShow(value) => shareButtonShow = value;

  @action
  getDocumentFromFirestore(DocumentSnapshot document) {
    _firestoreDatabase
        .getDocumentFromWishlist(document.documentID)
        .then((value) => {documentAlreadyAdded = value.exists});
  }

  @action
  getWishlistFromFirestore() {
    return _firestoreDatabase.getWishList();
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
