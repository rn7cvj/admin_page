// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../contollers/booking/booking_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BookingContoroller on BookingControllerStore, Store {
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

  late final _$bookingAtom =
      Atom(name: 'BookingControllerStore.booking', context: context);

  @override
  ObservableList<BookingViewModel> get booking {
    _$bookingAtom.reportRead();
    return super.booking;
  }

  @override
  set booking(ObservableList<BookingViewModel> value) {
    _$bookingAtom.reportWrite(value, super.booking, () {
      super.booking = value;
    });
  }

  late final _$getBookingAsyncAction =
      AsyncAction('BookingControllerStore.getBooking', context: context);

  @override
  Future<void> getBooking(String userId) {
    return _$getBookingAsyncAction.run(() => super.getBooking(userId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
booking: ${booking}
    ''';
  }
}
