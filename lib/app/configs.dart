class AppConfig {
  final bool isDebug;

  const AppConfig({required this.isDebug});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'isDebug': isDebug,
    };
  }

  factory AppConfig.fromJson(Map<String, dynamic> map) {
    return AppConfig(
      isDebug: map['isDebug'] as bool,
    );
  }
}

const defaultConfig = AppConfig(isDebug: true);
