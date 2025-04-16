import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:terrawalls/mainapp_cubit/mainapp_cubit.dart';

import 'image_cubit/images_cubit.dart';
import 'presentations/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ImagesCubit()),
        BlocProvider(create: (context) => MainappCubit()),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: MainScreen()),
    );
  }
}
