import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/shared/auth_firebase/auth_controller.dart';
import 'package:infinito/app/shared/cloud_firebase/cloud_firebase_interface.dart';

class CloudFirebase implements ICloudFirebase {
  AuthController _authControoler = Modular.get();

  bool isLoggedIn() {
    return _authControoler.user != null;
  }

  @override
  Future<QuerySnapshot> getCollection(String collection) async {
    if (isLoggedIn()) {
      return await Firestore.instance.collection(collection).getDocuments();
    }

    return null;
  }
}
