class NetworkConfig {
  String baseUrl = 'https://api.ulearna.com';
  String headerLanguage = 'en';
  bool isMock = false;
  factory NetworkConfig() {
    return _singleton;
  }
  NetworkConfig._internal();

  static final NetworkConfig _singleton = NetworkConfig._internal();

  setBaseUrl(String value) {
    baseUrl = value;
  }
}
