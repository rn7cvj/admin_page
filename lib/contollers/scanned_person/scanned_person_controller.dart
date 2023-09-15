import 'package:admin_page/contollers/scanned_person/scanned_person_converter.dart';
import 'package:admin_page/contollers/scanned_person/scanned_person_service.dart';
import 'package:admin_page/logger.dart';
import 'package:admin_page/models/user_long_viewmodel.dart';
import 'package:mobx/mobx.dart';

part '../../gen/contollers/scanned_person/scanned_person_controller.g.dart';

class ScannedPersonContoller = ScannedPersonStore with _$ScannedPersonContoller;

abstract class ScannedPersonStore with Store {
  ScannedPersonStore({required this.scannedPersonConverter});

  final ScannedPersonConverter scannedPersonConverter;

  @observable
  bool isLoading = true;

  @observable
  UserDataLongViewModel? userData;

  @action
  Future<void> getUserData(String userId) async {
    isLoading = true;

    ScannedPersonResponse response = await scannedPersonConverter.getUserData(userId);

    logger.i(response.status);

    if (response.status != ScannedPersonResponseStatus.success) {
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
      photo: backendModel.photo);
}
