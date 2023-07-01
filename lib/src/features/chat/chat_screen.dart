import 'package:flutter/material.dart';
import 'package:tether_pet_owner/src/assets/assets.gen.dart';
import 'package:tether_pet_owner/src/constants/app_sizes.dart';
import 'package:tether_pet_owner/src/features/chat/message_screen.dart';
import 'package:tether_pet_owner/src/theme/config_colors.dart';
import 'package:tether_pet_owner/src/theme/text.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  static MaterialPageRoute<ChatScreen> route() {
    return MaterialPageRoute<ChatScreen>(
      builder: (BuildContext context) => ChatScreen(),
    );
  }

  // const ChatScreen({super.key});

  final List img = [
    Assets.doctor1.path,
    Assets.doctor2.path,
    Assets.doctor3.path,
    Assets.doctor4.path,
    Assets.doctor1.path,
    Assets.doctor2.path,
    Assets.doctor3.path,
    Assets.doctor4.path,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppText.paragraphS16(
          'Messages',
          fontSize: 18,
          color: Colors.white,
        ),
        actions: const [
          Icon(
            Icons.more_vert_rounded,
          ),
          gapW8,
        ],
      ),
      body: ListView(
        children: [
          gapH26,
          CommonNotificationTile(
            name: 'Petcare Clinic NYC',
            description: 'Your dog is ready to pick up...',
            timeAgo: 'June 30, 2023',
            onTap: () {
              Navigator.push(context, MessageScreen.route());
            },
          )
        ],
      ),
    );
  }
}

class CommonNotificationTile extends StatelessWidget {
  const CommonNotificationTile({
    required this.name,
    required this.description,
    required this.timeAgo,
    this.onTap,
    super.key,
  });
  final String name;
  final String description;
  final String timeAgo;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: ConfigColors.black,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            gapW20,
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ConfigColors.primary,
              ),
              child: const Icon(
                Icons.person,
                color: ConfigColors.white,
              ),
            ),
            gapW20,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.paragraphS14('From: $name'),
                AppText.paragraphI14(
                  description,
                  fontWeight: FontWeight.w500,
                ),
                AppText.paragraphI12(
                  'Date: $timeAgo',
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_rounded,
              size: 16,
              color: ConfigColors.primary,
            ),
            gapW20,
          ],
        ),
      ),
    );
  }
}

// class DoctorCategoryTile extends StatelessWidget {
//   const DoctorCategoryTile({
//     required this.img,
//     super.key,
//   });

//   final List img;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 80,
//       child: ListView.builder(
//         itemCount: img.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (BuildContext context, int index) {
//           final image = img.elementAt(index);
//           return Stack(
//             textDirection: TextDirection.rtl,
//             children: [
//               Center(
//                 child: Container(
//                   height: 60,
//                   width: 60,
//                   margin: const EdgeInsets.only(right: 6),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     image: DecorationImage(
//                       image: AssetImage('$image'),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.all(6),
//                 padding: const EdgeInsets.all(3),
//                 height: 16,
//                 width: 16,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                 ),
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.green,
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
