import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times_app/app/styles/colors.dart';

import '../domain/usecase/ny_times_use_case/ny_times_usecase.dart';
import '../presentation/view_model/ny_times_bloc.dart';
import '../presentation/views/ny_times_home_screen/ny_times_home_screen.dart';
import 'get_di/di.dart';

class NyTimesApp extends StatelessWidget {
  const NyTimesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NyTimesBloc(nyTimesUseCase: AppModule.instance<NyTimesUseCase>())
            ..add(const FetchNyNewsEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: AppBarTheme(
              centerTitle: true,
              color: AppColors.appBarColor,
              shadowColor: AppColors.greyColor.withOpacity(0.4),
              elevation: 4.0),
        ),
        home: const NyTimesHomeScreen(),
      ),
    );
  }
}
