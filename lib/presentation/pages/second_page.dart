import 'package:flutter/material.dart';
import 'package:teste_vaga/widgets/dashboard_2/dashboard_section_2.dart';
import 'package:teste_vaga/widgets/header_section.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(238, 238, 238, 238),
      // Envolva o Padding com SingleChildScrollView
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(),
              const SizedBox(height: 24),
              DashboardSection2(),
            ],
          ),
        ),
      ),
    );
  }
}
