class GameMap {
  final String uuid;
  final String displayName;
  final String displayIcon;

  GameMap({
    required this.uuid,
    required this.displayName,
    required this.displayIcon,
  });

  factory GameMap.fromJson(Map<String, dynamic> json) {
    return GameMap(
      uuid: json['uuid'] ?? '',
      displayName: json['displayName'] ?? '',
      displayIcon: json['displayIcon'] ?? '',
    );
  }
}
