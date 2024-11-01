import 'package:flutter/material.dart';
import 'package:newtetherpets/src/assets/assets.gen.dart';
import 'package:newtetherpets/src/constants/app_sizes.dart';
import 'package:newtetherpets/src/features/chat/message_screen.dart';
import 'package:newtetherpets/src/theme/config_colors.dart';
import 'package:newtetherpets/src/theme/text.dart';

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
        backgroundColor: ConfigColors.primary,
        centerTitle: true,
        title: const AppText.titleS20(
          'Messages',
          color: ConfigColors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_outlined,
              color: ConfigColors.white,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.search,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: AppText.paragraphS16(
              'Active Now',
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: DoctorCategoryTile(img: img),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: img.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context, MessageScreen.route());
                    },
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('${img[index]}'),
                    ),
                    title: const AppText.titleS20(
                      'Dr. Doctor Name',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    subtitle: const AppText.paragraphI14(
                      'Hello, Doctor are you there?',
                      color: Colors.black54,
                    ),
                    trailing: const AppText.paragraphI14(
                      '12: 30',
                      color: Colors.black54,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class DoctorCategoryTile extends StatelessWidget {
  const DoctorCategoryTile({
    required this.img,
    super.key,
  });

  final List img;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: img.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final image = img.elementAt(index);
          return Stack(
            textDirection: TextDirection.rtl,
            children: [
              Center(
                child: Container(
                  height: 60,
                  width: 60,
                  margin: const EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('$image'),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(6),
                padding: const EdgeInsets.all(3),
                height: 16,
                width: 16,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          );
        },
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