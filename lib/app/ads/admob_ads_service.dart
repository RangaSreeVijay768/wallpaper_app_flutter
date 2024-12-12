import 'package:basic/app/core/logger/log.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobAdsService {
  static initialize() {
    // Set the test device IDs before initializing AdMob
    // MobileAds.instance.updateRequestConfiguration(
    //   RequestConfiguration(
    //     testDeviceIds: ['175019D3F69AD092604540AA30B45E86'], // Your test device ID
    //   ),
    // );

    // Initialize AdMob
    MobileAds.instance.initialize().then((InitializationStatus status) {
      logger.d('AdMob initialized: ${status.adapterStatuses}');
    });
  }
}
