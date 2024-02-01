import 'package:chopper/chopper.dart';

part '../../../gen/shared/controllers/update/service.chopper.dart';

@ChopperApi()
abstract class UpdateService extends ChopperService {
  @Get()
  Future<Response> getActualVersion();

  static UpdateService create([ChopperClient? client]) =>
      _$UpdateService(client);
}
