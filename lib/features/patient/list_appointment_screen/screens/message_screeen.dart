import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';

import '../../../../common/widgets/pop_up_men.dart';
import '../../../../constants/app_color.dart';
import '../../../../routes/route_name.dart';
import '../widgets/audio_mess.dart';
import '../widgets/picture_mess.dart';
import '../widgets/recieve_card.dart';
import '../widgets/send_card.dart';

class MessageScreen extends StatefulWidget {
  MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController messController = TextEditingController();
  FocusNode _focus = FocusNode();
  List<Map<String, dynamic>> listMess = [
    {
      'title': 'Hi Team, I just mode the latest wireform update please check',
      'rs': 0,
      'typeMess': 0,
      'date': DateTime.now(),
    },
    {
      'title': 'Wow. I have checked your work. I like it very much ',
      'rs': 1,
      'typeMess': 0,
      'date': DateTime.now(),
    },
    {
      'title': 'Ok let\'t do it',
      'rs': 1,
      'typeMess': 0,
      'date': DateTime.now(),
    },
    {
      'title': 'Hahahahaha it\'t so funny',
      'rs': 0,
      'typeMess': 0,
      'date': DateTime.now(),
    },
    {
      'title': 'Let\'t meet tomrrow',
      'rs': 1,
      'typeMess': 0,
      'date': DateTime.now(),
    },
    {
      'title': 'We will talk about this project',
      'rs': 1,
      'typeMess': 0,
      'date': DateTime.now(),
    }
  ];
  List<String> listImageMesss = [
    // "assets/images/doctor1.png",
    "assets/images/doctor2.png",
    "assets/images/doctor3.png",
  ];
  @override
  void initState() {
    super.initState();
    _focus.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroudColor,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back, color: AppColors.textColor),
        ),
        title: const Text(
          'Dr.Draken Boeston',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          InkWell(
            onTap: () async {},
            child: const Icon(Icons.search, color: AppColors.textColor),
          ),
          // const SizedBox(width: 5),
          PopUpMen(
            menuList: const [
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(
                    CupertinoIcons.trash,
                  ),
                  title: Text("Clear Chat", style: TextStyle(fontSize: 14)),
                ),
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(
                    CupertinoIcons.cloud_download,
                  ),
                  title: Text("Export Chat", style: TextStyle(fontSize: 14)),
                ),
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(
                    CupertinoIcons.trash,
                    color: Colors.red,
                  ),
                  title: Text("Delete Chat",
                      style: TextStyle(color: Colors.red, fontSize: 14)),
                ),
              ),
            ],
            icon: Container(
              padding: const EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: AppColors.textColor),
                color: AppColors.backgroudColor,
              ),
              child: const Icon(
                Icons.more_horiz,
                color: AppColors.textColor,
                size: 15,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              color: AppColors.backgroudColor,
            ),
            child: ListView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: [
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.textColor1.withOpacity(0.2),
                    ),
                    child: const Text(
                      'Session Start',
                      style: TextStyle(
                        color: AppColors.textColor1,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                ...listMess.map((e) => (e['rs'] == 0)
                    ? SendCard(
                        title: e['title'],
                        typeMess: e['typeMess'],
                        time: e['date'])
                    : ReciveCard(
                        title: e['title'],
                        typeMess: e['typeMess'],
                        time: e['date'])),
                PictureMess(mess: listImageMesss, type: 0),
                // PictureMess(mess: listImageMesss, type: 1),
                AudioMess(time: DateTime.now()),
                const SizedBox(height: 80),
              ],
            ),
          ),
          _inputField()
        ],
      ),
    );
  }

  Align _inputField() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 70,
        color: AppColors.backgroudColor,
        // color: Colors.white,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _focus.hasFocus
                        ? AppColors.primaryColor.withOpacity(0.2)
                        : AppColors.textColor1.withOpacity(0.1),
                    border: Border.all(
                      width: 1,
                      color: _focus.hasFocus
                          ? AppColors.primaryColor
                          : AppColors.textColor1.withOpacity(0.1),
                    )),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          focusNode: _focus,
                          controller: messController,
                          style: const TextStyle(
                            color: AppColors.textColor,
                            fontSize: 15,
                          ),
                          autocorrect: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type Message',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: _focus.hasFocus
                                  ? AppColors.primaryColor
                                  : AppColors.textColor1,
                              // fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => _dialogChooseFile(context));
                      },
                      child: SvgPicture.asset(
                        'assets/icons/Camera.svg',
                        color: _focus.hasFocus
                            ? AppColors.primaryColor
                            : AppColors.textColor1.withOpacity(0.7),
                        height: 25,
                        width: 25,
                      ),
                    ),
                    const SizedBox(width: 3),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: () => Get.toNamed(RouteNames.successfulScreen),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: AppColors.primaryColor, shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      'assets/icons/send.svg',
                      color: Colors.white,
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Dialog _dialogChooseFile(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: double.infinity,
        height: MediaQuery.of(context).size.width * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: AppColors.backgroudColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/audio.svg',
                        color: Colors.white,
                        height: 30,
                        width: 30,
                      ),
                    ),
                    const Text(
                      'Audio',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green.withOpacity(0.7),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/Document.svg',
                        color: Colors.white,
                        height: 30,
                        width: 30,
                      ),
                    ),
                    const Text(
                      'Document',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red.withOpacity(0.7),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/gallery.svg',
                        color: Colors.white,
                        height: 30,
                        width: 30,
                      ),
                    ),
                    const Text(
                      'Gallery',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
