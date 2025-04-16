import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terrawalls/mainapp_cubit/mainapp_cubit.dart';
import 'dart:math' as math;

import '../../data/items.dart';
import '../../image_cubit/images_cubit.dart';
import '../components/appbar_widget.dart';
import '../components/bottom_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /////////////
    ///
    ///
    ///
    BlocProvider.of<ImagesCubit>(context).data.isEmpty
        ? BlocProvider.of<ImagesCubit>(context).getImages()
        : BlocProvider.of<ImagesCubit>(context).getImages(query:items[math.Random().nextInt(items.length)]);

    ///
    ///
    ///
    ///
    /////////////
    return BlocBuilder<MainappCubit, MainappState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: getMainAppBar(),
          body: RefreshIndicator(
            backgroundColor: Colors.black,
            color: Colors.white,
            onRefresh: () async {
              return context.read<ImagesCubit>().getImages();
            },
            child: context.read<MainappCubit>().getScreenBottomBar(),
          ),
          bottomNavigationBar: DockingBar(),
        );
      },
    );
  }
}
