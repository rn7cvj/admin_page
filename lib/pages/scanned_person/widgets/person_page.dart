import 'package:admin_page/contollers/booking/booking_controller.dart';
import 'package:admin_page/contollers/booking/booking_converter.dart';
import 'package:admin_page/contollers/booking/booking_service.dart';
import 'package:admin_page/contollers/user_data/user_data_controller.dart';
import 'package:admin_page/contollers/user_data/user_data_converter.dart';
import 'package:admin_page/contollers/user_data/user_data_service.dart';
import 'package:admin_page/pages/scanned_person/widgets/person_card.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PersonScannedPage extends StatelessWidget {
  PersonScannedPage({super.key, required this.scannedUserId}) {
    userDataConverter = UserDataConverter(scannedPersonService: GetIt.I<ChopperClient>().getService<UserDataService>());
    userDataContoller = UserDataContoller(scannedPersonConverter: userDataConverter);

    bookingConverter = BookingConverter(bookingService: GetIt.I<ChopperClient>().getService<BookingService>());
    bookingContoroller = BookingContoroller(bookingConverter: bookingConverter);

    userDataContoller.getUserData(scannedUserId);
    bookingContoroller.getBooking(scannedUserId);
  }

  final String scannedUserId;

  late UserDataConverter userDataConverter;
  late UserDataContoller userDataContoller;

  late BookingConverter bookingConverter;
  late BookingContoroller bookingContoroller;

  @override
  Widget build(BuildContext context) {
    userDataContoller.getUserData(scannedUserId);
    return Observer(
      builder: (context) {
        if (userDataContoller.isLoading || bookingContoroller.isLoading) {
          return Center(
            child: LoadingAnimationWidget.prograssiveDots(color: Color.fromRGBO(67, 67, 244, 1), size: 60),
          );
        }

        return PersonCard(
          userData: userDataContoller.userData!,
          booking: bookingContoroller.booking,
        );
      },
    );
  }
}
