import 'package:flutter/material.dart';
import 'package:teste_vaga/widgets/dashboard_card.dart';
import 'package:teste_vaga/widgets/header_section.dart';
import 'package:teste_vaga/widgets/info_section.dart';

class MainScreen extends StatelessWidget {
  final void Function()? onNavigateToSecondPage;
  const MainScreen({super.key, this.onNavigateToSecondPage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderSection(),
                    const SizedBox(height: 15),
                    DashboardCard(
                      onNavigateToSecondPage: onNavigateToSecondPage,
                    ),
                    const SizedBox(height: 30),
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
