import 'package:admin_page/shared/controllers/user_data/converter.dart';
import 'package:admin_page/shared/models/user_data/user_data.dart';
import 'package:mobx/mobx.dart';

part '../../../gen/shared/controllers/user_data/controller.g.dart';

class UserDataController = UserDataControllerBase with _$UserDataController;

abstract class UserDataControllerBase with Store {
  @observable
  UserDataControllerState state = UserDataControllerState.loading;

  UserData? userData;

  bool get isInitialized => _isInitialized;
  bool _isInitialized = false;

  @action
  void init() {
    if (_isInitialized) return;

    getUserData();

    _isInitialized = true;
  }

  @action
  Future<void> getUserData() async {
    state = UserDataControllerState.loading;

    final response = await UserDataConverter.getUserData();

    if (response.status != UserDataResponseStatus.success) {
      _handelErrror(response);
      return;
    }

    _handelSuccess(response);
  }

  Future<void> _handelSuccess(UserDataResponse response) async {
    state = UserDataControllerState.successfullyLoad;
    userData = response.userData;
  }

  Future<void> _handelErrror(UserDataResponse response) async {
    state = UserDataControllerState.loadWithErrors;
    // response.status = UserDataResponseStatus.error;
  }
}

enum UserDataControllerState {
  loading,
  successfullyLoad,
  loadWithErrors,
}
