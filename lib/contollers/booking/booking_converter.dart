import 'package:admin_page/contollers/booking/booking_service.dart';

class BookingConverter {
  final BookingService bookingService;

  BookingConverter({required this.bookingService});

  Future<BookingResponse> getBooking(String userId) async {
    BookingBackendResponse? backendResponse;

    try {
      backendResponse = await bookingService.getBooking(userId);
    } catch (e) {
      return BookingResponse()..status = BookingResponseStatus.networkTrouble;
    }

    if (!backendResponse.isSuccess) {
      return BookingResponse()..status = BookingResponseStatus.networkTrouble;
    }

    return BookingResponse()
      ..status = BookingResponseStatus.success
      ..booking = backendResponse.booking;
  }

  Future<void> confirmBooking(String eventId, String userId) async {
    try {
      await bookingService.confirmBooking(eventId, userId);
    } catch (ex) {}
  }

  Future<void> unconfirmBooking(String eventId, String userId) async {
    try {
      await bookingService.unconfirmBooking(eventId, userId);
    } catch (ex) {}
  }
}

class BookingResponse {
  late BookingResponseStatus status;

  List<BookingBackendModel>? booking;
}

enum BookingResponseStatus {
  success,
  networkTrouble,
}
