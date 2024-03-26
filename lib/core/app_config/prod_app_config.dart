part of 'i_app_config.dart';

final class ProdAppConfig implements IAppConfig {
  const ProdAppConfig();

  @override
  Env get env => Env.prod;

  @override
  String get appName => 'Algo Viz';
}
