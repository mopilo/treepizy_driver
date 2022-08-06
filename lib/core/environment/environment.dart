enum Environment { development, staging, qa, production }

class Env {
  // Env();
  static Environment environment = Environment.staging;
  static const initial = "http://3.145.142.121";
  static const String staging =
      'http://3.145.142.121/treepizy/public/index.php/api/';
  static const String live = "";

  static final coreBaseUrl =
      environment == Environment.production ? live : staging;
}
