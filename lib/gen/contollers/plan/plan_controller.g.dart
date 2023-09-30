// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../contollers/plan/plan_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlanContoroller on BookingControllerStore, Store {
  late final _$isLoadingAtom =
      Atom(name: 'BookingControllerStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$plansAtom =
      Atom(name: 'BookingControllerStore.plans', context: context);

  @override
  ObservableList<PlanViewModel> get plans {
    _$plansAtom.reportRead();
    return super.plans;
  }

  @override
  set plans(ObservableList<PlanViewModel> value) {
    _$plansAtom.reportWrite(value, super.plans, () {
      super.plans = value;
    });
  }

  late final _$getPlansAsyncAction =
      AsyncAction('BookingControllerStore.getPlans', context: context);

  @override
  Future<void> getPlans(String userId) {
    return _$getPlansAsyncAction.run(() => super.getPlans(userId));
  }

  late final _$activatePlanAsyncAction =
      AsyncAction('BookingControllerStore.activatePlan', context: context);

  @override
  Future<void> activatePlan(String userId, String planId) {
    return _$activatePlanAsyncAction
        .run(() => super.activatePlan(userId, planId));
  }

  late final _$deactivatePlanAsyncAction =
      AsyncAction('BookingControllerStore.deactivatePlan', context: context);

  @override
  Future<void> deactivatePlan(String userId, String planId) {
    return _$deactivatePlanAsyncAction
        .run(() => super.deactivatePlan(userId, planId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
plans: ${plans}
    ''';
  }
}
