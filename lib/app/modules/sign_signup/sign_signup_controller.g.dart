// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_signup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignSignupController on _SignSignupControllerBase, Store {
  final _$loadingAtom = Atom(name: '_SignSignupControllerBase.loading');

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

  final _$errorMessageAtom =
      Atom(name: '_SignSignupControllerBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$signupNameAtom = Atom(name: '_SignSignupControllerBase.signupName');

  @override
  String get signupName {
    _$signupNameAtom.context.enforceReadPolicy(_$signupNameAtom);
    _$signupNameAtom.reportObserved();
    return super.signupName;
  }

  @override
  set signupName(String value) {
    _$signupNameAtom.context.conditionallyRunInAction(() {
      super.signupName = value;
      _$signupNameAtom.reportChanged();
    }, _$signupNameAtom, name: '${_$signupNameAtom.name}_set');
  }

  final _$signupEmailAtom = Atom(name: '_SignSignupControllerBase.signupEmail');

  @override
  String get signupEmail {
    _$signupEmailAtom.context.enforceReadPolicy(_$signupEmailAtom);
    _$signupEmailAtom.reportObserved();
    return super.signupEmail;
  }

  @override
  set signupEmail(String value) {
    _$signupEmailAtom.context.conditionallyRunInAction(() {
      super.signupEmail = value;
      _$signupEmailAtom.reportChanged();
    }, _$signupEmailAtom, name: '${_$signupEmailAtom.name}_set');
  }

  final _$signupPasswordAtom =
      Atom(name: '_SignSignupControllerBase.signupPassword');

  @override
  String get signupPassword {
    _$signupPasswordAtom.context.enforceReadPolicy(_$signupPasswordAtom);
    _$signupPasswordAtom.reportObserved();
    return super.signupPassword;
  }

  @override
  set signupPassword(String value) {
    _$signupPasswordAtom.context.conditionallyRunInAction(() {
      super.signupPassword = value;
      _$signupPasswordAtom.reportChanged();
    }, _$signupPasswordAtom, name: '${_$signupPasswordAtom.name}_set');
  }

  final _$signupPasswordCheckAtom =
      Atom(name: '_SignSignupControllerBase.signupPasswordCheck');

  @override
  String get signupPasswordCheck {
    _$signupPasswordCheckAtom.context
        .enforceReadPolicy(_$signupPasswordCheckAtom);
    _$signupPasswordCheckAtom.reportObserved();
    return super.signupPasswordCheck;
  }

  @override
  set signupPasswordCheck(String value) {
    _$signupPasswordCheckAtom.context.conditionallyRunInAction(() {
      super.signupPasswordCheck = value;
      _$signupPasswordCheckAtom.reportChanged();
    }, _$signupPasswordCheckAtom,
        name: '${_$signupPasswordCheckAtom.name}_set');
  }

  final _$loginEmailAtom = Atom(name: '_SignSignupControllerBase.loginEmail');

  @override
  String get loginEmail {
    _$loginEmailAtom.context.enforceReadPolicy(_$loginEmailAtom);
    _$loginEmailAtom.reportObserved();
    return super.loginEmail;
  }

  @override
  set loginEmail(String value) {
    _$loginEmailAtom.context.conditionallyRunInAction(() {
      super.loginEmail = value;
      _$loginEmailAtom.reportChanged();
    }, _$loginEmailAtom, name: '${_$loginEmailAtom.name}_set');
  }

  final _$loginPasswordAtom =
      Atom(name: '_SignSignupControllerBase.loginPassword');

  @override
  String get loginPassword {
    _$loginPasswordAtom.context.enforceReadPolicy(_$loginPasswordAtom);
    _$loginPasswordAtom.reportObserved();
    return super.loginPassword;
  }

  @override
  set loginPassword(String value) {
    _$loginPasswordAtom.context.conditionallyRunInAction(() {
      super.loginPassword = value;
      _$loginPasswordAtom.reportChanged();
    }, _$loginPasswordAtom, name: '${_$loginPasswordAtom.name}_set');
  }

  final _$registerAsyncAction = AsyncAction('register');

  @override
  Future<dynamic> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  final _$loginWithEmailAndPasswordAsyncAction =
      AsyncAction('loginWithEmailAndPassword');

  @override
  Future<dynamic> loginWithEmailAndPassword() {
    return _$loginWithEmailAndPasswordAsyncAction
        .run(() => super.loginWithEmailAndPassword());
  }

  final _$loginWithGoogleAsyncAction = AsyncAction('loginWithGoogle');

  @override
  Future<dynamic> loginWithGoogle() {
    return _$loginWithGoogleAsyncAction.run(() => super.loginWithGoogle());
  }

  final _$_SignSignupControllerBaseActionController =
      ActionController(name: '_SignSignupControllerBase');

  @override
  dynamic changeErrorMessage(String value) {
    final _$actionInfo =
        _$_SignSignupControllerBaseActionController.startAction();
    try {
      return super.changeErrorMessage(value);
    } finally {
      _$_SignSignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic signupChangeName(String value) {
    final _$actionInfo =
        _$_SignSignupControllerBaseActionController.startAction();
    try {
      return super.signupChangeName(value);
    } finally {
      _$_SignSignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic signupChangeEmail(String value) {
    final _$actionInfo =
        _$_SignSignupControllerBaseActionController.startAction();
    try {
      return super.signupChangeEmail(value);
    } finally {
      _$_SignSignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic signupChangePassword(String value) {
    final _$actionInfo =
        _$_SignSignupControllerBaseActionController.startAction();
    try {
      return super.signupChangePassword(value);
    } finally {
      _$_SignSignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic signupChangePasswordCheck(String value) {
    final _$actionInfo =
        _$_SignSignupControllerBaseActionController.startAction();
    try {
      return super.signupChangePasswordCheck(value);
    } finally {
      _$_SignSignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic loginChangeEmail(String value) {
    final _$actionInfo =
        _$_SignSignupControllerBaseActionController.startAction();
    try {
      return super.loginChangeEmail(value);
    } finally {
      _$_SignSignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic loginChangePassword(String value) {
    final _$actionInfo =
        _$_SignSignupControllerBaseActionController.startAction();
    try {
      return super.loginChangePassword(value);
    } finally {
      _$_SignSignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'loading: ${loading.toString()},errorMessage: ${errorMessage.toString()},signupName: ${signupName.toString()},signupEmail: ${signupEmail.toString()},signupPassword: ${signupPassword.toString()},signupPasswordCheck: ${signupPasswordCheck.toString()},loginEmail: ${loginEmail.toString()},loginPassword: ${loginPassword.toString()}';
    return '{$string}';
  }
}
