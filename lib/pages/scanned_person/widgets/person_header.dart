import 'package:admin_page/i18n/strings.g.dart';
import 'package:admin_page/logger.dart';
import 'package:admin_page/models/user_long_viewmodel.dart';
import 'package:admin_page/pages/user_page/widgets/data_tile.dart';
import 'package:flutter/material.dart';

class PersonHeader extends StatelessWidget {
  const PersonHeader({super.key, required this.userData});

  final UserDataLongViewModel userData;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          // child: CircleAvatar(
          //   radius: 50,
          //   child: SizedBox(
          //     width: 200,
          //     height: 200,
          //     child: userData.photo!.isEmpty ? const Icon(Icons.person) : Image.network(userData.photo!.first),
          //   ),
          // ),
          child: Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: userData.photo!.isEmpty
                  ? null
                  : DecorationImage(
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
    );
  }
}
