import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ny_times_app/app/styles/colors.dart';
import 'package:ny_times_app/presentation/components/text_component/reusable_text.dart';

AppBar buildAppBarForNyNewsScreen() => AppBar(
      leading: const Icon(
        Icons.menu,
        color: AppColors.whiteColor,
        size: 30.0,
      ),
      title: const ReusableTextWidget(
        text: 'Ny Times Most Popular',
        textStyle: TextStyle(
          fontSize: 20.0,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: const [
        Icon(
          Icons.search,
          color: AppColors.whiteColor,
          size: 26.0,
        ),
        SizedBox(width: 10.0),
        Icon(
          CupertinoIcons.ellipsis_vertical,
          color: AppColors.whiteColor,
          size: 26.0,
        ),
        SizedBox(width: 5.0),
      ],
    );

AppBar buildAppBarForNyNewsDetailsScreen(BuildContext context) => AppBar(
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.whiteColor,
          size: 30.0,
        ),
      ),
      title: const ReusableTextWidget(
        text: 'Ny Times Most Popular',
        textStyle: TextStyle(
          fontSize: 20.0,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
