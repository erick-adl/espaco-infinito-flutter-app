import 'package:infinito/app/shared/firestore/firestore_database.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  FirestoreDatabase _firestoreDatabase = Modular.get();

  @action
  getTerapiasFromFirestore() {
    return _firestoreDatabase.getCollection("terapias");
  }

  @action
  getProductsFromFirestore() {
    return _firestoreDatabase.getCollection("produtos");
  }
}
