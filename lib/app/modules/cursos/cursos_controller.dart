import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/state_manager.dart';
import 'package:infinito/app/shared/firestore/firestore_database.dart';

class CursosController extends GetxController {
  FirestoreDatabase _firestoreDatabase = Modular.get();

  getCursosPalestrasFromFirestore() {
    return _firestoreDatabase.getCollection("cursos");
  }
}
