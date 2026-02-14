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
                // 1. Controle de Acesso (Teal/Verde Água - Ícone de porta/login)
                NotificationCard(
                  icon: Icons.login, // Ou Icons.door_front_door
                  iconBackgroundColor: const Color(0xFF00A68A), // Teal
                  title: "Controle de acesso",
                  subtitle: "Permissões e acessos",
                  notificationCount: "10",
                ),

                // 2. Notícias (Verde - Ícone de Megafone)
                NotificationCard(
                  icon: Icons.campaign,
                  iconBackgroundColor: const Color(0xFF2E7D32), // Verde
                  title: "Notícias",
                  subtitle: "Últimas notícias e eventos",
                  notificationCount: "",
                ),

                // 3. Relatórios (Azul - Ícone de Documento)
                NotificationCard(
                  icon: Icons.description,
                  iconBackgroundColor: const Color(0xFF2196F3), // Azul
                  title: "Relatórios",
                  subtitle: "Visualize relatórios detalhados",
                  notificationCount: "",
                ),

                // 4. Encomendas (Laranja - Ícone de Caixa)
                NotificationCard(
                  icon: Icons.inventory_2, // Caixa/Pacote
                  iconBackgroundColor: const Color(0xFFFF9800), // Laranja
                  title: "Encomendas",
                  subtitle: "Acompanhe as encomendas",
                  notificationCount: "",
                ),

                // 5. Assembleias (Rosa - Ícone de Pessoas/Grupo)
                NotificationCard(
                  icon: Icons.groups,
                  iconBackgroundColor: const Color(0xFFE91E63), // Rosa
                  title: "Assembleias",
                  subtitle: "Gerencie assembleias",
                  notificationCount: "",
                ),

                // 6. Fale com Administração (Vermelho - Ícone de Headset)
                NotificationCard(
                  icon: Icons.headset_mic,
                  iconBackgroundColor: const Color(0xFFF44336), // Vermelho
                  title: "Fale com a administração",
                  subtitle: "Fale com a administradora",
                  notificationCount: "10",
                ),

                // 7. Documentos (Laranja Escuro - Ícone de Pasta)
                NotificationCard(
                  icon: Icons.folder,
                  iconBackgroundColor: const Color(
                    0xFFEF6C00,
                  ), // Laranja Escuro
                  title: "Documentos",
                  subtitle: "Acesse os documentos",
                  notificationCount: "",
                ),

                // 8. Livro de ocorrências (Marrom Escuro - Ícone de Livro Aberto)
                NotificationCard(
                  icon: Icons.menu_book,
                  iconBackgroundColor: const Color(0xFF4E342E), // Marrom
                  title: "Livro de ocorrências",
                  subtitle: "Registro de ocorrências",
                  notificationCount: "10",
                ),

                // 9. Classificados (Verde Lima - Ícone de Porcentagem/Oferta)
                NotificationCard(
                  icon: Icons.percent, // Ícone de % conforme a imagem
                  iconBackgroundColor: const Color(0xFFAFB42B), // Verde Lima
                  title: "Classificados",
                  subtitle: "Anúncios nos condomínios",
                  notificationCount: "10",
                ),

                // 10. Comunicados (Roxo - Ícone de Informação)
                NotificationCard(
                  icon: Icons.info,
                  iconBackgroundColor: const Color(0xFF9C27B0), // Roxo
                  title: "Comunicados",
                  subtitle: "Confira os comunicados",
                  notificationCount: "",
                ),

                // 11. Reservas e mudanças (Azul Escuro - Ícone de Marcador)
                NotificationCard(
                  icon: Icons.bookmark,
                  iconBackgroundColor: const Color(0xFF1565C0), // Azul Escuro
                  title: "Reservas e mudanças",
                  subtitle: "Agendamentos e gerencia",
                  notificationCount: "10",
                ),

                // 12. Calendário do síndico (Vinho/Marrom - Ícone de Calendário)
                NotificationCard(
                  icon: Icons.calendar_month,
                  iconBackgroundColor: const Color(0xFFB71C1C), // Vinho
                  title: "Calendário do síndico",
                  subtitle: "Permissões e acessos",
                  notificationCount: "10",
                ),

                // 13. Enquete (Verde Escuro - Ícone de Prancheta)
                NotificationCard(
                  icon: Icons.assignment, // Prancheta/Checklist
                  iconBackgroundColor: const Color(0xFF1B5E20), // Verde Escuro
                  title: "Enquete",
                  subtitle: "Permissões e acessos",
                  notificationCount: "10",
                ),

                // 14. Boletos (Dourado/Bronze - Ícone de Saída/Boleto)
                NotificationCard(
                  icon: Icons
                      .exit_to_app, // Visualmente similar ao da imagem (Porta com seta)
                  iconBackgroundColor: const Color(
                    0xFFA1887F,
                  ), // Bronze/Dourado
                  title: "Boletos",
                  subtitle: "Permissões e acessos",
                  notificationCount: "10",
                ),

                // 15. Marketing place (Preto - Ícone de Loja)
                NotificationCard(
                  icon: Icons.store,
                  iconBackgroundColor: const Color(0xFF212121), // Preto
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
