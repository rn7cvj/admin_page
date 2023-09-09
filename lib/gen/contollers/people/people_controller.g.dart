// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../contollers/people/people_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PeopleContoller on PeopleContollerStore, Store {
  late final _$isLoadingAtom =
      Atom(name: 'PeopleContollerStore.isLoading', context: context);

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

  late final _$visitorsAtom =
      Atom(name: 'PeopleContollerStore.visitors', context: context);

  @override
  List<PersonViewModel> get visitors {
    _$visitorsAtom.reportRead();
    return super.visitors;
  }

  @override
  set visitors(List<PersonViewModel> value) {
    _$visitorsAtom.reportWrite(value, super.visitors, () {
      super.visitors = value;
    });
  }

  late final _$trainersAtom =
      Atom(name: 'PeopleContollerStore.trainers', context: context);

  @override
  List<PersonViewModel> get trainers {
    _$trainersAtom.reportRead();
    return super.trainers;
  }

  @override
  set trainers(List<PersonViewModel> value) {
    _$trainersAtom.reportWrite(value, super.trainers, () {
      super.trainers = value;
    });
  }

  late final _$staffAtom =
      Atom(name: 'PeopleContollerStore.staff', context: context);

  @override
  List<PersonViewModel> get staff {
    _$staffAtom.reportRead();
    return super.staff;
  }

  @override
  set staff(List<PersonViewModel> value) {
    _$staffAtom.reportWrite(value, super.staff, () {
      super.staff = value;
    });
  }

  late final _$fetchNewVisitorsAsyncAction =
      AsyncAction('PeopleContollerStore.fetchNewVisitors', context: context);

  @override
  Future<void> fetchNewVisitors() {
    return _$fetchNewVisitorsAsyncAction.run(() => super.fetchNewVisitors());
  }

  late final _$fetchNewTrainersAsyncAction =
      AsyncAction('PeopleContollerStore.fetchNewTrainers', context: context);

  @override
  Future<void> fetchNewTrainers() {
    return _$fetchNewTrainersAsyncAction.run(() => super.fetchNewTrainers());
  }

  late final _$fetchNewStaffAsyncAction =
      AsyncAction('PeopleContollerStore.fetchNewStaff', context: context);

  @override
  Future<void> fetchNewStaff() {
    return _$fetchNewStaffAsyncAction.run(() => super.fetchNewStaff());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
visitors: ${visitors},
trainers: ${trainers},
staff: ${staff}
    ''';
  }
}
