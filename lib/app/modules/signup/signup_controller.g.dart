// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupController on _SignupControllerBase, Store {
  final _$nameAtom = Atom(name: '_SignupControllerBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_SignupControllerBase.email');

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

  final _$passwordAtom = Atom(name: '_SignupControllerBase.password');

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

  final _$passwordCheckAtom = Atom(name: '_SignupControllerBase.passwordCheck');

  @override
  String get passwordCheck {
    _$passwordCheckAtom.context.enforceReadPolicy(_$passwordCheckAtom);
    _$passwordCheckAtom.reportObserved();
    return super.passwordCheck;
  }

  @override
  set passwordCheck(String value) {
    _$passwordCheckAtom.context.conditionallyRunInAction(() {
      super.passwordCheck = value;
      _$passwordCheckAtom.reportChanged();
    }, _$passwordCheckAtom, name: '${_$passwordCheckAtom.name}_set');
  }

  final _$errorTextAtom = Atom(name: '_SignupControllerBase.errorText');

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

  final _$successTextAtom = Atom(name: '_SignupControllerBase.successText');

  @override
  String get successText {
    _$successTextAtom.context.enforceReadPolicy(_$successTextAtom);
    _$successTextAtom.reportObserved();
    return super.successText;
  }

  @override
  set successText(String value) {
    _$successTextAtom.context.conditionallyRunInAction(() {
      super.successText = value;
      _$successTextAtom.reportChanged();
    }, _$successTextAtom, name: '${_$successTextAtom.name}_set');
  }

  final _$isValidFormAsyncAction = AsyncAction('isValidForm');

  @override
  Future<void> isValidForm() {
    return _$isValidFormAsyncAction.run(() => super.isValidForm());
  }

  final _$_SignupControllerBaseActionController =
      ActionController(name: '_SignupControllerBase');

  @override
  dynamic changeName(String value) {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction();
    try {
      return super.changeName(value);
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction();
    try {
      return super.changeEmail(value);
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String value) {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction();
    try {
      return super.changePassword(value);
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePasswordCheck(String value) {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction();
    try {
      return super.changePasswordCheck(value);
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeErrorText(String value) {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction();
    try {
      return super.changeErrorText(value);
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'name: ${name.toString()},email: ${email.toString()},password: ${password.toString()},passwordCheck: ${passwordCheck.toString()},errorText: ${errorText.toString()},successText: ${successText.toString()}';
    return '{$string}';
  }
}
