import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_firebase_interface.dart';

class AuthFirebase implements IAuthFirebase {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<FirebaseUser> getEmailPasswordLogin(
      {String email, String password}) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user == null) return null;
      final FirebaseUser user = result.user;
      return user;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future getFacebookLogin() {
    // TODO: implement getFacebookLogin
    throw UnimplementedError();
  }

  @override
  Future<String> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future<FirebaseUser> getGoogleLogin() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;
      return user;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<FirebaseUser> getUser() {
    return _auth.currentUser();
  }

  @override
  Future getLogout() {
    return _auth.signOut();
  }

  @override
  Future<FirebaseUser> createUserWithEmailPassword(
      {String name, String email, String password}) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user == null) return null;
      final FirebaseUser user = result.user;
      await _auth.currentUser().then((val) {
        UserUpdateInfo updateUser = UserUpdateInfo();
        updateUser.displayName = name;
        // updateUser.photoUrl = picURL;
        val.updateProfile(updateUser);
      });
      _auth.signOut();
      return user;
    } catch (e) {
      throw e;
    }
  }
}
