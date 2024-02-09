import 'package:admin_page/mobile/navigation/navigator.dart';
import 'package:flutter/material.dart';

class ProfileAppBar extends AppBar {
  ProfileAppBar()
      : super(
          automaticallyImplyLeading: false,
          leading: const IconButton(
            onPressed: AppNavigator.openHome,
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          forceMaterialTransparency: true,
        );
}
