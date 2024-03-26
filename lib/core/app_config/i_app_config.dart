import 'package:algo_viz/constants/constants.dart';

part 'dev_app_config.dart';
part 'prod_app_config.dart';

IAppConfig appConfig = const DevAppConfig();

sealed class IAppConfig {
  factory IAppConfig.init(Env env) {
    return switch (env) {
      Env.dev => const DevAppConfig(),
      Env.prod => const ProdAppConfig(),
    };
  }
  Env get env;

  String get appName;
}
