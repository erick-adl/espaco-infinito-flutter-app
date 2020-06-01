import 'package:mobx/mobx.dart';

part 'terapias_controller.g.dart';

class TerapiasController = _TerapiasControllerBase with _$TerapiasController;

abstract class _TerapiasControllerBase with Store {
  @observable
  String searchKey = "";

  @action
  setSearchkey(value) => searchKey = value;
}
