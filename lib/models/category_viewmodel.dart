import 'package:admin_page/models/service_viewmodel.dart';

class CategoryViewModel {
  final int id;
  final String name;
  final bool active;
  final List<String> photos;

  final List<ServiceViewModel> services;

  CategoryViewModel(
      {required this.id, required this.name, required this.active, required this.photos, required this.services});
}
