enum Flavor { dev, prod }

class FlavorValues {
  FlavorValues({required this.stagesURLs});

  final Map<Flavor, String> stagesURLs;
}

class FlavorConfig {
  final String? name;
  final Flavor? flavor;
  final FlavorValues values;

  static FlavorConfig? _instance;

  factory FlavorConfig({required Flavor flavor, required FlavorValues values}) {
    return _instance ??= FlavorConfig._internal(flavor, StringUtils.enumName(flavor.toString()), values);
  }

  FlavorConfig._internal(this.flavor, this.name, this.values);

  static FlavorConfig? get instance {
    return _instance;
  }

  static bool isProduction() => _instance!.flavor == Flavor.prod;

  static bool isDevelopment() => _instance!.flavor == Flavor.dev;

  static String get flavorName => _instance!.flavor.toString();

  String get baseUrl => instance!.values.stagesURLs[flavor] ?? '';

  static Flavor stringToEnum(String flavorString) {
    switch (flavorString) {
      case 'dev':
        return Flavor.dev;
      case 'prod':
        return Flavor.prod;
      default:
        return Flavor.dev;
    }
  }
}

class StringUtils {
  static String enumName(String enumToString) {
    List<String> paths = enumToString.split(".");
    return paths[paths.length - 1];
  }
}
