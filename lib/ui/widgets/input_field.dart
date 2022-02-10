import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_do/ui/theme.dart';
import 'package:time_do/services/theme_services.dart';

class InputField extends StatefulWidget {
  const InputField(
      {Key? key,
      required this.label,
      this.controller,
      this.icondata,
      required this.hint,
      this.widget,
      required this.iconOrdrop,
      required this.isEnabled})
      : super(key: key);
  final String label;
  final TextEditingController? controller;
  final IconData? icondata;
  final String hint;
  final String iconOrdrop;
  final Widget? widget;
  final bool isEnabled;

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
              color: Get.isDarkMode ? Colors.white : darkGreyClr,
              fontWeight: FontWeight.bold,
              fontSize: 17),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          readOnly: !widget.isEnabled,
          controller: widget.controller,
          validator: (value) {
            if (value.toString().isEmpty) {
              return 'Please Enter ${widget.label}';
            }
          },
          cursorColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          style: TextStyle(color: Get.isDarkMode ? Colors.white : darkGreyClr),
          decoration: InputDecoration(
            suffixIcon: widget.iconOrdrop == 'icon'
                ? Icon(
                    widget.icondata,
                    color: Get.isDarkMode ? Colors.white : Colors.grey,
                  )
                : Container(margin: EdgeInsets.only(right: 10), child: widget.widget),
            hintText: widget.hint,
            hintStyle:
                TextStyle(color: Get.isDarkMode ? Colors.white70 : Colors.grey),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1,
                    color: Get.isDarkMode ? Colors.white70 : primaryClr),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1,
                  color: Get.isDarkMode ? Colors.white70 : primaryClr),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
