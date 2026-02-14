import 'package:flutter/material.dart';
import 'package:teste_vaga/presentation/widgets/dashboard_2/dashboard_card_2.dart';

class DashboardSection2 extends StatefulWidget {
  final VoidCallback? onNavigateToSecondPage;
  const DashboardSection2({super.key, this.onNavigateToSecondPage});

  @override
  State<DashboardSection2> createState() => _DashboardSection2State();
}

class _DashboardSection2State extends State<DashboardSection2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(28)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                              color: Colors.black,
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
                              color: Colors.black,
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
          LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    child: DashboardCard2(
                      title: "Acessos hoje",
                      icon: Icons.arrow_upward,
                      iconColor: Color(0xFF03A9F4),
                      number: 10,
                      textNumber: 'Aumento de 12%',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: DashboardCard2(
                      title: "Veículos cadastrados",
                      icon: Icons.directions_car,
                      iconColor: Color.fromARGB(255, 166, 61, 187),
                      number: 10,
                      textNumber: '+3 novos veículos',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: DashboardCard2(
                      title: "Encomendas",
                      icon: Icons.inventory_2_outlined,
                      iconColor: Color(0xFF4CAF50),
                      number: 10,
                      textNumber: '8 pendentes',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: DashboardCard2(
                      title: "Ocorrências",
                      icon: Icons.warning_amber_rounded,
                      iconColor: Color(0xFFEF5350),
                      number: 100,
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
