import 'package:get/state_manager.dart';
import 'package:random_app/models/feature_model.dart';
import 'package:random_app/screens/random_number_page.dart';

class FeatureController extends GetxController {
  List<Feature> features = <Feature>[
    Feature(name: 'foo', image: 'foo', route: RandomNumberPage.route),
    Feature(name: 'foo', image: 'foo', route: ''),
  ].obs;

  getFeatures() => features;
}
