import 'package:mobx/mobx.dart';

part 'wishlist_controller.g.dart';

class WishlistController = _WishlistControllerBase with _$WishlistController;

abstract class _WishlistControllerBase with Store {
  @observable
  String searchKey = "";

  @action
  setSearchkey(value) => searchKey = value;

  @observable
  bool searchBarShow = true;
  @action
  setSearchBarShow(value) => searchBarShow = value;
}
