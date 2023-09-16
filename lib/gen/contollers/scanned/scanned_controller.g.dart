// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../contollers/scanned/scanned_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ScannedController on ScannedContollerStore, Store {
  late final _$isScanningAtom =
      Atom(name: 'ScannedContollerStore.isScanning', context: context);

  @override
  bool get isScanning {
    _$isScanningAtom.reportRead();
    return super.isScanning;
  }

  @override
  set isScanning(bool value) {
    _$isScanningAtom.reportWrite(value, super.isScanning, () {
      super.isScanning = value;
    });
  }

  late final _$scannedResultStatusAtom =
      Atom(name: 'ScannedContollerStore.scannedResultStatus', context: context);

  @override
  ScannedResultStatus? get scannedResultStatus {
    _$scannedResultStatusAtom.reportRead();
    return super.scannedResultStatus;
  }

  @override
  set scannedResultStatus(ScannedResultStatus? value) {
    _$scannedResultStatusAtom.reportWrite(value, super.scannedResultStatus, () {
      super.scannedResultStatus = value;
    });
  }

  late final _$userIdAtom =
      Atom(name: 'ScannedContollerStore.userId', context: context);

  @override
  String get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(String value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  late final _$scanQrAsyncAction =
      AsyncAction('ScannedContollerStore.scanQr', context: context);

  @override
  Future<void> scanQr(String qrToken) {
    return _$scanQrAsyncAction.run(() => super.scanQr(qrToken));
  }

  @override
  String toString() {
    return '''
isScanning: ${isScanning},
scannedResultStatus: ${scannedResultStatus},
userId: ${userId}
    ''';
  }
}
