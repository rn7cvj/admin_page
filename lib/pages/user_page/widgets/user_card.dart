import 'package:admin_page/i18n/strings.g.dart';
import 'package:admin_page/logger.dart';
import 'package:admin_page/models/user_long_viewmodel.dart';
import 'package:admin_page/pages/user_page/widgets/data_tile.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.userData});

  final UserDataLongViewModel userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: userData.photo!.isEmpty
                  ? const CircleAvatar(
                      radius: 50,
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Icon(Icons.person),
                      ),
                    )
                  : Container(
                      width: 120.0,
                      height: 120.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          scale: 0.9,
                          fit: BoxFit.fill,
                          image: NetworkImage(userData.photo!.first),
                        ),
                      ),
                    ),
            ),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userData.firstName!,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    userData.secondName!,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    userData.thirdName!,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            )
          ],
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Divider(),
                DataTile(
                  title: t.people.column_birthdate,
                  data: userData.birthdate!,
                ),
                const Divider(),
                DataTile(
                  title: t.people.column_sex,
                  data: userData.gender!,
                ),
                const Divider(),
                DataTile(
                  title: t.people.column_phone_number,
                  data: userData.phoneNumber!,
                ),
                const Divider(),
                DataTile(
                  title: t.people.column_status,
                  data: userData.status!,
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
