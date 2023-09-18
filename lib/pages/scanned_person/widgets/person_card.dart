import 'package:admin_page/models/user_long_viewmodel.dart';
import 'package:admin_page/pages/scanned_person/widgets/person_header.dart';
import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({super.key, required this.userData});

  final UserDataLongViewModel userData;

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
        ],
      ),
    );
  }
}
