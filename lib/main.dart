import 'package:flutter/material.dart';
import 'package:teste_vaga/pages.dart';
import 'package:teste_vaga/pages/mainscreen.dart';
import 'package:teste_vaga/pages/secondpage.dart';
import 'package:teste_vaga/widgets/custom_sidebar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a faixa de debug
      title: 'Dashboard Condomínio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1CB197)),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(
          0xFFF5F7F9,
        ), // Fundo levemente cinza como na imagem
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutQuart,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sua Sidebar que criamos antes
          CustomSidebar(onItemSelected: _onItemTapped),

          Expanded(
            child: PageView(
              controller: _pageController,
              physics:
                  const NeverScrollableScrollPhysics(), // Desabilita arrastar com mouse
              children: const [
                MainScreen(), // Index 0
                GenericPage(title: "Condomínios"), // Index 1
                GenericPage(title: "Endereços"), // Index 2
                GenericPage(title: "Usuários"), // Index 3
                GenericPage(title: "Visitantes"), // Index 4
                SecondPage(), // Index 5 - Página de detalhes
              ],
            ),
          ),
        ],
      ),
    );
  }
}
