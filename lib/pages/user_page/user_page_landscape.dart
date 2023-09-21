import 'package:admin_page/pages/user_page/user_page_portrait.dart';
import 'package:flutter/widgets.dart';

class UserPageLandscape extends StatelessWidget {
  const UserPageLandscape({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 600,
        child: UserPagePortrait(userId: userId),
      ),
    );
  }
}
