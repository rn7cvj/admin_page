// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../contollers/plan/plan_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_string_interpolations, unnecessary_brace_in_string_interps
final class _$PlanService extends PlanService {
  _$PlanService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PlanService;

  @override
  Future<Response<dynamic>> _getPlans(
    dynamic screen,
    dynamic userId,
  ) {
    final Uri $url = Uri.parse('/plan/view');
    final Map<String, dynamic> $params = <String, dynamic>{
      'screen': screen,
      'user_id': userId,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _activatePlan(dynamic planId) {
    final Uri $url = Uri.parse('plan/activate');
    final Map<String, dynamic> $params = <String, dynamic>{'plan_id': planId};
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _deactivatePlan(dynamic planId) {
    final Uri $url = Uri.parse('plan/deactivate');
    final Map<String, dynamic> $params = <String, dynamic>{'plan_id': planId};
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
