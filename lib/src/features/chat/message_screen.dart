import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:tether_pet_owner/src/assets/assets.gen.dart';
import 'package:tether_pet_owner/src/assets/fonts.gen.dart';
import 'package:tether_pet_owner/src/common_widgets/common_text_field.dart';
import 'package:tether_pet_owner/src/constants/app_sizes.dart';
import 'package:tether_pet_owner/src/theme/config_colors.dart';
import 'package:tether_pet_owner/src/theme/text.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key});
  static MaterialPageRoute<MessageScreen> route() {
    return MaterialPageRoute<MessageScreen>(
      builder: (BuildContext context) => MessageScreen(),
    );
  }

  List<Map<String, dynamic>> chatMessages = [
    {
      'messageType': MessageType.send,
      'message':
          'Diana Won’t stop itching... and it looks like she’s covered in dirt?!',
      'image': Assets.dog1.path,
      'isSeen': true,
      'msgTime': '1:24am',
    },
    {
      'messageType': MessageType.receive,
      'message':
          'Poor Diana! it sounds like she may have fleas. Let’s do a quick video call to confirm so we can start her on a treatment!',
      'image': Assets.doctor2.path,
      'msgTime': '1:25am',
      'isSeen': false,
    },
    {
      'messageType': MessageType.send,
      'message':
          'Really appreciate your help. Diana is my first cat and I don’t even know where to begin. Calling you now!',
      'image': Assets.dog1.path,
      'isSeen': false,
      'msgTime': '1:27am',
    },
    {
      'messageType': MessageType.receive,
      'message': 'see you soon!',
      'image': Assets.doctor2.path,
      'isSeen': false,
      'msgTime': '1:28am',
    },
    {
      'messageType': MessageType.send,
      'message': 'Thankyou',
      'image': Assets.dog1.path,
      'isSeen': false,
      'msgTime': '1:29am',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.transparent,
          leadingWidth: 30,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: ConfigColors.black,
            ),
          ),
          title: ListTile(
            leading: CircleAvatar(
              radius: 22,
              backgroundColor: ConfigColors.blueGrey,
              child: AppText.paragraphI14(
                'OL',
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade100,
              ),
            ),
            title: const AppText.paragraphI14(
              'Dr. Olivia, DVM ',
              color: ConfigColors.black,
              fontWeight: FontWeight.w700,
            ),
            subtitle: const AppText.paragraphI12(
              'Active',
              color: ConfigColors.textGreen,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: chatMessages.length + 1,
        //    padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: Center(
                child: AppText.paragraphI12(
                  'Conversation Started with Dr. Olivia, DVM ',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            );
          }
          Map<String, dynamic> messageData = chatMessages[index - 1];
          return ChatSample(
            image: '${messageData['image']}',
            messageType: messageData['messageType'] as MessageType,
            message: '${messageData['message']}',
            msgTime: '${messageData['msgTime']}',
            isSeen: messageData['isSeen'] as bool,
          );
        },
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CommonTextField(
          hintText: 'Type here...',
          showBorder: true,
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.send,
            ),
          ),
        ),
      ),
    );
  }
}

class ChatSample extends StatelessWidget {
  const ChatSample({
    required this.messageType,
    required this.image,
    required this.message,
    required this.msgTime,
    this.isSeen,
    super.key,
  });
  final MessageType messageType;
  final String message;
  final String image;
  final String msgTime;
  final bool? isSeen;

  @override
  @override
  Widget build(BuildContext context) {
    if (MessageType.receive == messageType) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: BubbleSpecialOne(
                    text: message,
                    tail: false,
                    color: ConfigColors.blueGrey,
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontFamily: FontFamily.inter,
                      color: ConfigColors.black,
                    ),
                  ),
                ),
                gapW8,
                CircleAvatar(
                  radius: 21,
                  backgroundImage: AssetImage(image),
                ),
              ],
            ),
            gapH4,
            Row(
              children: [
                gapW24,
                AppText.paragraphI12(
                  msgTime,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    radius: 21,
                    backgroundImage: AssetImage(image),
                  ),
                ),
                gapW8,
                BubbleSpecialOne(
                  text: message,
                  tail: false,
                  color: ConfigColors.primary,
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontFamily: FontFamily.inter,
                    color: ConfigColors.white,
                  ),
                ),
              ],
            ),
            gapH4,
            Row(
              children: [
                const Spacer(),
                AppText.paragraphI12(
                  msgTime,
                  fontWeight: FontWeight.w400,
                ),
                gapW20,
                Assets.seenIcon.svg(
                  color: isSeen == true ? ConfigColors.primary : null,
                ),
                gapW4,
                const AppText.paragraphI12(
                  'seen',
                  fontWeight: FontWeight.w400,
                ),
                gapW24,
              ],
            ),
          ],
        ),
      );
    }
  }
}
