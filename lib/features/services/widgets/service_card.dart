import 'package:admin_page/features/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.lable, required this.services});

  final String lable;

  final List<String> services;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310,
      child: Card(
        // margin: EdgeInsets.zero,
        color: context.appTheme.cardColor,
        // color: Colors.black,
        surfaceTintColor: Colors.transparent,
        // elevation: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0, top: 24.0),
                    child: Text(
                      lable,
                      style: context.appTheme.cardHeadlineTextStyle,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 24.0, top: 24.0),
                  child: CircleAvatar(backgroundColor: Color.fromRGBO(67, 67, 244, 1)),
                ),
              ],
            ),
            const SizedBox(
              height: 43,
            ),
            ...services
                .map((text) => Padding(
                      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                      child: Text(text, style: context.appTheme.cardContentTextStyle),
                    ))
                .toList(),
            const SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
