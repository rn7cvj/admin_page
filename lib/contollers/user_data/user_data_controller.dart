import 'package:admin_page/contollers/user_data/user_data_converter.dart';
import 'package:admin_page/contollers/user_data/user_data_service.dart';
import 'package:admin_page/logger.dart';
import 'package:admin_page/models/user_long_viewmodel.dart';
import 'package:mobx/mobx.dart';

part '../../gen/contollers/user_data/user_data_controller.g.dart';

class UserDataContoller = UserDataStore with _$UserDataContoller;

abstract class UserDataStore with Store {
  UserDataStore({required this.scannedPersonConverter});

  final UserDataConverter scannedPersonConverter;

  @observable
  bool isLoading = true;

  @observable
  UserDataLongViewModel? userData;

  @action
  Future<void> getUserData(String userId) async {
    isLoading = true;

    UserDataResponse response = await scannedPersonConverter.getUserData(userId);

    logger.i(response.status);

    if (response.status != UserDataResponseStatus.success) {
      userData = null;
      isLoading = false;
      return;
    }

    userData = convertResponse(response.data!);

    isLoading = false;
  }
}

UserDataLongViewModel convertResponse(UserDataLongBackendModel backendModel) {
  return UserDataLongViewModel(
    firstName: backendModel.firstName,
    secondName: backendModel.secondName,
    thirdName: backendModel.thirdName,
    email: backendModel.email,
    birthdate: backendModel.birthdate,
    gender: backendModel.gender,
    status: backendModel.status,
    phoneNumber: backendModel.phoneNumber,
    photo: backendModel.photo,
  );
}
