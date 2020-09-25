import 'package:get/state_manager.dart';
import 'package:infinito/app/shared/firestore/firestore_database.dart';

import 'package:flutter_modular/flutter_modular.dart';

class HomeController extends GetxController {
  FirestoreDatabase _firestoreDatabase = Modular.get();

  getCursosPalestrasFromFirestore() {
    return _firestoreDatabase.getCollection("cursos");
  }

  getTerapiasFromFirestore() {
    return _firestoreDatabase.getCollection("terapias");
  }

  getProductsFromFirestore() {
    return _firestoreDatabase.getCollection("produtos");
  }
}
