import 'package:flutter/material.dart';
import 'package:teste_vaga/widgets/notification_card.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30),
      // Substituímos 'color' por 'decoration'
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 250, 249, 249), // Cor de fundo cinza
        borderRadius: BorderRadius.circular(
          18,
        ), // Ajuste o valor conforme desejar
        border: Border.all(
          color: Colors.black.withOpacity(0.1), // Borda sutil opcional
          width: 0.7,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Informações gerais",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                Text(
                  "Dados de todos os condomínios",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: const [
                NotificationCard(
                  icon: Icons.logout,
                  iconBackgroundColor: Color.fromARGB(255, 25, 27, 189),
                  title: "Controle de acesso",
                  subtitle: "Permissões e acessos",
                  notificationCount: "",
                ),
                NotificationCard(
                  icon: Icons.logout,
                  iconBackgroundColor: Color(0xFF00A68A),
                  title: "Controle de acesso",
                  subtitle: "Permissões e acessos",
                  notificationCount: "10",
                ),
                NotificationCard(
                  icon: Icons.logout,
                  iconBackgroundColor: Color(0xFF00A68A),
                  title: "Controle de acesso",
                  subtitle: "Permissões e acessos",
                  notificationCount: "10",
                ),
                NotificationCard(
                  icon: Icons.logout,
                  iconBackgroundColor: Color(0xFF00A68A),
                  title: "Controle de acesso",
                  subtitle: "Permissões e acessos",
                  notificationCount: "10",
                ),
                NotificationCard(
                  icon: Icons.logout,
                  iconBackgroundColor: Color(0xFF00A68A),
                  title: "Controle de acesso",
                  subtitle: "Permissões e acessos",
                  notificationCount: "10",
                ),
                NotificationCard(
                  icon: Icons.logout,
                  iconBackgroundColor: Color(0xFF00A68A),
                  title: "Controle de acesso",
                  subtitle: "Permissões e acessos",
                  notificationCount: "10",
                ),
                NotificationCard(
                  icon: Icons.logout,
                  iconBackgroundColor: Color(0xFF00A68A),
                  title: "Controle de acesso",
                  subtitle: "Permissões e acessos",
                  notificationCount: "10",
                ),
                NotificationCard(
                  icon: Icons.logout,
                  iconBackgroundColor: Color(0xFF00A68A),
                  title: "Controle de acesso",
                  subtitle: "Permissões e acessos",
                  notificationCount: "10",
                ),
                NotificationCard(
                  icon: Icons.logout,
                  iconBackgroundColor: Color(0xFF00A68A),
                  title: "Controle de acesso",
                  subtitle: "Permissões e acessos",
                  notificationCount: "10",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
