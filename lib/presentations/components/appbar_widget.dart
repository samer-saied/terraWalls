import 'package:flutter/material.dart';

PreferredSize getMainAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(0.0), // zero height
    child: AppBar(backgroundColor: Colors.black, elevation: 0),
  );
}
