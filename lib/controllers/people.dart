import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../backend_connections/people.dart';
import '../models/person.dart';

part 'people.g.dart';

class PeopleContoller = PeopleContollerStore with _$PeopleContoller;

abstract class PeopleContollerStore with Store {
  @observable
  bool isLoading = true;

  int loadedVisitorsPage = 0;
  int loadedTrainersPage = 0;
  int loadedStaffPage = 0;

  int loadedAmount = 30;

  PeopleService backendConnection = GetIt.I<PeopleService>();

  Future<void> init() async {
    await fetchNewVisitors();
    await fetchNewTrainers();
    await fetchNewStaff();
    runInAction(() {
      isLoading = false;
    });
  }

  bool isVisitorsLoading = true;

  bool shoudUpdateVisitors() => !isVisitorsLoading;

  @action
  Future<void> fetchNewVisitors() async {
    isVisitorsLoading = true;
    List<PersonViewModel>? newVisitors = await backendConnection.getVisitors(loadedVisitorsPage, loadedAmount);

    if (newVisitors == null) {
      isVisitorsLoading = false;
      return;
    }

    loadedVisitorsPage += 1;
    visitors.addAll(newVisitors);
    isVisitorsLoading = false;
  }

  bool isTrainersLodaing = true;

  bool shoudUpdateTrainers() => !isTrainersLodaing;

  @action
  Future<void> fetchNewTrainers() async {
    isTrainersLodaing = true;
    List<PersonViewModel>? newTrainers = await backendConnection.getTrainers(loadedTrainersPage, loadedAmount);

    if (newTrainers == null) {
      isTrainersLodaing = false;
      return;
    }

    loadedTrainersPage += 1;
    trainers.addAll(newTrainers);
    isTrainersLodaing = false;
  }

  bool isStaffLoading = true;

  bool shoudUpdateStaff() => !isStaffLoading;

  @action
  Future<void> fetchNewStaff() async {
    isStaffLoading = true;
    List<PersonViewModel>? newStaff = await backendConnection.getStaff(loadedStaffPage, loadedAmount);

    if (newStaff == null) {
      isStaffLoading = false;
      return;
    }

    loadedStaffPage += 1;
    staff.addAll(newStaff);
    isStaffLoading = false;
  }

  @observable
  List<PersonViewModel> visitors = <PersonViewModel>[].asObservable();

  @observable
  List<PersonViewModel> trainers = <PersonViewModel>[].asObservable();

  @observable
  List<PersonViewModel> staff = <PersonViewModel>[].asObservable();
}
