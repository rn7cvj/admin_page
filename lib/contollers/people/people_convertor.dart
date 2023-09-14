import 'package:admin_page/contollers/people/people_service.dart';

class PeopleConvertor {
  PeopleConvertor({required PeopleService peopleService}) : _peopleService = peopleService;

  final PeopleService _peopleService;

  Future<PeopleResponse> getVisitiors(int page, int quantity) => _getUsers(_peopleService.getVisitors(page, quantity));

  Future<PeopleResponse> getTrainers(int page, int quantity) => _getUsers(_peopleService.getTrainers(page, quantity));

  Future<PeopleResponse> getStaff(int page, int quantity) => _getUsers(_peopleService.getStaff(page, quantity));

  Future<PeopleResponse> _getUsers(Future<PeopleBackendResponse> getFucntion) async {
    PeopleBackendResponse? backendResponse;
    try {
      backendResponse = await getFucntion;
    } catch (ex) {
      return PeopleResponse(
        status: PeopleResponseStatus.networkTrouble,
        peopleList: null,
      );
    }

    if (!backendResponse.isSuccess) {
      return PeopleResponse(
        status: PeopleResponseStatus.networkTrouble,
        peopleList: null,
      );
    }

    return PeopleResponse(
      status: PeopleResponseStatus.success,
      peopleList: backendResponse.personList,
    );
  }
}

class PeopleResponse {
  final PeopleResponseStatus status;

  final List<PersonBackendModel>? peopleList;

  PeopleResponse({required this.status, required this.peopleList});
}

enum PeopleResponseStatus {
  networkTrouble,
  success,
}
