import 'package:flutter/material.dart';
import 'package:teste_vaga/presentation/widgets/dashboard_1/dashboard_section.dart';
import 'package:teste_vaga/presentation/widgets/header/header_section.dart';
import 'package:teste_vaga/presentation/widgets/info_section/info_section.dart';

class MainPage extends StatelessWidget {
  final void Function()? onNavigateToSecondPage;
  const MainPage({super.key, this.onNavigateToSecondPage});

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
                    DashboardSection(
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
