import 'package:admin_page/shared/controllers/converter_provider.dart';
import 'package:admin_page/shared/controllers/network/service_provider.dart';
import 'package:admin_page/shared/controllers/update/service.dart';

class UpdateConverter implements ConverterBase {
  static Future<String> getActualVersion() async {
    final response =
        await ServiceProvide.get<UpdateService>().getActualVersion();
    return response.body;
  }
}
