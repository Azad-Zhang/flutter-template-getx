enum Flavor {
  dev,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return '模板Dev';
      case Flavor.prod:
        return '模板';
      default:
        return 'title';
    }
  }

}
