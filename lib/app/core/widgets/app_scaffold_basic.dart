import 'package:basic/app/onboarding/widgets/onboarding_drawer_widget/onboarding_drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class AppScaffoldBasic extends StatelessWidget {
  final Widget? body;
  final Widget? appBarTitle;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Widget? appBarActionButton;
  final TabBar? bottom;
  final Size? appBarHeight;



  AppScaffoldBasic({this.body, this.appBarTitle, this.bottomNavigationBar, this.floatingActionButton, this.appBarActionButton, this.bottom, this.appBarHeight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      appBar: PreferredSize(
          preferredSize: appBarHeight ?? const Size.fromHeight(50),
          child: AppBar(
            backgroundColor: AppColors.dark,
            title: appBarTitle,
            centerTitle: true,
            iconTheme: const IconThemeData(color: AppColors.grey3),
            bottom: bottom,
            actions: [
              appBarActionButton ?? SizedBox()
            ],
          )
      ),
      // drawer: OnboardingDrawerWidget(),
      body: body,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
