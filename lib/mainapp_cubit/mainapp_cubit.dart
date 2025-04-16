import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:terrawalls/presentations/about/about_screen.dart';

import '../presentations/search/search_screen.dart';
import '../presentations/search/widgets/search_image_view_widget.dart';

part 'mainapp_state.dart';

class MainappCubit extends Cubit<MainappState> {
  MainappCubit() : super(MainappInitial());

  int selectedIndex = 0;
  List<Widget> screens = [
    ImagesViewWidget(description: "Trending"),
    SearchViewWidget(),
    AboutScreen(),
  ];

  void changeIndexBottonBar({required int newIndex}) {
    selectedIndex = newIndex;
    emit(MainappChanged());
  }

  Widget getScreenBottomBar() {
    return screens[selectedIndex];
  }
}
