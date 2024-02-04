import 'package:admin_page/gen/i18n/strings.g.dart';
import 'package:admin_page/mobile/main.dart';
import 'package:admin_page/shared/controllers/di/manager.dart';
import 'package:admin_page/shared/controllers/user_data/controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fefufit_uikit/fefufit_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shimmer/shimmer.dart';

class HomeAppBar extends AppBar {
  HomeAppBar()
      : super(
          automaticallyImplyLeading: false,
          title: _HomeAppBarTitle(),
          actions: [
            _HomeAppBarProfile(),
          ],
          titleSpacing: 0,
        );
}

class _HomeAppBarTitle extends StatelessWidget {
  _HomeAppBarTitle({super.key});

  final UserDataController controller = DIManager.get<UserDataController>();

  @override
  Widget build(BuildContext context) => Observer(
      builder: (_) => switch (controller.state) {
            UserDataControllerState.loading => _buildLoadingScreen(context),
            UserDataControllerState.successfullyLoad =>
              _buildLoadedScreen(context),
            UserDataControllerState.loadWithErrors =>
              _buildErrorScreen(context),
          });

  Widget _buildLoadingScreen(BuildContext context) => Shimmer.fromColors(
        baseColor: context.ffTheme.color.minorControllColor,
        highlightColor: context.ffTheme.color.onMinorControllColor,
        period: const Duration(milliseconds: 4000),
        child: Text(
          t.common.loading,
        ),
      );

  Widget _buildLoadedScreen(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.home.welcome,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            "${controller.userData?.firstName ?? ""}${controller.userData != null ? "!" : ""}",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      );

  Widget _buildErrorScreen(BuildContext context) => Text(
        t.common.error,
      );
}

class _HomeAppBarProfile extends StatelessWidget {
  _HomeAppBarProfile({super.key});

  final UserDataController controller = DIManager.get<UserDataController>();

  @override
  Widget build(BuildContext context) => Observer(
      builder: (_) => switch (controller.state) {
            UserDataControllerState.loading => _buildLoadingScreen(context),
            UserDataControllerState.successfullyLoad =>
              _buildLoadedScreen(context),
            UserDataControllerState.loadWithErrors =>
              _buildErrorScreen(context),
          });

  Widget _buildLoadingScreen(BuildContext context) => CircleAvatar(
        backgroundColor: context.ffTheme.color.minorControllColor,
        child: SizedBox(
          width: 42,
          height: 42,
          child: Padding(
            padding: const EdgeInsets.all(ffPaddingSmall),
            child: CircularProgressIndicator(
              color: context.ffTheme.color.onMinorControllColor,
            ),
          ),
        ),
      );

  Widget _buildLoadedScreen(BuildContext context) => CircleAvatar(
        backgroundColor: context.ffTheme.color.minorControllColor,
        radius: double.infinity,
        foregroundImage: CachedNetworkImage(
              imageUrl: controller.userData!.photos!.first,
              placeholder: (context, url) => CircularProgressIndicator(
                color: context.ffTheme.color.onMinorControllColor,
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.person_outline,
                color: context.ffTheme.color.onMinorControllColor,
              ),
            ).,
        ),
      );

  Widget _buildErrorScreen(BuildContext context) => CircleAvatar(
        backgroundColor: context.ffTheme.color.minorControllColor,
        child: SizedBox(
          width: 42,
          height: 42,
          child: Padding(
            padding: const EdgeInsets.all(ffPaddingSmall),
            child: Icon(
              Icons.error_outline,
              color: context.ffTheme.color.onMinorControllColor,
            ),
          ),
        ),
      );
}
