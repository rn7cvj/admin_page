import 'package:admin_page/models/booking_viewmodel.dart';
import 'package:flutter/widgets.dart';

import 'booking_card.dart';

class BookingTab extends StatelessWidget {
  const BookingTab({super.key, required this.booking, required this.userId});

  final String userId;
  final List<BookingViewModel> booking;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: booking
          .map((booking) => BookingCard(
                booking: booking,
                userId: userId,
              ))
          .toList(),
    );
  }
}
