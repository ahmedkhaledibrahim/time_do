import 'package:flutter/material.dart';
import 'package:time_do/services/theme_services.dart';
import 'package:get/get.dart';
import '../theme.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key, this.leadingWidget}) : super(key: key);
  final Widget? leadingWidget;
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      leading: leadingWidget,
      actions: [
        IconButton(
          onPressed: () {
            ThemeServices().switchTheme();
          },
          icon: Icon(
            Get.isDarkMode
                ? Icons.wb_sunny_outlined
                : Icons.nightlight_round_outlined,
          ),
          color: Get.isDarkMode ? Colors.white : darkGreyClr,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
