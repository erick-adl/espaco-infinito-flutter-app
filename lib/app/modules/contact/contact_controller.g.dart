// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContactController on _ContactControllerBase, Store {
  final _$nomeAtom = Atom(name: '_ContactControllerBase.nome');

  @override
  String get nome {
    _$nomeAtom.context.enforceReadPolicy(_$nomeAtom);
    _$nomeAtom.reportObserved();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.context.conditionallyRunInAction(() {
      super.nome = value;
      _$nomeAtom.reportChanged();
    }, _$nomeAtom, name: '${_$nomeAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_ContactControllerBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$messageAtom = Atom(name: '_ContactControllerBase.message');

  @override
  String get message {
    _$messageAtom.context.enforceReadPolicy(_$messageAtom);
    _$messageAtom.reportObserved();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.context.conditionallyRunInAction(() {
      super.message = value;
      _$messageAtom.reportChanged();
    }, _$messageAtom, name: '${_$messageAtom.name}_set');
  }

  final _$errorTextAtom = Atom(name: '_ContactControllerBase.errorText');

  @override
  String get errorText {
    _$errorTextAtom.context.enforceReadPolicy(_$errorTextAtom);
    _$errorTextAtom.reportObserved();
    return super.errorText;
  }

  @override
  set errorText(String value) {
    _$errorTextAtom.context.conditionallyRunInAction(() {
      super.errorText = value;
      _$errorTextAtom.reportChanged();
    }, _$errorTextAtom, name: '${_$errorTextAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_ContactControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$checkMessageAsyncAction = AsyncAction('checkMessage');

  @override
  Future checkMessage() {
    return _$checkMessageAsyncAction.run(() => super.checkMessage());
  }

  final _$_ContactControllerBaseActionController =
      ActionController(name: '_ContactControllerBase');

  @override
  dynamic changeName(String value) {
    final _$actionInfo = _$_ContactControllerBaseActionController.startAction();
    try {
      return super.changeName(value);
    } finally {
      _$_ContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_ContactControllerBaseActionController.startAction();
    try {
      return super.changeEmail(value);
    } finally {
      _$_ContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeMessage(String value) {
    final _$actionInfo = _$_ContactControllerBaseActionController.startAction();
    try {
      return super.changeMessage(value);
    } finally {
      _$_ContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeErrorText(String value) {
    final _$actionInfo = _$_ContactControllerBaseActionController.startAction();
    try {
      return super.changeErrorText(value);
    } finally {
      _$_ContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'nome: ${nome.toString()},email: ${email.toString()},message: ${message.toString()},errorText: ${errorText.toString()},loading: ${loading.toString()}';
    return '{$string}';
  }
}
