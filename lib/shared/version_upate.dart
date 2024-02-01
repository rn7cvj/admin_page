// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:mobx/mobx.dart';
// import 'package:http/http.dart' as http;

// import 'package:ota_update/ota_update.dart';

// class UpdateChecker {
//   Future<String?> getActualVersion() async {
//     var res = await http.post(
//       Uri.parse('$baseUrl/version'),
//       headers: {'Content-Type': 'application/json; charset=UTF-8'},
//       body: json.encode({"platform": "ios"}),
//     );
//     if (res.statusCode == 200) {
//       return json.decode(res.body);
//     }
//     return null;
//   }
// }

// void update(BuildContext context) async {
//   final progress = 0.0.obs();

//   var actualVersion = await UpdateChecker().getActualVersion();

//   void updateApp() {
//     try {
//       //LINK CONTAINS APK OF FLUTTER HELLO WORLD FROM FLUTTER SDK EXAMPLES
//       OtaUpdate()
//           .execute(
//         otaHost,
//         // OPTIONAL
//         destinationFilename: 'fefufit-$actualVersion.apk',
//         //OPTIONAL, ANDROID ONLY - ABILITY TO VALIDATE CHECKSUM OF FILE:
//         // sha256checksum:
//         //     "d6da28451a1e15cf7a75f2c3f151befad3b80ad0bb232ab15c20897e54f21478",
//       )
//           .listen(
//         (OtaEvent event) {
//           runInAction(
//             () => progress.value = (double.tryParse(event.value!) ?? 0),
//           );
//         },
//       );
//     } catch (e) {
//       debugPrint('Failed to make OTA update. Details: $e');
//     }
//   }

//   if (context.mounted) {
//     if (actualVersion != appVersion) {
//       showModalBottomSheet(
//         isScrollControlled: true,
//         isDismissible: false,
//         useRootNavigator: true,
//         context: context,
//         builder: (context) {
//           return Center(
//             heightFactor: 1,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const SizedBox(height: appPadding * 4),
//                 Text(
//                   'Доступно обновление!',
//                   style: Theme.of(context).textTheme.headlineSmall,
//                 ),
//                 const SizedBox(height: appPadding),
//                 Text(
//                   '$appVersion => $actualVersion',
//                   style: Theme.of(context).textTheme.bodyLarge,
//                 ),
//                 const SizedBox(height: appPadding),
//                 Card(
//                   margin: const EdgeInsets.all(appPadding * 3),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(cardBorderRadius),
//                   ),
//                   color: Theme.of(context).colorScheme.primaryContainer,
//                   child: InkWell(
//                     borderRadius: BorderRadius.circular(cardBorderRadius),
//                     onTap: progress.value == 0 ? updateApp : () {},
//                     child: AnimatedSize(
//                       duration: const Duration(milliseconds: 200),
//                       child: SizedBox(
//                         width: double.infinity,
//                         child: Padding(
//                           padding: const EdgeInsets.all(appPadding),
//                           child: Observer(
//                             builder: (_) => Center(
//                               child: progress.value != 0
//                                   ? LinearProgressIndicator(
//                                       borderRadius: BorderRadius.circular(90),
//                                       value: progress.value / 100,
//                                       color: Colors.white,
//                                     )
//                                   : Text(
//                                       'Установить',
//                                       style: TextStyle(
//                                         color: Theme.of(context)
//                                             .colorScheme
//                                             .onPrimaryContainer,
//                                       ),
//                                     ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: MediaQuery.paddingOf(context).bottom),
//               ],
//             ),
//           );
//         },
//       );
//     }
//   }
// }
