// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginBase, Store {
  final _$loadingAtom = Atom(name: '_LoginBase.loading');

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

  final _$emailAtom = Atom(name: '_LoginBase.email');

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

  final _$passwordAtom = Atom(name: '_LoginBase.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$errorTextAtom = Atom(name: '_LoginBase.errorText');

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

  final _$formCheckAsyncAction = AsyncAction('formCheck');

  @override
  Future<void> formCheck() {
    return _$formCheckAsyncAction.run(() => super.formCheck());
  }

  final _$loginWithGoogleAsyncAction = AsyncAction('loginWithGoogle');

  @override
  Future<dynamic> loginWithGoogle() {
    return _$loginWithGoogleAsyncAction.run(() => super.loginWithGoogle());
  }

  final _$_LoginBaseActionController = ActionController(name: '_LoginBase');

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.changeEmail(value);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String value) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.changePassword(value);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeErrorText(String value) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.changeErrorText(value);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'loading: ${loading.toString()},email: ${email.toString()},password: ${password.toString()},errorText: ${errorText.toString()}';
    return '{$string}';
  }
}
