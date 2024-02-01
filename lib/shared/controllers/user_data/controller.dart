import 'package:admin_page/shared/controllers/user_data/converter.dart';
import 'package:admin_page/shared/models/user_data/user_data.dart';
import 'package:mobx/mobx.dart';

part '../../../gen/shared/controllers/user_data/controller.g.dart';

class UserDataController = UserDataControllerBase with _$UserDataController;

abstract class UserDataControllerBase with Store {
  @observable
  bool isLoading = true;

  @observable
  bool isSuccessfullyLoad = false;

  UserData? userData;

  @action
  Future<void> getUserData() async {
    isLoading = true;
    isSuccessfullyLoad = false;

    final response = await UserDataConverter.getUserData();

    if (response.status != UserDataResponseStatus.success) {
      _handelErrror(response);
      isLoading = false;
      return;
    }

    _handelSuccess(response);

    isSuccessfullyLoad = true;
    isLoading = false;
  }

  Future<void> _handelSuccess(UserDataResponse response) async {}

  Future<void> _handelErrror(UserDataResponse response) async {}
}
