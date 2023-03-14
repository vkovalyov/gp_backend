class LanguageSupport {
  final String keyLanguage;
  final int interfaceLanguageSupport;
  final int gamePlayAudioLanguageSupport;
  final int subtitlesLanguageSupport;

  LanguageSupport({
    required this.keyLanguage,
    required this.interfaceLanguageSupport,
    required this.gamePlayAudioLanguageSupport,
    required this.subtitlesLanguageSupport,
  });

  factory LanguageSupport.fromJson(
      Map<String, dynamic> json, String keyLanguage) {
    return LanguageSupport(
      keyLanguage: keyLanguage,
      interfaceLanguageSupport: json["InterfaceLanguageSupport"],
      gamePlayAudioLanguageSupport: json["GamePlayAudioLanguageSupport"],
      subtitlesLanguageSupport: json["SubtitlesLanguageSupport"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['keyLanguage'] = this.keyLanguage;
    data['interfaceLanguageSupport'] = this.interfaceLanguageSupport;

    data['gamePlayAudioLanguageSupport'] = this.gamePlayAudioLanguageSupport;
    data['subtitlesLanguageSupport'] = this.subtitlesLanguageSupport;

    return data;
  }
}
