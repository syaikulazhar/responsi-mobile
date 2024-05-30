class AgentDetail {
  final String displayName;
  final String description;
  final List<Ability> abilities;

  AgentDetail({
    required this.displayName,
    required this.description,
    required this.abilities,
  });

  factory AgentDetail.fromJson(Map<String, dynamic> json) {
    var abilitiesFromJson = json['abilities'] as List;
    List<Ability> abilitiesList = abilitiesFromJson.map((ability) => Ability.fromJson(ability)).toList();

    return AgentDetail(
      displayName: json['displayName'],
      description: json['description'],
      abilities: abilitiesList,
    );
  }
}

class Ability {
  final String slot;
  final String displayName;
  final String description;
  final String displayIcon;

  Ability({
    required this.slot,
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      slot: json['slot'],
      displayName: json['displayName'],
      description: json['description'],
      displayIcon: json['displayIcon'],
    );
  }
}
