// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../contollers/calendar/calendar_contoller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CalendarController on CalendarControllerStore, Store {
  late final _$isLoadingAtom =
      Atom(name: 'CalendarControllerStore.isLoading', context: context);

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

  late final _$eventsAtom =
      Atom(name: 'CalendarControllerStore.events', context: context);

  @override
  ObservableList<EventViewModel> get events {
    _$eventsAtom.reportRead();
    return super.events;
  }

  @override
  set events(ObservableList<EventViewModel> value) {
    _$eventsAtom.reportWrite(value, super.events, () {
      super.events = value;
    });
  }

  late final _$fetchNewEventsAsyncAction =
      AsyncAction('CalendarControllerStore.fetchNewEvents', context: context);

  @override
  Future<void> fetchNewEvents() {
    return _$fetchNewEventsAsyncAction.run(() => super.fetchNewEvents());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
events: ${events}
    ''';
  }
}
