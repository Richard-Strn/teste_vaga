import 'package:flutter/material.dart';
import 'package:teste_vaga/widgets/mini_card.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0A1F44), Color(0xFF5B2BC7)],
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.dashboard, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Dashboard Geral",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text("Experimente grátis", style: TextStyle(color: Colors.white)),
            ],
          ),
          const SizedBox(height: 20),

          Row(
            children: const [
              Expanded(
                child: MiniCard(title: "Acessos hoje", color: Colors.blue),
              ),
              SizedBox(width: 20),
              Expanded(
                child: MiniCard(title: "Encomendas", color: Colors.green),
              ),
              SizedBox(width: 20),
              Expanded(
                child: MiniCard(title: "Ocorrências", color: Colors.orange),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
