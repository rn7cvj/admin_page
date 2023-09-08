import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 3 / 2,
      crossAxisCount: 7,
      children: List.generate(
        35,
        (index) => Card(
          child: Center(
            child: Text(index.toString()),
          ),
        ),
      ),
    );
  }
}
