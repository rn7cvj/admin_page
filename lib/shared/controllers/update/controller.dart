import 'package:admin_page/shared/controllers/update/converter.dart';
import 'package:admin_page/shared/controllers/update/storage.dart';
import 'package:mobx/mobx.dart';

part '../../../gen/shared/controllers/update/controller.g.dart';

class UpdateController = UpdateControllerBase with _$UpdateController;

abstract class UpdateControllerBase with Store {
  @observable
  Future<void> checkhUpdate() async {
    final currentVersion = UpdateStorage.version;
    final actualVersion = await UpdateConverter.getActualVersion();

    if (currentVersion != actualVersion) {}
  }
}
