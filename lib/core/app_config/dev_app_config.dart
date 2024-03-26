part of 'i_app_config.dart';

final class DevAppConfig implements IAppConfig {
  const DevAppConfig();

  @override
  Env get env => Env.dev;

  @override
  String get appName => 'Algo Viz Dev';
}
