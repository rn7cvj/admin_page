import 'package:admin_page/models/booking_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({super.key, required this.booking});

  final BookingViewModel booking;

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
                        booking.eventName!,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        // '${dateTimeFormat(booking.beginTime)}, ${DateFormat.Hm().format(booking.beginTime)} - ${DateFormat.Hm().format(booking.endTime)}',
                        "${booking.beginTime?.substring(0, 10)} - ${booking.endTime?.substring(0, 10)} ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: const Color(0xff4343F4),
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/location.svg',
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
                                '${booking.buildingName}, ${booking.areaName}',
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
                              booking.coachName!,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const RightVerticalButton()
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
  });

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(13),
          ),
          onTap: () {},
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                child: CustomPaint(
                  painter: DashedLinePainter(color: const Color(0xFF4A4A4A)),
                  size: const Size(double.infinity, 1),
                ),
              ),
              SizedBox(
                height: 44,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Отменить',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: const Color(0xFF4A4A4A),
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
