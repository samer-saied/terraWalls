import 'package:flutter/material.dart';
import 'package:terrawalls/models/photo_model.dart';
import 'package:terrawalls/presentations/components/loading_circle_widget.dart';

import '../../data/ads_helper.dart';
import '../../data/download_image.dart';
import '../../utils/format_date.dart';
import '../components/appbar_widget.dart';

class DetailsScreen extends StatefulWidget {
  final UnsplashPhoto image;
  const DetailsScreen({super.key, required this.image});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  double downloadProgress = 0;
  AdsHelper adsHelper = AdsHelper();
  bool isPreview = true;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height * 0.85;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getMainAppBar(),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(parent: BouncingScrollPhysics()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///////////////////////   Main Image Section with Download Button and Back Button   ////////////////////////
              Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    width: MediaQuery.of(context).size.width,
                    constraints: BoxConstraints(
                      maxHeight: screenHeight,
                      maxWidth: MediaQuery.of(context).size.width,
                    ),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.withValues(alpha: 0.2),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: InteractiveViewer(
                      maxScale: 5,

                      child: Image.network(
                        widget.image.urls.regular,
                        height: screenHeight,
                        width:
                            MediaQuery.orientationOf(context) ==
                                    Orientation.landscape
                                ? MediaQuery.of(context).size.width
                                : null,
                        fit: isPreview ? BoxFit.cover : BoxFit.fitWidth,
                      ),
                    ),
                  ),

                  ///////////////////////   Download Button   ////////////////////////
                  Positioned(
                    right: 15,
                    top: 20,
                    child: Row(
                      children: [
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.lightBlue.withValues(
                              alpha: 0.5,
                            ),
                          ),

                          focusColor: Colors.blue,

                          onPressed: () {
                            setState(() {
                              isPreview = !isPreview;
                            });
                          },
                          icon: Icon(
                            isPreview
                                ? Icons.crop_original
                                : Icons.zoom_out_map_outlined,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),

                        CircularLoadingWithIcon(
                          value: downloadProgress / 100,
                          size: 50,
                          strokeWidth: 3,
                          backgroundColor: Colors.teal.withValues(alpha: 0.5),
                          progressColor: Colors.white,
                          icon:
                              downloadProgress == 100
                                  ? Icons.done
                                  : Icons.download,
                          iconColor: Colors.white,
                          iconSize: 30,
                          onTap: () async {
                            await adsHelper.createInterstitialAd();
                            // .then((val) async {
                            await downloadImage(
                              // ignore: use_build_context_synchronously
                              context,
                              widget.image.urls.raw,
                              onProgress: (progress) {
                                setState(() {
                                  downloadProgress = progress;
                                });
                              },
                            );

                            // });
                          },
                        ),
                      ],
                    ),
                  ),

                  ///////////////////////    Back Button   ////////////////////////
                  Positioned(
                    left: 10,
                    top: 20,
                    child: IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.grey.withValues(alpha: 0.5),
                      ),

                      focusColor: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
              ///////////////////////   Description of Image Section    ////////////////////////
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.image.description!.isEmpty
                          ? "${widget.image.slug.split('-')}".toUpperCase()
                          : widget.image.description.toString().toUpperCase(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      formatHumanReadableDate(
                        widget.image.createdAt.toString(),
                      ),
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Text(
                      widget.image.slug.split('-').join(' '),

                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Photo by : ${widget.image.user.name}",
                      style: TextStyle(color: Colors.grey),
                    ),
                    // AnimatedShadowButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
