// import 'package:fci_project/config.dart';
// import 'package:fci_project/helper/constants.dart';
// import 'package:fci_project/main.dart';
import 'package:fci_project/presentation/shared_widgets/primary_text.dart';
import 'package:fci_project/style/colors.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';

class AboutUsScrean extends StatelessWidget {
  const AboutUsScrean({Key? key}) : super(key: key);

//   _buildHeaderText(text) {
//     return PrimaryText(
//       text: text,
//       fontWeight: FontWeight.bold,
//     );
//   }

//   _builddescText(text) {
//     return PrimaryText(
//       text: text,
//     );
//   }

//   List<Map> convertSocial() {
//     final list = convertMapToList(store.social!.toJson());
//     List<Map> convertedList = [];
//     for (var map in list) {
//       switch (map.keys.first) {
//         case "insta":
//           convertedList.add({
//             'name': 'انستجرام',
//             'link': map[map.keys.first],
//             'icon': FontAwesomeIcons.instagram,
//             'color': socialColor['instagram']
//           });
//           break;
//         case "twitter":
//           convertedList.add({
//             'name': 'تويتر',
//             'link': map[map.keys.first],
//             'icon': FontAwesomeIcons.twitter,
//             'color': socialColor['twitter'],
//           });
//           break;
//         case "fb":
//           convertedList.add({
//             'name': 'فبس بوك',
//             'link': map[map.keys.first],
//             'icon': FontAwesomeIcons.facebook,
//             'color': socialColor['facebook']
//           });
//           break;
//         case "yt":
//           convertedList.add({
//             'name': 'يوتيوب',
//             'link': map[map.keys.first],
//             'icon': FontAwesomeIcons.youtube,
//             'color': socialColor['youtube']
//           });
//           break;
//         case "snap":
//           convertedList.add({
//             'name': 'سناب شات',
//             'link': map[map.keys.first],
//             'icon': FontAwesomeIcons.snapchat,
//             'color': socialColor['snapchat']
//           });
//           break;
//         case "tiktok":
//           convertedList.add({
//             'name': 'تيك توك',
//             'link': map[map.keys.first],
//             'icon': FontAwesomeIcons.tiktok,
//             'color': kblack
//           });
//           break;
//       }
//     }
//     return convertedList;
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: kblack),
          title: PrimaryText(
            text: 'عنا',
            fontWeight: FontWeight.w600,
            fontSizeRatio: 1.2,
          ),
          backgroundColor: kwhite,
          elevation: 2,
        ),
        body:Container());
  }
}
//     return Scaffold(
//         appBar: AppBar(
//           iconTheme: IconThemeData(color: kblack),
//           title: PrimaryText(
//             text: 'عنا',
//             fontWeight: FontWeight.w600,
//             fontSizeRatio: 1.2,
//           ),
//           backgroundColor: kwhite,
//           elevation: 2,
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(defultPadding),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 _buildHeaderText("متجر " + storeName + ' :'),
//                 _builddescText(store.desc),
//                 SizedBox(height: defultPadding),
//                 _buildHeaderText('وسائل التواصل : '),
//                 ...convertSocial()
//                     .map<Widget>((e) => TextButton.icon(
//                         onPressed: () async =>
//                             await launch(Uri.parse(e['link']).toString()),
//                         icon: Icon(
//                           e['icon'],
//                           color: e['color'],
//                         ),
//                         label: _builddescText(e['name'])))
//                     .toList()
//               ],
//             ),
//           ),
//         ));
//   }
// }
