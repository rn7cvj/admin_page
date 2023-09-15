import 'package:admin_page/logger.dart';
import 'package:admin_page/models/event_viewmodel.dart';
import 'package:mobx/mobx.dart';

import 'calendar_converter.dart';
import 'calendar_service.dart';

part '../../gen/contollers/calendar/calendar_contoller.g.dart';

class CalendarController = CalendarControllerStore with _$CalendarController;

abstract class CalendarControllerStore with Store {
  CalendarControllerStore({required this.calendarConverter});

  final CalendarConverter calendarConverter;

  int loadedEventsPage = 0;

  int loadedAmount = 30;

  @observable
  bool isLoading = true;

  @observable
  ObservableList<EventViewModel> events = <EventViewModel>[].asObservable();

  Future<void> init() async {
    await fetchNewEvents();
    runInAction(() => isLoading = false);
  }

  bool isFetching = false;

  bool shoudUpdateEvent() => !isFetching;

  @action
  Future<void> fetchNewEvents() async {
    isFetching = true;

    CalendarResponse response = await calendarConverter.getEvents(loadedEventsPage, loadedAmount, "ru");

    logger.i(response.status);

    if (response.status != CalendarResponseStatus.success) {
      isFetching = false;
      return;
    }

    loadedEventsPage += 1;

    if (response.events != null) {
      events.addAll(convertResponse(response.events!));
    }

    isFetching = false;
  }

  Iterable<EventViewModel> convertResponse(List<EventBackendModel> events) sync* {
    for (EventBackendModel event in events) {
      yield EventViewModel(
        id: event.id,
        eventName: event.eventName,
        beginTime: event.beginTime,
        endTime: event.endTime,
        coachPhoneNumber: event.coachPhoneNumber,
        coachEmail: event.coachEmail,
        buildingName: event.buildingName,
        totalSpaces: event.totalSpaces,
        occupiedSpaces: event.occupiedSpaces,
        areaName: event.areaName,
        active: event.active,
        coachName: event.coachName,
      );
    }
  }
}
