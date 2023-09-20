import 'package:admin_page/models/booking_viewmodel.dart';
import 'package:admin_page/models/user_long_viewmodel.dart';
import 'package:admin_page/pages/scanned_person/widgets/booking_card.dart';
import 'package:admin_page/pages/scanned_person/widgets/person_header.dart';
import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({super.key, required this.userData, required this.booking});

  final UserDataLongViewModel userData;

  final List<BookingViewModel> booking;

  @override
  Widget build(BuildContext context) {
    String userName = "${userData.firstName} ${userData?.thirdName} ";

    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
      ),
      body: Column(
        children: [
          PersonHeader(userData: userData),
          const Divider(),
          ...booking.map((booking) => BookingCard(booking: booking))
        ],
      ),
    );
  }
}
