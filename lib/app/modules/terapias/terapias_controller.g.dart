// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terapias_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TerapiasController on _TerapiasControllerBase, Store {
  final _$searchKeyAtom = Atom(name: '_TerapiasControllerBase.searchKey');

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
      Atom(name: '_TerapiasControllerBase.searchBarShow');

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

  final _$_TerapiasControllerBaseActionController =
      ActionController(name: '_TerapiasControllerBase');

  @override
  dynamic setSearchkey(dynamic value) {
    final _$actionInfo = _$_TerapiasControllerBaseActionController.startAction(
        name: '_TerapiasControllerBase.setSearchkey');
    try {
      return super.setSearchkey(value);
    } finally {
      _$_TerapiasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSearchBarShow(dynamic value) {
    final _$actionInfo = _$_TerapiasControllerBaseActionController.startAction(
        name: '_TerapiasControllerBase.setSearchBarShow');
    try {
      return super.setSearchBarShow(value);
    } finally {
      _$_TerapiasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getTerapiasFromFirestore(String filter) {
    final _$actionInfo = _$_TerapiasControllerBaseActionController.startAction(
        name: '_TerapiasControllerBase.getTerapiasFromFirestore');
    try {
      return super.getTerapiasFromFirestore(filter);
    } finally {
      _$_TerapiasControllerBaseActionController.endAction(_$actionInfo);
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
