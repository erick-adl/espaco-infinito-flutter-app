import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinito/app/modules/products/products_controller.dart';
import 'package:infinito/app/shared/firestore/firestore_database.dart';
import 'package:mobx/mobx.dart';

part 'terapias_controller.g.dart';

class TerapiasController = _TerapiasControllerBase with _$TerapiasController;

abstract class _TerapiasControllerBase with Store {
  FirestoreDatabase _firestoreDatabase = Modular.get();

  @observable
  String searchKey = "";

  @action
  setSearchkey(value) => searchKey = value;

  @observable
  bool searchBarShow = true;
  @action
  setSearchBarShow(value) => searchBarShow = value;
  @action
  getTerapiasFromFirestore(String filter) {
    return _firestoreDatabase.getCollection("terapias", filter: filter);
  }
}
