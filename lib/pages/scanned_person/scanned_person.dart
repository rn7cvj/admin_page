import 'package:flutter/material.dart';

class ScannedPerson extends StatelessWidget {
  const ScannedPerson({super.key, required this.qrToken});

  final String qrToken;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("QrToken $qrToken"));
  }
}
