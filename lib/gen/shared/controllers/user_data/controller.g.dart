// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../shared/controllers/user_data/controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserDataController on UserDataControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'UserDataControllerBase.state', context: context);

  @override
  UserDataControllerState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(UserDataControllerState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$getUserDataAsyncAction =
      AsyncAction('UserDataControllerBase.getUserData', context: context);

  @override
  Future<void> getUserData() {
    return _$getUserDataAsyncAction.run(() => super.getUserData());
  }

  late final _$UserDataControllerBaseActionController =
      ActionController(name: 'UserDataControllerBase', context: context);

  @override
  void init() {
    final _$actionInfo = _$UserDataControllerBaseActionController.startAction(
        name: 'UserDataControllerBase.init');
    try {
      return super.init();
    } finally {
      _$UserDataControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
