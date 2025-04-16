import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terrawalls/mainapp_cubit/mainapp_cubit.dart';

class DockingBar extends StatelessWidget {
  const DockingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      currentIndex: context.read<MainappCubit>().selectedIndex,
      onTap: (value) {
        context.read<MainappCubit>().changeIndexBottonBar(newIndex: value);
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_vert_outlined),
          label: 'More',
        ),
      ],
    );
  }
}
