import 'package:flutter/material.dart';
import 'package:teste_vaga/widgets/info_section/info_card.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.black.withOpacity(0.1), width: 0.7),
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
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    height: 16 / 20,
                    letterSpacing: 0.41,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Dados de todos os condomínios",
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.0,
                    letterSpacing: -0.41,
                    color: Colors.grey,
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
                InfoCard(
                  icon: Icons.login,
                  iconBackgroundColor: Color(0xFF00A68A),
                  title: "Controle de acesso",
                  subtitle: "Permissões e acessos",
                  notificationCount: "10",
                ),
                InfoCard(
                  icon: Icons.campaign,
                  iconBackgroundColor: Color(0xFF2E7D32),
                  title: "Notícias",
                  subtitle: "Últimas notícias e eventos",
                  notificationCount: "",
                ),
                InfoCard(
                  icon: Icons.description,
                  iconBackgroundColor: Color(0xFF2196F3),
                  title: "Relatórios",
                  subtitle: "Visualize relatórios detalhados",
                  notificationCount: "",
                ),
                InfoCard(
                  icon: Icons.inventory_2,
                  iconBackgroundColor: Color(0xFFFF9800),
                  title: "Encomendas",
                  subtitle: "Acompanhe as encomendas",
                  notificationCount: "",
                ),
                InfoCard(
                  icon: Icons.groups,
                  iconBackgroundColor: Color(0xFFE91E63),
                  title: "Assembleias",
                  subtitle: "Gerencie assembleias",
                  notificationCount: "",
                ),
                InfoCard(
                  icon: Icons.headset_mic,
                  iconBackgroundColor: Color(0xFFF44336),
                  title: "Fale com a administração",
                  subtitle: "Fale com a administradora",
                  notificationCount: "10",
                ),
                InfoCard(
                  icon: Icons.folder,
                  iconBackgroundColor: Color(0xFFEF6C00),
                  title: "Documentos",
                  subtitle: "Acesse os documentos",
                  notificationCount: "",
                ),
                InfoCard(
                  icon: Icons.menu_book,
                  iconBackgroundColor: Color(0xFF4E342E),
                  title: "Livro de ocorrências",
                  subtitle: "Registro de ocorrências",
                  notificationCount: "10",
                ),
                InfoCard(
                  icon: Icons.percent,
                  iconBackgroundColor: Color(0xFFAFB42B),
                  title: "Classificados",
                  subtitle: "Anúncios nos condomínios",
                  notificationCount: "10",
                ),
                InfoCard(
                  icon: Icons.info,
                  iconBackgroundColor: Color(0xFF9C27B0),
                  title: "Comunicados",
                  subtitle: "Confira os comunicados",
                  notificationCount: "",
                ),
                InfoCard(
                  icon: Icons.bookmark,
                  iconBackgroundColor: Color(0xFF1565C0),
                  title: "Reservas e mudanças",
                  subtitle: "Agendamentos e gerencia",
                  notificationCount: "10",
                ),
                InfoCard(
                  icon: Icons.calendar_month,
                  iconBackgroundColor: Color(0xFFB71C1C),
                  title: "Calendário do síndico",
                  subtitle: "Permissões e acessos",
                  notificationCount: "10",
                ),
                InfoCard(
                  icon: Icons.assignment,
                  iconBackgroundColor: Color(0xFF1B5E20),
                  title: "Enquete",
                  subtitle: "Permissões e acessos",
                  notificationCount: "10",
                ),
                InfoCard(
                  icon: Icons.exit_to_app,
                  iconBackgroundColor: Color(0xFFA1887F),
                  title: "Boletos",
                  subtitle: "Permissões e acessos",
                  notificationCount: "10",
                ),
                InfoCard(
                  icon: Icons.store,
                  iconBackgroundColor: Color(0xFF212121),
                  title: "Marketing place",
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
