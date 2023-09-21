import 'package:admin_page/models/booking_viewmodel.dart';
import 'package:admin_page/models/user_long_viewmodel.dart';
import 'package:admin_page/pages/scanned_person/widgets/booking_card.dart';
import 'package:admin_page/pages/scanned_person/widgets/booking_tab.dart';
import 'package:admin_page/pages/scanned_person/widgets/person_header.dart';
import 'package:flutter/material.dart';

import 'tab_bar_selector.dart';

class PersonCard extends StatefulWidget {
  const PersonCard({super.key, required this.userData, required this.booking, required this.userId});

  final UserDataLongViewModel userData;

  final List<BookingViewModel> booking;

  final String userId;

  @override
  State<PersonCard> createState() => _PersonCardState();
}

class _PersonCardState extends State<PersonCard> with TickerProviderStateMixin {
  late final tabBarContoller = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    String userName = "${widget.userData.firstName} ${widget.userData.thirdName} ";

    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            PersonHeader(userData: widget.userData),
            const Divider(),
            TabBarSelector(tabBarController: tabBarContoller),
            const SizedBox(height: 8),
            Expanded(
              child: TabBarView(
                controller: tabBarContoller,
                children: [
                  BookingTab(booking: widget.booking, userId: widget.userId),
                  BookingTab(booking: widget.booking, userId: widget.userId),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
