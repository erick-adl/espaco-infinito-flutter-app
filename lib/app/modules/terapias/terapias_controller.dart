import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/state_manager.dart';

import 'package:infinito/app/shared/firestore/firestore_database.dart';

class TerapiasController extends GetxController {
  FirestoreDatabase _firestoreDatabase = Modular.get();

  final searchKey = "".obs;

  final searchBarShow = true.obs;
  setSearchBarShow(value) => searchBarShow.value = value;

  setSearchkey(value) => searchKey.value = value;
  getTerapiasFromFirestore(String filter) {
    return _firestoreDatabase.getCollection("terapias", filter: filter);
  }
}
