import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_prac/res/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton({super.key, required this.title, this.loading = false, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration:  BoxDecoration(
          color: AppColors.kbuttonColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: loading ? CircularProgressIndicator(color: Colors.white,):
        Text('As',style: TextStyle(color: AppColors.whiteColor),)),
      ),
    );
  }
}
