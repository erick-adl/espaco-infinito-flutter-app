// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_signup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignSignupController on _SignSignupControllerBase, Store {
  final _$loadingAtom = Atom(name: '_SignSignupControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorMessageAtom =
      Atom(name: '_SignSignupControllerBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$signupNameAtom = Atom(name: '_SignSignupControllerBase.signupName');

  @override
  String get signupName {
    _$signupNameAtom.reportRead();
    return super.signupName;
  }

  @override
  set signupName(String value) {
    _$signupNameAtom.reportWrite(value, super.signupName, () {
      super.signupName = value;
    });
  }

  final _$signupEmailAtom = Atom(name: '_SignSignupControllerBase.signupEmail');

  @override
  String get signupEmail {
    _$signupEmailAtom.reportRead();
    return super.signupEmail;
  }

  @override
  set signupEmail(String value) {
    _$signupEmailAtom.reportWrite(value, super.signupEmail, () {
      super.signupEmail = value;
    });
  }

  final _$signupPasswordAtom =
      Atom(name: '_SignSignupControllerBase.signupPassword');

  @override
  String get signupPassword {
    _$signupPasswordAtom.reportRead();
    return super.signupPassword;
  }

  @override
  set signupPassword(String value) {
    _$signupPasswordAtom.reportWrite(value, super.signupPassword, () {
      super.signupPassword = value;
    });
  }

  final _$signupPasswordCheckAtom =
      Atom(name: '_SignSignupControllerBase.signupPasswordCheck');

  @override
  String get signupPasswordCheck {
    _$signupPasswordCheckAtom.reportRead();
    return super.signupPasswordCheck;
  }

  @override
  set signupPasswordCheck(String value) {
    _$signupPasswordCheckAtom.reportWrite(value, super.signupPasswordCheck, () {
      super.signupPasswordCheck = value;
    });
  }

  final _$loginEmailAtom = Atom(name: '_SignSignupControllerBase.loginEmail');

  @override
  String get loginEmail {
    _$loginEmailAtom.reportRead();
    return super.loginEmail;
  }

  @override
  set loginEmail(String value) {
    _$loginEmailAtom.reportWrite(value, super.loginEmail, () {
      super.loginEmail = value;
    });
  }

  final _$loginPasswordAtom =
      Atom(name: '_SignSignupControllerBase.loginPassword');

  @override
  String get loginPassword {
    _$loginPasswordAtom.reportRead();
    return super.loginPassword;
  }

  @override
  set loginPassword(String value) {
    _$loginPasswordAtom.reportWrite(value, super.loginPassword, () {
      super.loginPassword = value;
    });
  }

  final _$registerAsyncAction =
      AsyncAction('_SignSignupControllerBase.register');

  @override
  Future<dynamic> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  final _$loginWithEmailAndPasswordAsyncAction =
      AsyncAction('_SignSignupControllerBase.loginWithEmailAndPassword');

  @override
  Future<dynamic> loginWithEmailAndPassword() {
    return _$loginWithEmailAndPasswordAsyncAction
        .run(() => super.loginWithEmailAndPassword());
  }

  final _$loginWithGoogleAsyncAction =
      AsyncAction('_SignSignupControllerBase.loginWithGoogle');

  @override
  Future<dynamic> loginWithGoogle() {
    return _$loginWithGoogleAsyncAction.run(() => super.loginWithGoogle());
  }

  final _$_SignSignupControllerBaseActionController =
      ActionController(name: '_SignSignupControllerBase');

  @override
  dynamic changeErrorMessage(String value) {
    final _$actionInfo = _$_SignSignupControllerBaseActionController
        .startAction(name: '_SignSignupControllerBase.changeErrorMessage');
    try {
      return super.changeErrorMessage(value);
    } finally {
      _$_SignSignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic signupChangeName(String value) {
    final _$actionInfo = _$_SignSignupControllerBaseActionController
        .startAction(name: '_SignSignupControllerBase.signupChangeName');
    try {
      return super.signupChangeName(value);
    } finally {
      _$_SignSignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic signupChangeEmail(String value) {
    final _$actionInfo = _$_SignSignupControllerBaseActionController
        .startAction(name: '_SignSignupControllerBase.signupChangeEmail');
    try {
      return super.signupChangeEmail(value);
    } finally {
      _$_SignSignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic signupChangePassword(String value) {
    final _$actionInfo = _$_SignSignupControllerBaseActionController
        .startAction(name: '_SignSignupControllerBase.signupChangePassword');
    try {
      return super.signupChangePassword(value);
    } finally {
      _$_SignSignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic signupChangePasswordCheck(String value) {
    final _$actionInfo =
        _$_SignSignupControllerBaseActionController.startAction(
            name: '_SignSignupControllerBase.signupChangePasswordCheck');
    try {
      return super.signupChangePasswordCheck(value);
    } finally {
      _$_SignSignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic loginChangeEmail(String value) {
    final _$actionInfo = _$_SignSignupControllerBaseActionController
        .startAction(name: '_SignSignupControllerBase.loginChangeEmail');
    try {
      return super.loginChangeEmail(value);
    } finally {
      _$_SignSignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic loginChangePassword(String value) {
    final _$actionInfo = _$_SignSignupControllerBaseActionController
        .startAction(name: '_SignSignupControllerBase.loginChangePassword');
    try {
      return super.loginChangePassword(value);
    } finally {
      _$_SignSignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
errorMessage: ${errorMessage},
signupName: ${signupName},
signupEmail: ${signupEmail},
signupPassword: ${signupPassword},
signupPasswordCheck: ${signupPasswordCheck},
loginEmail: ${loginEmail},
loginPassword: ${loginPassword}
    ''';
  }
}
