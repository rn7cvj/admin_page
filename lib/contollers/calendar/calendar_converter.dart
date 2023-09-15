import 'package:admin_page/contollers/calendar/calendar_service.dart';

class CalendarConverter {
  final CalendarService calendarService;

  CalendarConverter({required this.calendarService});

  Future<CalendarResponse> getEvents(int page, int quantity, String lang) async {
    CalendarBackendResponse? backendResponse;

    try {
      backendResponse = await calendarService.getEvent(page, quantity, lang);
    } catch (ex) {
      return CalendarResponse()..status = CalendarResponseStatus.networkTrouble;
    }

    if (!backendResponse.isSuccess) {
      return CalendarResponse()..status = CalendarResponseStatus.networkTrouble;
    }

    return CalendarResponse()
      ..status = CalendarResponseStatus.success
      ..events = backendResponse.events;
  }
}

class CalendarResponse {
  late CalendarResponseStatus status;

  List<EventBackendModel>? events;
}

enum CalendarResponseStatus {
  networkTrouble,
  success,
}
