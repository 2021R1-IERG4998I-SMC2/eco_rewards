import 'package:get_it/get_it.dart';
import 'package:fluro/fluro.dart';
import 'package:shared_preferences/shared_preferences.dart';

final services = GetIt.instance;

class Services {
  static void setup() {
    services
      ..registerSingletonAsync(
        () async => SharedPreferences.getInstance(),
      )
      ..registerSingleton(FluroRouter());
  }
}
