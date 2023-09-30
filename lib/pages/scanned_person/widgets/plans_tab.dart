import 'package:admin_page/models/plan_viewmodel.dart';
import 'package:admin_page/pages/scanned_person/widgets/plan_card.dart';
import 'package:flutter/material.dart';

class PlansTab extends StatelessWidget {
  const PlansTab({super.key, required this.plans, required this.userId});

  final List<PlanViewModel> plans;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: plans.map((plan) => PlanCard(plan: plan, userId: userId)).toList(),
    );
  }
}
