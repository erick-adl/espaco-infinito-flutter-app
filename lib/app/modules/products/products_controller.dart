import 'package:mobx/mobx.dart';

part 'products_controller.g.dart';

class ProductsController = _ProductsControllerBase with _$ProductsController;

abstract class _ProductsControllerBase with Store {
  @observable
  String searchKey = "";

  @action
  setSearchkey(value) => searchKey = value;
}
