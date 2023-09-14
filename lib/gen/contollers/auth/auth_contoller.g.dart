// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../contollers/auth/auth_contoller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on AuthContollerStore, Store {
  late final _$isLoadingAtom =
      Atom(name: 'AuthContollerStore.isLoading', context: context);

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

  late final _$tryToLoginAsyncAction =
      AsyncAction('AuthContollerStore.tryToLogin', context: context);

  @override
  Future<void> tryToLogin(String email, String password) {
    return _$tryToLoginAsyncAction.run(() => super.tryToLogin(email, password));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
