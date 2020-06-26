// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menudashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MenudashboardController on _MenudashboardControllerBase, Store {
  final _$pageAtom = Atom(name: '_MenudashboardControllerBase.page');

  @override
  Widget get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(Widget value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$indexAtom = Atom(name: '_MenudashboardControllerBase.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$pageNameAtom = Atom(name: '_MenudashboardControllerBase.pageName');

  @override
  String get pageName {
    _$pageNameAtom.reportRead();
    return super.pageName;
  }

  @override
  set pageName(String value) {
    _$pageNameAtom.reportWrite(value, super.pageName, () {
      super.pageName = value;
    });
  }

  final _$_MenudashboardControllerBaseActionController =
      ActionController(name: '_MenudashboardControllerBase');

  @override
  dynamic setAboutPage() {
    final _$actionInfo = _$_MenudashboardControllerBaseActionController
        .startAction(name: '_MenudashboardControllerBase.setAboutPage');
    try {
      return super.setAboutPage();
    } finally {
      _$_MenudashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTerapiasPage() {
    final _$actionInfo = _$_MenudashboardControllerBaseActionController
        .startAction(name: '_MenudashboardControllerBase.setTerapiasPage');
    try {
      return super.setTerapiasPage();
    } finally {
      _$_MenudashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setProductsPage() {
    final _$actionInfo = _$_MenudashboardControllerBaseActionController
        .startAction(name: '_MenudashboardControllerBase.setProductsPage');
    try {
      return super.setProductsPage();
    } finally {
      _$_MenudashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setContactPage() {
    final _$actionInfo = _$_MenudashboardControllerBaseActionController
        .startAction(name: '_MenudashboardControllerBase.setContactPage');
    try {
      return super.setContactPage();
    } finally {
      _$_MenudashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setWishListtPage() {
    final _$actionInfo = _$_MenudashboardControllerBaseActionController
        .startAction(name: '_MenudashboardControllerBase.setWishListtPage');
    try {
      return super.setWishListtPage();
    } finally {
      _$_MenudashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page},
index: ${index},
pageName: ${pageName}
    ''';
  }
}
