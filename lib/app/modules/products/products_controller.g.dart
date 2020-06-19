// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductsController on _ProductsControllerBase, Store {
  final _$searchKeyAtom = Atom(name: '_ProductsControllerBase.searchKey');

  @override
  String get searchKey {
    _$searchKeyAtom.reportRead();
    return super.searchKey;
  }

  @override
  set searchKey(String value) {
    _$searchKeyAtom.reportWrite(value, super.searchKey, () {
      super.searchKey = value;
    });
  }

  final _$documentAlreadyAddedAtom =
      Atom(name: '_ProductsControllerBase.documentAlreadyAdded');

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

  final _$searchBarShowAtom =
      Atom(name: '_ProductsControllerBase.searchBarShow');

  @override
  bool get searchBarShow {
    _$searchBarShowAtom.reportRead();
    return super.searchBarShow;
  }

  @override
  set searchBarShow(bool value) {
    _$searchBarShowAtom.reportWrite(value, super.searchBarShow, () {
      super.searchBarShow = value;
    });
  }

  final _$_ProductsControllerBaseActionController =
      ActionController(name: '_ProductsControllerBase');

  @override
  dynamic setSearchkey(dynamic value) {
    final _$actionInfo = _$_ProductsControllerBaseActionController.startAction(
        name: '_ProductsControllerBase.setSearchkey');
    try {
      return super.setSearchkey(value);
    } finally {
      _$_ProductsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSearchBarShow(dynamic value) {
    final _$actionInfo = _$_ProductsControllerBaseActionController.startAction(
        name: '_ProductsControllerBase.setSearchBarShow');
    try {
      return super.setSearchBarShow(value);
    } finally {
      _$_ProductsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getDocumentFromFirestore(DocumentSnapshot document) {
    final _$actionInfo = _$_ProductsControllerBaseActionController.startAction(
        name: '_ProductsControllerBase.getDocumentFromFirestore');
    try {
      return super.getDocumentFromFirestore(document);
    } finally {
      _$_ProductsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getProductsFromFirestore(String filter) {
    final _$actionInfo = _$_ProductsControllerBaseActionController.startAction(
        name: '_ProductsControllerBase.getProductsFromFirestore');
    try {
      return super.getProductsFromFirestore(filter);
    } finally {
      _$_ProductsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addProductToWishList(DocumentSnapshot document) {
    final _$actionInfo = _$_ProductsControllerBaseActionController.startAction(
        name: '_ProductsControllerBase.addProductToWishList');
    try {
      return super.addProductToWishList(document);
    } finally {
      _$_ProductsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeProductToWishList(DocumentSnapshot document) {
    final _$actionInfo = _$_ProductsControllerBaseActionController.startAction(
        name: '_ProductsControllerBase.removeProductToWishList');
    try {
      return super.removeProductToWishList(document);
    } finally {
      _$_ProductsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchKey: ${searchKey},
documentAlreadyAdded: ${documentAlreadyAdded},
searchBarShow: ${searchBarShow}
    ''';
  }
}
