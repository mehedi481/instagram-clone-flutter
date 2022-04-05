import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/providers/user_provider.dart';
import 'package:instagram_clone_flutter/utils/colors.dart';
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int currentPageIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      currentPageIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final _user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Center(child: Text("Home")),
          Center(child: Text("search")),
          Center(child: Text("add")),
          Center(child: Text("fav")),
          Center(child: Text("person")),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: secondaryColor,
        backgroundColor: mobileBackgroundColor,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
