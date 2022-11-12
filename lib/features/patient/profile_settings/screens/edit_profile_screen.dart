import 'package:clinic_manager/common/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/pop_up_men.dart';
import '../../../../constants/app_color.dart';
import '../controller/profile_setting_controller.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key});
  String? restorationId;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with RestorationMixin {
  final TextEditingController numberController = TextEditingController();
  final _controller = Get.find<ProfileSettingController>();
  final GlobalKey _draggableKey = GlobalKey();
  @override
  String? get restorationId => widget.restorationId;
  @override
  void initState() {
    super.initState();
    _controller.nameController.text = _controller.getUser().name;
    _controller.emailController.text = _controller.getUser().email;
    _controller.genderText.value = _controller.getUser().gender;
    _controller.dateBorn.value = (_controller.getUser().dateBorn);
  }
  // String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: (newDate) {
      _controller.dateBorn.value = newDate!;
    },
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(1900),
          lastDate: DateTime(2022),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  @override
  Widget build(BuildContext context) {
    numberController.text = "+11.0935703991";
    return Scaffold(
      backgroundColor: AppColors.backgroudColor,
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomButton(
            text: "Update",
            onTap: () => _controller.editProfile(context),
          )),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.textColor,
          ),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                CustomTextField1(
                  controller: _controller.nameController,
                  hintText: "Name",
                  maxLines: 1,
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: AppColors.primaryColor.withOpacity(0.15),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: Obx(
                        () => Text(
                          DateFormat()
                              .add_yMd()
                              .format(_controller.dateBorn.value),
                          style: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      )),
                      IconButton(
                          onPressed: () {
                            _restorableDatePickerRouteFuture.present();
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/Calendar.svg',
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: AppColors.primaryColor.withOpacity(0.15),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          controller: _controller.emailController,
                          decoration: const InputDecoration(
                            focusColor: AppColors.textColor1,
                            // fillColor: GlobalVariables.secondaryColor,
                            hintText: 'Email',
                            hintStyle: TextStyle(fontSize: 14),
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      SvgPicture.asset('assets/icons/Message.svg'),
                      const SizedBox(width: 10.0),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                //america
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: AppColors.primaryColor.withOpacity(0.15),
                    ),
                    child: Row(
                      children: const [
                        Expanded(
                          child: Text(
                            'United States',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                        Icon(Icons.arrow_drop_down, color: AppColors.textColor),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: AppColors.primaryColor.withOpacity(0.15),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Row(children: [
                          Image.asset('assets/images/america.png',
                              height: 30, width: 40),
                          const Icon(Icons.arrow_drop_down,
                              color: AppColors.textColor),
                        ]),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: TextFormField(
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          controller: numberController,
                          decoration: const InputDecoration(
                            focusColor: AppColors.textColor1,
                            // fillColor: GlobalVariables.secondaryColor,
                            hintText: 'Email',
                            hintStyle: TextStyle(fontSize: 14),
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: AppColors.primaryColor.withOpacity(0.15),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: Obx(
                        () => Text(
                          _controller.genderText.value,
                          style: const TextStyle(
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      )),
                      PopUpMen(
                        menuList: [
                          PopupMenuItem(
                            onTap: () => _controller.genderText.value = "Male",
                            child: const ListTile(
                              leading: Icon(Icons.male),
                              title:
                                  Text("Male", style: TextStyle(fontSize: 14)),
                            ),
                          ),
                          const PopupMenuDivider(),
                          PopupMenuItem(
                            onTap: () =>
                                _controller.genderText.value = "FeMale",
                            child: const ListTile(
                              leading: Icon(Icons.female),
                              title: Text("FeMale",
                                  style: TextStyle(fontSize: 14)),
                            ),
                          ),
                        ],
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
