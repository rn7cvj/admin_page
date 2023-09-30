import 'package:admin_page/contollers/booking/booking_controller.dart';
import 'package:admin_page/contollers/plan/plan_controller.dart';
import 'package:admin_page/models/booking_viewmodel.dart';
import 'package:admin_page/models/plan_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class PlanCard extends StatelessWidget {
  PlanCard({super.key, required this.plan, required this.userId});

  final PlanViewModel plan;

  final PlanContoroller planContoroller = GetIt.I<PlanContoroller>();

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13.0),
        ),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(
                    8 * 2,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plan.serviceName!,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/ruble.svg',
                              width: 16,
                              height: 16,
                              colorFilter: const ColorFilter.mode(
                                Color(0xff252525),
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                'Стоимость: ${plan.planTypeCost}',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/person.svg',
                            colorFilter: const ColorFilter.mode(
                              Color(0xff252525),
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(
                              "Занятий: ${plan.planCapacity}",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              RightVerticalButton(
                lable: plan.planStatus! == "active" ? "Отменить" : "Подтвердить",
                onTap: () {
                  if (plan.planStatus! == "active") {
                    planContoroller.deactivatePlan(userId, plan.planId!.toString());
                  } else {
                    planContoroller.activatePlan(userId, plan.planId!.toString());
                  }
                },
                backgroundColor: plan.planStatus! == "active" ? Colors.transparent : const Color(0xff4343F4),
                textColor: plan.planStatus! == "active" ? const Color(0xFF4A4A4A) : Colors.white,
                drawDashLine: plan.planStatus! == "active",
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RightVerticalButton extends StatelessWidget {
  const RightVerticalButton({
    super.key,
    required this.lable,
    required this.onTap,
    required this.backgroundColor,
    required this.textColor,
    required this.drawDashLine,
  });

  final String lable;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color textColor;
  final bool drawDashLine;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(13),
            bottomLeft: Radius.circular(13),
          ),
          focusColor: Colors.black,
          hoverColor: Colors.black,
          highlightColor: Colors.black,
          splashColor: Colors.black,
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                child: drawDashLine
                    ? CustomPaint(
                        painter: DashedLinePainter(color: const Color(0xFF4A4A4A)),
                        size: const Size(double.infinity, 1),
                      )
                    : null,
              ),
              Container(
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(13),
                    bottomLeft: Radius.circular(13),
                  ),
                  color: backgroundColor,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      lable,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: textColor,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final Color color;
  DashedLinePainter({this.color = Colors.grey});

  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 4, dashSpace = 3, startX = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 0.6;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
