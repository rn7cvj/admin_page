import 'package:admin_page/contollers/building/building_contoller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:file_picker/file_picker.dart';

class BuildingPage extends StatelessWidget {
  BuildingPage({super.key, required this.buildingId});

  final String buildingId;

  final BuildingController buildingController = GetIt.I<BuildingController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['jpg'],
            );

            if (result != null) {
              List<int> imtBytes = result.files.single.bytes!.toList();
              buildingController.uploadImage(buildingId, imtBytes);
            }
          },
          child: Text("Upload Image")),
    );
  }
}
