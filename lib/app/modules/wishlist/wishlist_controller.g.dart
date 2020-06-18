// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WishlistController on _WishlistControllerBase, Store {
  final _$searchKeyAtom = Atom(name: '_WishlistControllerBase.searchKey');

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

  final _$searchBarShowAtom =
      Atom(name: '_WishlistControllerBase.searchBarShow');

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

  final _$_WishlistControllerBaseActionController =
      ActionController(name: '_WishlistControllerBase');

  @override
  dynamic setSearchkey(dynamic value) {
    final _$actionInfo = _$_WishlistControllerBaseActionController.startAction(
        name: '_WishlistControllerBase.setSearchkey');
    try {
      return super.setSearchkey(value);
    } finally {
      _$_WishlistControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSearchBarShow(dynamic value) {
    final _$actionInfo = _$_WishlistControllerBaseActionController.startAction(
        name: '_WishlistControllerBase.setSearchBarShow');
    try {
      return super.setSearchBarShow(value);
    } finally {
      _$_WishlistControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchKey: ${searchKey},
searchBarShow: ${searchBarShow}
    ''';
  }
}
