import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gal/gal.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

Future<void> downloadImage(
  BuildContext context,
  String imageUrl, {
  String? fileName,
  Function(double)? onProgress, // Callback for progress updates
}) async {
  try {
    //Save to gallery
    final imagePath = '${Directory.systemTemp.path}/image.jpg';
    File file = File(imagePath);
    var request = await http.Client().send(
      http.Request('GET', Uri.parse(imageUrl)),
    );
    var totalBytes = request.contentLength ?? 0;
    var bytesDownloaded = 0;

    var sink = file.openWrite();
    var responseStream = request.stream;

    await for (var chunk in responseStream) {
      bytesDownloaded += chunk.length;
      sink.add(chunk);

      //   // Calculate progress percentage
      double progress = (bytesDownloaded / totalBytes) * 100;
      if (onProgress != null) {
        onProgress(progress);
      }
    }
    await Gal.putImage(file.path);
    Alert(
      style: alertStyle,
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          width: 120,
          child: const Text(
            "Done",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
      // ignore: use_build_context_synchronously
      context: context,
      type: AlertType.success,
      title: "Success",
      desc: "Image saved to gallery",
    ).show();
  } catch (e) {
    debugPrint('Error downloading image: $e');
      Alert(
        style: alertStyle,
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            width: 120,
            child: const Text(
              "Done",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
        // ignore: use_build_context_synchronously
        context: context,
        type: AlertType.error,
        title: "Failed",
        desc: "Sorry, something went wrong",
      ).show();
  }
}

AlertStyle alertStyle = AlertStyle(
  backgroundColor: Colors.black,
  titleStyle: TextStyle(color: Colors.white),
  descStyle: TextStyle(color: Colors.white),
);
