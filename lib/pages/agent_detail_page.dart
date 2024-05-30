import 'package:flutter/material.dart';
import '../models/agent_detail.dart';
import '../services/api_service.dart';

class AgentDetailPage extends StatelessWidget {
  final String uuid;
  final ApiService apiService = ApiService();

  AgentDetailPage({required this.uuid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agent Detail'),
      ),
      body: FutureBuilder<AgentDetail>(
        future: apiService.fetchAgentDetail(uuid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data found'));
          } else {
            final agentDetail = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    agentDetail.displayName,
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    agentDetail.description,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text('Abilities:', style: TextStyle(fontSize: 20)),
                  ...agentDetail.abilities.map((ability) {
                    return ListTile(
                      leading: ability.displayIcon.isNotEmpty
                          ? Image.network(ability.displayIcon)
                          : null,
                      title: Text(
                        ability.displayName,
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        ability.description,
                        textAlign: TextAlign.center,
                      ),
                    );
                  }).toList(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
