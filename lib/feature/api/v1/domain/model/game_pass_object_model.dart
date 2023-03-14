class GamePassObjectModel {
  final String? id;

  const GamePassObjectModel({this.id});

  @override
  List<Object?> get props => [id];

  @override
  Map<String, dynamic> toJson() {
    return {'id': id};
  }

  factory GamePassObjectModel.fromJson(Map<String, dynamic> map) {
    return GamePassObjectModel(id: map['id']);
  }

  @override
  GamePassObjectModel copyWith({
    String? id,
  }) {
    return GamePassObjectModel(id: id ?? this.id);
  }
}
