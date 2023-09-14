import 'package:admin_page/contollers/people/people_convertor.dart';
import 'package:admin_page/contollers/people/people_service.dart';
import 'package:admin_page/models/person_viewmodel.dart';
import 'package:mobx/mobx.dart';

part '../../gen/contollers/people/people_controller.g.dart';

class PeopleContoller = PeopleContollerStore with _$PeopleContoller;

abstract class PeopleContollerStore with Store {
  PeopleContollerStore({required this.peopleConvertor});

  final PeopleConvertor peopleConvertor;

  @observable
  bool isLoading = true;

  int loadedVisitorsPage = 0;
  int loadedTrainersPage = 0;
  int loadedStaffPage = 0;

  int loadedAmount = 30;

  Future<void> init() async {
    await fetchNewVisitors();
    await fetchNewTrainers();
    await fetchNewStaff();
    runInAction(() {
      isLoading = false;
    });
  }

  bool shoudUpdateVisitors() => !isVisitorsLoading;
  bool isVisitorsLoading = true;

  @action
  Future<void> fetchNewVisitors() async {
    isVisitorsLoading = true;
    PeopleResponse newVisitors = await peopleConvertor.getVisitiors(loadedVisitorsPage, loadedAmount);

    if (newVisitors.status != PeopleResponseStatus.success) {
      isVisitorsLoading = false;
      return;
    }

    loadedVisitorsPage += 1;
    visitors.addAll(convertResponse(newVisitors.peopleList!));
    isVisitorsLoading = false;
  }

  bool shoudUpdateTrainers() => !isTrainersLodaing;
  bool isTrainersLodaing = true;

  @action
  Future<void> fetchNewTrainers() async {
    isTrainersLodaing = true;
    PeopleResponse newTrainers = await peopleConvertor.getTrainers(loadedTrainersPage, loadedAmount);

    if (newTrainers.status != PeopleResponseStatus.success) {
      isTrainersLodaing = false;
      return;
    }

    loadedTrainersPage += 1;
    trainers.addAll(convertResponse(newTrainers.peopleList!));
    isTrainersLodaing = false;
  }

  bool shoudUpdateStaff() => !isStaffLoading;
  bool isStaffLoading = true;

  @action
  Future<void> fetchNewStaff() async {
    isStaffLoading = true;
    PeopleResponse newStaff = await peopleConvertor.getStaff(loadedStaffPage, loadedAmount);

    if (newStaff.status != PeopleResponseStatus.success) {
      isStaffLoading = false;
      return;
    }

    loadedStaffPage += 1;
    staff.addAll(convertResponse(newStaff.peopleList!));
    isStaffLoading = false;
  }

  Iterable<PersonViewModel> convertResponse(List<PersonBackendModel> personList) sync* {
    for (PersonBackendModel person in personList) {
      yield PersonViewModel(
          id: person.id,
          gender: person.gender,
          birthdate: person.birthdate,
          status: person.status,
          phoneNumber: person.phoneNumber,
          email: person.email,
          type: person.type,
          name: person.name,
          lastVisit: person.lastVisit);
    }
  }

  @observable
  List<PersonViewModel> visitors = <PersonViewModel>[].asObservable();

  @observable
  List<PersonViewModel> trainers = <PersonViewModel>[].asObservable();

  @observable
  List<PersonViewModel> staff = <PersonViewModel>[].asObservable();
}
