import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/agent.dart';
import '../models/agent_detail.dart';
import '../models/map.dart';

class ApiService {
  static const String baseUrl = 'https://valorant-api.com/v1';

  Future<List<Agent>> fetchAgents() async {
    final response = await http.get(Uri.parse('$baseUrl/agents'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((item) => Agent.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load agents');
    }
  }

  Future<AgentDetail> fetchAgentDetail(String uuid) async {
    final response = await http.get(Uri.parse('$baseUrl/agents/$uuid'));

    if (response.statusCode == 200) {
      return AgentDetail.fromJson(jsonDecode(response.body)['data']);
    } else {
      throw Exception('Failed to load agent detail');
    }
  }

  Future<List<GameMap>> fetchMaps() async {
    final response = await http.get(Uri.parse('$baseUrl/maps'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((item) => GameMap.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load maps');
    }
  }
}
