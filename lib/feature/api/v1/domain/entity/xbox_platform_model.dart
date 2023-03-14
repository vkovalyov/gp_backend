class PlatformModel {
  final String platform;
  final String metacriticScore;

  PlatformModel({
    required this.platform,
    required this.metacriticScore,
  });

  List<Object?> get props => [
        platform,
        metacriticScore,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'platform': platform,
      'metacriticScore': metacriticScore,
    };
  }
}
