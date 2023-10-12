import 'package:admin_page/contollers/calendar/calendar_service.dart';
import 'package:admin_page/contollers/token/token_contoller.dart';
import 'package:chopper/chopper.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher_string.dart';

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

  Future<void> exportExcel() async {
    try {
      TokenContoller tokenContoller = GetIt.I<TokenContoller>();
      String newToken = tokenContoller.token ?? "";
      launchUrlString("https://fefufit.dvfu.ru/api2/excel/export",
          mode: LaunchMode.externalApplication,
          webViewConfiguration: WebViewConfiguration(
            headers: <String, String>{'auth': newToken},
          ));
    } catch (ex) {}
  }

  Future<void> importExcel(String file) async {
    try {
      calendarService.importExcel(file);
    } catch (ex) {}
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
