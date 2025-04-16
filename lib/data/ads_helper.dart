import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsHelper {
  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;
  int maxFailedLoadAttempts = 7;

  final adUnitId =
      Platform.isAndroid
          ? 'ca-app-pub-6583475060576073/4068795416'
          : 'ca-app-pub-6583475060576073/8078885706';

  Future<void> createInterstitialAd() async {
    await InterstitialAd.load(
      adUnitId: adUnitId,

      request: const AdRequest(),

      // request: request,
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          if (kDebugMode) {
            print('$ad loaded');
          }
          _interstitialAd = ad;
          _numInterstitialLoadAttempts = 0;
          _interstitialAd!.setImmersiveMode(true);
          _interstitialAd!.show();
          // showInterstitialAd();
        },
        onAdFailedToLoad: (LoadAdError error) {
          if (kDebugMode) {
            print('InterstitialAd failed to load: $error.');
          }
          _numInterstitialLoadAttempts += 1;
          _interstitialAd = null;
          if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
            createInterstitialAd();
          }
        },
      ),
    );
  }

  // void showInterstitialAd() {
  //   if (_interstitialAd != null) {
  //     _interstitialAd?.show();
  //     _interstitialAd?.dispose();
  //     _interstitialAd = null;
  //   } else {
  //     print('Interstitial ad not ready');
  //   }
  // }
}
