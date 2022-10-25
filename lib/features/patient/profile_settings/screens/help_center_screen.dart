import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

import '../../../../constants/app_color.dart';

List<String> listTitle = ['General', 'Account', 'Service', 'Payment'];
List<String> fakeSearch = [
  'What did my payment didn\'t working?',
  'Why are  the my appointment pricese different?',
  'Where I can\'t add a new payment method?',
  'Why didn\'t I get the e-receipt after payment?',
  'What did my payment didn\'t working?',
];

List<Map<String, dynamic>> listInfo = [
  {
    'name': 'Nguyen Minh Hung',
    'id': '20120491',
  },
  {
    'name': 'Truong Huynh Duc Hoang',
    'id': '20120483',
  },
];

class HelpCenterScreen extends StatefulWidget {
  HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  FocusNode _focus = FocusNode();
  RxInt selectTop = 0.obs;
  Rx<TextEditingController> _searchController = TextEditingController().obs;
  @override
  void initState() {
    super.initState();
    _focus.addListener(() {
      setState(() {});
    });
  }

// ignore: override_on_non_overriding_member
  Widget _buildItemList(BuildContext context, int index) {
    return SizedBox(
      width: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 350,
            height: 250,
            decoration: BoxDecoration(
              color: AppColors.backgroudColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 3, color: AppColors.primaryColor),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textColor.withOpacity(0.3),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back, color: AppColors.textColor),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Text(
                  'FAQ',
                  style: TextStyle(
                      // color: AppColors.primaryColor1,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
              Tab(
                icon: Text(
                  'Contact US',
                  style: TextStyle(
                      // color: AppColors.primaryColor1,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            ],
            unselectedLabelColor: AppColors.textColor1,
            labelColor: AppColors.primaryColor1,
          ),
          title: const Text(
            'Help Center',
            style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          actions: [
            InkWell(
              onTap: () async {},
              child: const Icon(Icons.search, color: AppColors.textColor),
            ),
            const SizedBox(width: 5),
            InkWell(
              onTap: () {},
              child: const Icon(Icons.more_horiz, color: AppColors.textColor),
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: ListView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  const SizedBox(height: 20.0),
                  Obx(
                    () => SizedBox(
                      height: 30,
                      width: double.infinity,
                      child: ListView(
                        physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics(),
                        ),
                        scrollDirection: Axis.horizontal,
                        children: [
                          const SizedBox(width: 10),
                          for (int i = 0; i < listTitle.length; i++)
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () {
                                  selectTop.value = i;
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: (i == selectTop.value)
                                          ? AppColors.primaryColor
                                          : Colors.white,
                                      border: Border.all(
                                          width: 1,
                                          color: AppColors.primaryColor)),
                                  child: Text(
                                    listTitle[i],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: (i == selectTop.value)
                                          ? Colors.white
                                          : AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  _searchView(),
                  const SizedBox(height: 20.0),
                  Obx(() => _searchController.value.text != ""
                      ? Container(
                          padding: const EdgeInsets.all(20.0),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: AppColors.backgroudColor,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.textColor.withOpacity(0.2),
                                blurRadius: 10.0,
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...fakeSearch.map((e) =>
                                  e.compareTo(_searchController.value.text) >= 0
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                              Text(e),
                                              const SizedBox(height: 2),
                                              const Divider(
                                                  color: AppColors.textColor1)
                                            ])
                                      : Container())
                            ],
                          ),
                        )
                      : Container()),
                  const HelpItem(
                    mainTitle: 'What is Medica?',
                    title:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididun ut labore et dolore manga aliqua',
                  ),
                  const HelpItem(
                    mainTitle: 'How to use Medica?',
                    title:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididun ut labore et dolore manga aliqua',
                  ),
                  const HelpItem(
                    mainTitle: 'How do I cancel an appointment',
                    title:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididun ut labore et dolore manga aliqua',
                  ),
                  const HelpItem(
                    mainTitle: 'How do I save the recording ',
                    title:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididun ut labore et dolore manga aliqua',
                  ),
                  const HelpItem(
                    mainTitle: 'How do I exit the app',
                    title:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididun ut labore et dolore manga aliqua',
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: ListView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  const SizedBox(height: 100.0),
                  SizedBox(
                    height: 280,
                    width: double.infinity,
                    child: ScrollSnapList(
                      itemBuilder: _buildItemList,
                      itemSize: 350,
                      dynamicItemSize: true,
                      itemCount: 3,
                      onItemFocus: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _searchView() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      decoration: BoxDecoration(
        border: Border.all(
            width: 1,
            color: _focus.hasFocus
                ? AppColors.primaryColor
                : AppColors.textColor1.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(10),
        color: _focus.hasFocus
            ? AppColors.primaryColor.withOpacity(0.2)
            : AppColors.textColor1.withOpacity(0.1),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/Search.svg',
            color:
                _focus.hasFocus ? AppColors.primaryColor : AppColors.textColor1,
          ),
          const SizedBox(width: 10),
          Expanded(
              child: TextFormField(
            controller: _searchController.value,
            focusNode: _focus,
            onFieldSubmitted: (stringQuery) {},
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(
                color: _focus.hasFocus
                    ? AppColors.primaryColor
                    : AppColors.textColor1,
              ),
              border: InputBorder.none,
            ),
          )),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset('assets/icons/Filter.svg',
                color: AppColors.primaryColor),
          )
        ],
      ),
    );
  }
}

class HelpItem extends StatefulWidget {
  final String mainTitle;
  final String title;
  const HelpItem({
    Key? key,
    required this.mainTitle,
    required this.title,
  }) : super(key: key);

  @override
  State<HelpItem> createState() => _HelpItemState();
}

class _HelpItemState extends State<HelpItem> {
  @override
  double _height = 0;
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      padding: const EdgeInsets.all(20.0),
      height: _height + 65,
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        color: AppColors.backgroudColor,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.textColor.withOpacity(0.2),
            blurRadius: 10.0,
          )
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(children: [
              Expanded(
                child: Text(
                  widget.mainTitle,
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                onTap: () => setState(() {
                  _height = (_height - 130).abs();
                }),
                child: const Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.primaryColor1,
                  size: 25.0,
                ),
              ),
            ]),
            const SizedBox(height: 10.0),
            const Divider(color: AppColors.textColor1),
            const SizedBox(height: 10.0),
            Text(
              widget.title,
            ),
          ],
        ),
      ),
    );
  }
}
