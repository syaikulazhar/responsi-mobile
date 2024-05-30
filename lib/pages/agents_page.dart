import 'package:flutter/material.dart';
import '../models/agent.dart';
import '../services/api_service.dart';
import 'agent_detail_page.dart';

class AgentsPage extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agents'),
      ),
      body: Container(
        color: Colors.pinkAccent,
        child: FutureBuilder<List<Agent>>(
          future: apiService.fetchAgents(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No agents found'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final agent = snapshot.data![index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgentDetailPage(uuid: agent.uuid),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Image.network(agent.displayIcon),
                      title: Text(agent.displayName),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}