import 'package:bumblebee/blocc/bottom_nav_cubit.dart';
import 'package:bumblebee/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  ///widget ထဲကနေကို ယူသုံးပြီးတော့ page တစ်ခုနဲ့တစ်ခုကို အကူးအပြောင်းကို လုပ်ပေးထားတာ
  final List<Widget> topLevelPage = const [
    HomePage(),
    FavoritePage(),
    NotificationsPage(),
    ProfilePage(),
  ];

  //page တစ်ခုနဲ့တစ်ခုကို ချိန်းဖို့အတွက်ကို bloc ကိုသုံးထားတာ
  void onPageChage(int page) {
    BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 2, 2),
      appBar: _mainWrapperAppBar(),
      body: _mainWrapperBody(),
      bottomNavigationBar: _mainWrapperBottomNavBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: _mainWrapperFab(),
      ),
    );
  }

  ///bottom nav အပိုင်းမှာကို ဘာတွေ ပြပေးခြင်းတာ လုပ်ပေးထားတဲ့အပိုင်း
  BottomAppBar _mainWrapperBottomNavBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.blueGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _bottomAppBarItem(
                  context,
                  defaultIcon: IconlyLight.home,
                  page: 0,
                  label: "Home",
                  filledIcon: IconlyBold.heart,
                ),
                _bottomAppBarItem(
                  context,
                  defaultIcon: IconlyLight.heart,
                  page: 1,
                  label: "Favourite",
                  filledIcon: IconlyBold.heart,
                ),
                _bottomAppBarItem(
                  context,
                  defaultIcon: IconlyLight.notification,
                  page: 2,
                  label: "Notifs",
                  filledIcon: IconlyBold.notification,
                ),
                _bottomAppBarItem(
                  context,
                  defaultIcon: IconlyLight.profile,
                  page: 3,
                  label: "Profile",
                  filledIcon: IconlyBold.profile,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///flocation action button အပိုင်းမှာကို post method နဲ့ကို တင်လိုက်မည်ဆို ဖြစ်လာမည့်အပိုင်း
  FloatingActionButton _mainWrapperFab() {
    return FloatingActionButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Color.fromARGB(255, 7, 7, 7),
            content: Text("New post will generate in upcoming 2 mins 📮"),
          ),
        );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      backgroundColor: Colors.amber,
      child: const Icon(Icons.add),
    );
  }

  ///app bar မှာကို အခုလောလောဆယ်ကိုတော့ စာကိုပဲဲ ပေါ်အောင်ကိုပဲ လုပ်ထားတယ်
  AppBar _mainWrapperAppBar() {
    return AppBar(
      backgroundColor: Colors.grey,
      title: Text("Bottom Navigation Bar with Bloc"),
    );
  }

  ///body အပိုင်းမှာကို ဘာကိုဖြစ်ခြင်းလို့ page တစ်ခုကို နှိပ်လိုက်တာနဲ့ ဘာတွေပေါ်လာစေခြင်းတာလဲ ဆိုတာကို ပြပေးမည့်အပိုင်း
  PageView _mainWrapperBody() {
    return PageView(
      onPageChanged: (int page) => onPageChage(page),
      controller: pageController,
      children: topLevelPage,
    );
  }

  /// Bottom ခလုတ်တစ်ခုနှိပ်လိုက်ရင်ကို ဘယ်လိုမျိုးကို ဖြစ်သွားမည်ဆိုတာကို လုပ်ပေးထားတဲ့ အပိုင်းဖြစ်တယ်
  Widget _bottomAppBarItem(
    BuildContext context, {
    required defaultIcon,
    required page,
    required label,
    required filledIcon,
  }) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(page);

        pageController.animateToPage(page,
            duration: const Duration(milliseconds: 10),
            curve: Curves.fastLinearToSlowEaseIn);
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            Icon(
              context.watch<BottomNavCubit>().state == page
                  ? filledIcon
                  : defaultIcon,
              color: context.watch<BottomNavCubit>().state == page
                  ? Colors.grey
                  : Colors.grey,
              size: 26,
            ),
            Text(
              label,
              style: GoogleFonts.aBeeZee(
                color: context.watch<BottomNavCubit>().state == page
                    ? Colors.amber
                    : Colors.grey,
                fontSize: 13,
                fontWeight: context.watch<BottomNavCubit>().state == page
                    ? FontWeight.w600
                    : FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
