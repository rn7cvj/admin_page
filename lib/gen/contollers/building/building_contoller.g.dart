// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../contollers/building/building_contoller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BuildingController on BuildingControllerStore, Store {
  late final _$isLoadingAtom =
      Atom(name: 'BuildingControllerStore.isLoading', context: context);

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

  late final _$buildingsAtom =
      Atom(name: 'BuildingControllerStore.buildings', context: context);

  @override
  ObservableList<BuildingViewModel> get buildings {
    _$buildingsAtom.reportRead();
    return super.buildings;
  }

  @override
  set buildings(ObservableList<BuildingViewModel> value) {
    _$buildingsAtom.reportWrite(value, super.buildings, () {
      super.buildings = value;
    });
  }

  late final _$isBuildingAddingAtom =
      Atom(name: 'BuildingControllerStore.isBuildingAdding', context: context);

  @override
  bool get isBuildingAdding {
    _$isBuildingAddingAtom.reportRead();
    return super.isBuildingAdding;
  }

  @override
  set isBuildingAdding(bool value) {
    _$isBuildingAddingAtom.reportWrite(value, super.isBuildingAdding, () {
      super.isBuildingAdding = value;
    });
  }

  late final _$isBuidlingEditingAtom =
      Atom(name: 'BuildingControllerStore.isBuidlingEditing', context: context);

  @override
  bool get isBuidlingEditing {
    _$isBuidlingEditingAtom.reportRead();
    return super.isBuidlingEditing;
  }

  @override
  set isBuidlingEditing(bool value) {
    _$isBuidlingEditingAtom.reportWrite(value, super.isBuidlingEditing, () {
      super.isBuidlingEditing = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('BuildingControllerStore.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$addBuidlingAsyncAction =
      AsyncAction('BuildingControllerStore.addBuidling', context: context);

  @override
  Future<void> addBuidling(String buildingName) {
    return _$addBuidlingAsyncAction.run(() => super.addBuidling(buildingName));
  }

  late final _$deleteBuildingAsyncAction =
      AsyncAction('BuildingControllerStore.deleteBuilding', context: context);

  @override
  Future<void> deleteBuilding(int buildingId) {
    return _$deleteBuildingAsyncAction
        .run(() => super.deleteBuilding(buildingId));
  }

  late final _$BuildingControllerStoreActionController =
      ActionController(name: 'BuildingControllerStore', context: context);

  @override
  void switchEditingMod() {
    final _$actionInfo = _$BuildingControllerStoreActionController.startAction(
        name: 'BuildingControllerStore.switchEditingMod');
    try {
      return super.switchEditingMod();
    } finally {
      _$BuildingControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
buildings: ${buildings},
isBuildingAdding: ${isBuildingAdding},
isBuidlingEditing: ${isBuidlingEditing}
    ''';
  }
}
