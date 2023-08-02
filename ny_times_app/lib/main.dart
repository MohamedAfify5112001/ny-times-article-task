import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times_app/app/bloc_observer/simple_bloc_observer.dart';
import 'package:ny_times_app/data/network/dio_helper.dart';

import 'app/app.dart';
import 'app/get_di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    DioHelper.initMyDio(),
    AppModule.initAppModule(),
  ]);
  Bloc.observer = BlocAppObserver();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark
  ));
  runApp(const NyTimesApp());
}
