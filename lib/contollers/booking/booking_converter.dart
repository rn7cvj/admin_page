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
}

class BookingResponse {
  late BookingResponseStatus status;

  List<BookingBackendModel>? booking;
}

enum BookingResponseStatus {
  success,
  networkTrouble,
}
