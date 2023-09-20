import 'package:admin_page/contollers/booking/booking_converter.dart';
import 'package:admin_page/contollers/booking/booking_service.dart';
import 'package:admin_page/logger.dart';
import 'package:admin_page/models/booking_viewmodel.dart';
import 'package:mobx/mobx.dart';
part '../../gen/contollers/booking/booking_controller.g.dart';

class BookingContoroller = BookingControllerStore with _$BookingContoroller;

abstract class BookingControllerStore with Store {
  BookingControllerStore({required this.bookingConverter});

  final BookingConverter bookingConverter;

  @observable
  bool isLoading = true;

  @observable
  ObservableList<BookingViewModel> booking = <BookingViewModel>[].asObservable();

  @action
  Future<void> getBooking(String userId) async {
    isLoading = true;

    BookingResponse bookingResponse = await bookingConverter.getBooking(userId);

    logger.i(bookingResponse.status);

    if (bookingResponse.status != BookingResponseStatus.success) {
      isLoading = false;
      return;
    }

    booking = convertResponse(bookingResponse.booking!).toList().asObservable();

    isLoading = false;
  }

  Iterable<BookingViewModel> convertResponse(List<BookingBackendModel> bookings) sync* {
    for (BookingBackendModel booking in bookings) {
      yield BookingViewModel(
        id: booking.id,
        eventName: booking.eventName,
        beginTime: booking.beginTime,
        endTime: booking.endTime,
        coachPhoneNumber: booking.coachPhoneNumber,
        coachName: booking.coachName,
        coachEmail: booking.coachEmail,
        totalSpaces: booking.totalSpaces,
        occupiedSpaces: booking.occupiedSpaces,
        areaName: booking.areaName,
        status: booking.status,
      );
    }
  }
}
