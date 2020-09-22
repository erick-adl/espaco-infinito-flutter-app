// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WishlistController on _WishlistControllerBase, Store {
  final _$documentAlreadyAddedAtom =
      Atom(name: '_WishlistControllerBase.documentAlreadyAdded');

  @override
  bool get documentAlreadyAdded {
    _$documentAlreadyAddedAtom.reportRead();
    return super.documentAlreadyAdded;
  }

  @override
  set documentAlreadyAdded(bool value) {
    _$documentAlreadyAddedAtom.reportWrite(value, super.documentAlreadyAdded,
        () {
      super.documentAlreadyAdded = value;
    });
  }

  final _$shareButtonShowAtom =
      Atom(name: '_WishlistControllerBase.shareButtonShow');

  @override
  bool get shareButtonShow {
    _$shareButtonShowAtom.reportRead();
    return super.shareButtonShow;
  }

  @override
  set shareButtonShow(bool value) {
    _$shareButtonShowAtom.reportWrite(value, super.shareButtonShow, () {
      super.shareButtonShow = value;
    });
  }

  final _$_WishlistControllerBaseActionController =
      ActionController(name: '_WishlistControllerBase');

  @override
  dynamic setShareButtonShow(dynamic value) {
    final _$actionInfo = _$_WishlistControllerBaseActionController.startAction(
        name: '_WishlistControllerBase.setShareButtonShow');
    try {
      return super.setShareButtonShow(value);
    } finally {
      _$_WishlistControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getDocumentFromFirestore(DocumentSnapshot document) {
    final _$actionInfo = _$_WishlistControllerBaseActionController.startAction(
        name: '_WishlistControllerBase.getDocumentFromFirestore');
    try {
      return super.getDocumentFromFirestore(document);
    } finally {
      _$_WishlistControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getWishlistFromFirestore() {
    final _$actionInfo = _$_WishlistControllerBaseActionController.startAction(
        name: '_WishlistControllerBase.getWishlistFromFirestore');
    try {
      return super.getWishlistFromFirestore();
    } finally {
      _$_WishlistControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addProductToWishList(DocumentSnapshot document) {
    final _$actionInfo = _$_WishlistControllerBaseActionController.startAction(
        name: '_WishlistControllerBase.addProductToWishList');
    try {
      return super.addProductToWishList(document);
    } finally {
      _$_WishlistControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeProductToWishList(DocumentSnapshot document) {
    final _$actionInfo = _$_WishlistControllerBaseActionController.startAction(
        name: '_WishlistControllerBase.removeProductToWishList');
    try {
      return super.removeProductToWishList(document);
    } finally {
      _$_WishlistControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
documentAlreadyAdded: ${documentAlreadyAdded},
shareButtonShow: ${shareButtonShow}
    ''';
  }
}
