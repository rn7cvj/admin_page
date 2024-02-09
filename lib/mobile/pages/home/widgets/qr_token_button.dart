import 'package:admin_page/gen/i18n/strings.g.dart';
import 'package:admin_page/mobile/navigation/router.dart';
import 'package:admin_page/shared/controllers/di/manager.dart';
import 'package:admin_page/shared/controllers/token/token_storage.dart';
import 'package:admin_page/shared/controllers/user_data/controller.dart';
import 'package:flutter/material.dart';
import 'package:fefufit_uikit/fefufit_uikit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shimmer/shimmer.dart';

class QrToken extends StatelessWidget {
  QrToken({super.key});

  final UserDataController controller = DIManager.get<UserDataController>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) {
          BorderRadius borderRadius =
              BorderRadius.circular(ffBorderRadiusMedium);

          bool isEnable =
              controller.state == UserDataControllerState.successfullyLoad;

          if (isEnable) return _build(context, borderRadius, isEnable);

          return Shimmer.fromColors(
            baseColor: context.ffTheme.color.mainControllColor,
            highlightColor: context.ffTheme.color.onMainControllColor,
            enabled: !isEnable,
            direction: ShimmerDirection.rtl,
            child: _build(context, borderRadius, isEnable),
          );
        },
      );

  Widget _build(
    BuildContext context,
    BorderRadius borderRadius,
    bool isEnable,
  ) =>
      Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        color: context.ffTheme.color.mainControllColor,
        child: InkWell(
          onTap: isEnable ? () => _openQrBottomSheet(context) : null,
          borderRadius: borderRadius,
          child: Padding(
            padding: const EdgeInsets.all(ffPaddingMedium),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: _qrHint(context),
                ),
                SizedBox(width: ffPaddingMedium),
                Expanded(
                  flex: 1,
                  child: _qrPlaceHolder(context),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _qrHint(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.home.your_pass,
            style: TextStyle(
              color: context.ffTheme.color.onMainControllColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            t.home.show_qr,
            style: TextStyle(
              color: context.ffTheme.color.onMainControllColor,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      );

  Widget _qrPlaceHolder(BuildContext context) => AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ffBorderRadiusMedium),
            color: Colors.white,
          ),
          child: QrImageView(
            data: "QRCODE",
            version: QrVersions.auto,
            foregroundColor: Colors.black,
          ),
        ),
      );

  void _openQrBottomSheet(BuildContext context) => showModalBottomSheet(
        context: rootNavigatorKey.currentContext!,
        backgroundColor: context.ffTheme.color.mainBackgoundColor,
        // isScrollControlled: true,
        scrollControlDisabledMaxHeightRatio: 0.7,
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: ffPaddingMedium),
          child: Column(
            children: [
              const SizedBox(height: ffPaddingMedium),
              const Expanded(
                child: _QrToken(),
              ),
              FFMainButton(
                text: t.home.refresh_qr,
                onTap: () {},
              ),
              const SizedBox(height: ffPaddingMedium),
              FFMinorButton(
                text: t.common.close,
                onTap: rootNavigatorKey.currentContext!.pop,
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom + ffPaddingMedium,
              )
            ],
          ),
        ),
      );
}

class _QrToken extends StatelessWidget {
  const _QrToken({super.key});

  @override
  Widget build(BuildContext context) {
    String? qrToken = DIManager.get<TokenStorage>().qrToken;

    if (qrToken == null) return _errorScreen(context);

    return _qrScreen(context, qrToken);
  }

  Widget _qrScreen(BuildContext context, String qrToken) => QrImageView(
      data: qrToken,
      eyeStyle: QrEyeStyle(
        eyeShape: QrEyeShape.circle,
        color: context.ffTheme.color.minorControllColor,
      ),
      dataModuleStyle: QrDataModuleStyle(
        dataModuleShape: QrDataModuleShape.circle,
        color: context.ffTheme.color.minorControllColor,
      ));

  Widget _errorScreen(BuildContext context) => Center(
        child: Card(
          color: context.ffTheme.color.mainControllColor,
          child: Padding(
            padding: const EdgeInsets.all(ffPaddingMedium),
            child: Text(
              t.home.error_qr,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: context.ffTheme.color.onMainControllColor,
                  ),
            ),
          ),
        ),
      );
}
