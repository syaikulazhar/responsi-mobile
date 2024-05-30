class Agent {
  final String uuid;
  final String displayName;
  final String displayIcon;

  Agent({
    required this.uuid,
    required this.displayName,
    required this.displayIcon,
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      uuid: json['uuid'],
      displayName: json['displayName'],
      displayIcon: json['displayIcon'],
    );
  }
}
