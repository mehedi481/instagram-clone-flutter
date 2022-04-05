import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/providers/user_provider.dart';
import 'package:instagram_clone_flutter/utils/global_variable.dart';
import 'package:provider/provider.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreen;
  final Widget mobileScreen;
  const ResponsiveLayout(
      {Key? key, required this.webScreen, required this.mobileScreen})
      : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    final _userProvider =
        Provider.of<UserProvider>(context, listen: false);
     await _userProvider.refreshUer();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        // Web screen
        return widget.webScreen;
      }
      // Mobile screen
      return widget.mobileScreen;
    }));
  }
}
