import 'package:flutter/material.dart';
import 'package:teste_vaga/widgets/stat_card2.dart';

class DashboardCard2 extends StatefulWidget {
  final VoidCallback? onNavigateToSecondPage;
  const DashboardCard2({super.key, this.onNavigateToSecondPage});

  @override
  State<DashboardCard2> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        // Removido gradient e color para tornar o fundo transparente
        borderRadius: BorderRadius.circular(28),
        // Opcional: Adicione uma borda fina se quiser delimitar o espaço
        // border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF59E0B),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                        Icons.workspace_premium,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Dashboard Geral",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                              letterSpacing: 0.8,
                              color: Colors.black, // Ajuste conforme seu fundo
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Dados e métricas dos condomínios",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.0,
                              letterSpacing: 0.4,
                              color: Colors.black, // Ajuste conforme seu fundo
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          /// MINI CARDS
          LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    child: StatCard2(
                      title: "Acessos hoje",
                      value: "10",
                      icon: Icons.arrow_upward,
                      iconColor: Color(0xFF03A9F4),
                      number: 10,
                      textNumber: 'Aumento de 12%',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: StatCard2(
                      title: "Veículos cadastrados",
                      value: "10",
                      icon: Icons.directions_car,
                      iconColor: Color.fromARGB(255, 166, 61, 187),
                      number: 12,
                      textNumber: '+3 novos veículos',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: StatCard2(
                      title: "Encomendas",
                      value: "10",
                      icon: Icons.inventory_2_outlined,
                      iconColor: Color(0xFF4CAF50),
                      number: 45,
                      textNumber: '8 pendentes',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: StatCard2(
                      title: "Ocorrências",
                      value: "100",
                      icon: Icons.warning_amber_rounded,
                      iconColor: Color(0xFFEF5350),
                      number: 77,
                      textNumber: '55 ativas',
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
