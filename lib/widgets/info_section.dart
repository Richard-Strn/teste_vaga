import 'package:flutter/material.dart';
import 'package:teste_vaga/widgets/info_card.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Informações gerais",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),

        Row(
          children: const [
            Expanded(
              child: InfoCard(icon: Icons.login, color: Colors.green),
            ),
            SizedBox(width: 20),
            Expanded(
              child: InfoCard(icon: Icons.campaign, color: Colors.blue),
            ),
            SizedBox(width: 20),
            Expanded(
              child: InfoCard(icon: Icons.description, color: Colors.orange),
            ),
          ],
        ),
      ],
    );
  }
}
