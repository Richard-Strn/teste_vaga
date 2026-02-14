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
        color: Colors.white, // Cor de fundo cinza
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
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Informações gerais",
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 20, // Figma: 20px
                    fontWeight: FontWeight.w900, // Figma: 800 (ExtraBold)
                    height: 16 / 20, // Figma: 16px / 20px = 0.8
                    letterSpacing: 0.41, // Figma: -0.41px
                    color: const Color(0xFF1A1A1A), // Mantido do original
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Dados de todos os condomínios",
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 16, // Figma: 16px
                    fontWeight: FontWeight.w400, // Figma: 400 (Regular)
                    height: 1.0, // Figma: 16px / 16px = 1.0
                    letterSpacing: -0.41, // Figma: -0.41px
                    color: Colors.grey, // Mantido do original
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Wrap(
              spacing: 20.8,
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
