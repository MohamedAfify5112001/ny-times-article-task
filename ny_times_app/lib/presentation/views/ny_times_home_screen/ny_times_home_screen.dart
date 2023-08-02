import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times_app/app/styles/colors.dart';
import 'package:ny_times_app/presentation/components/text_component/reusable_text.dart';
import 'package:ny_times_app/presentation/view_model/ny_times_bloc.dart';
import 'package:ny_times_app/presentation/views/ny_times_home_screen/ny_times_item_widget.dart';

import '../../components/app_bar/app_bar_widget.dart';

class NyTimesHomeScreen extends StatelessWidget {
  const NyTimesHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NyTimesBloc, NyTimesState>(
      builder: (context, nyTimeState) {
        switch (nyTimeState.nyNewsStatus) {
          case NyTimesStatus.failure:
            return const Scaffold(
              body: Center(
                child: ReusableTextWidget(
                  text: 'failed to fetch Ny Times Article',
                  textStyle: TextStyle(fontSize: 22.0),
                ),
              ),
            );
          case NyTimesStatus.initial:
          case NyTimesStatus.loading:
            return const Scaffold(
              body: Center(
                child: RepaintBoundary(
                  child: CircularProgressIndicator(
                    color: AppColors.appBarColor,
                  ),
                ),
              ),
            );
          case NyTimesStatus.success:
            final nyTimesItems = nyTimeState.nyNewsItems;
            return Scaffold(
              appBar: buildAppBarForNyNewsScreen(),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 14.0),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      NyTimesItemWidget(nyTimeItem: nyTimesItems[index]),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 25,
                  ),
                  itemCount: nyTimesItems.length,
                ),
              ),
            );
        }
      },
    );
  }
}
