import 'package:flutter/material.dart';
import 'package:teste_vaga/widgets/dashboard_card.dart';
import 'package:teste_vaga/widgets/header_section.dart';
import 'package:teste_vaga/widgets/info_section.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 228, 231),
      body: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              // Adicionado para permitir o scroll vertical
              physics:
                  const BouncingScrollPhysics(), // Opcional: efeito de rebote suave
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderSection(),
                    const SizedBox(height: 30),
                    const DashboardCard(),
                    const SizedBox(height: 40),
                    const InfoSection(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
