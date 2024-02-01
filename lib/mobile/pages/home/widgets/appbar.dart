import 'package:admin_page/shared/controllers/di/manager.dart';
import 'package:admin_page/shared/controllers/user_data/controller.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({super.key});

  final UserDataController controller = DIManager.get<UserDataController>();

  @override
  Widget build(BuildContext context) => Observer(builder: (_) {
        return Row();
      });
}
