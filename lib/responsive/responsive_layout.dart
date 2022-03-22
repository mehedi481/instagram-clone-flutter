import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/utils/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreen;
  final Widget mobileScreen;
  const ResponsiveLayout(
      {Key? key, required this.webScreen, required this.mobileScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        // Web screen
        return webScreen;
      }
      // Mobile screen
      return mobileScreen;
    }));
  }
}
