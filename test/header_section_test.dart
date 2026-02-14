import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_vaga/presentation/widgets/header/header_section.dart'; // Ajuste o import

void main() {
  group('HeaderSection Widget Tests', () {
    testWidgets('Deve renderizar as mensagens de boas-vindas corretamente', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: HeaderSection())),
      );

      // Verifica os textos principais do lado esquerdo
      expect(find.text("Administradora de Condomínios"), findsOneWidget);
      expect(find.text("Bem vindo ao portal"), findsOneWidget);
    });

    testWidgets('Deve exibir as informações do usuário (Nome e Cargo)', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: HeaderSection())),
      );

      // Verifica as informações do perfil
      expect(find.text("User Name"), findsOneWidget);
      expect(find.text("Admin"), findsOneWidget);

      // Verifica se o CircleAvatar (foto de perfil) está presente
      expect(find.byType(CircleAvatar), findsOneWidget);
    });

    testWidgets(
      'Deve renderizar o botão de seleção de condomínio com ícone de busca',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: HeaderSection())),
        );

        // Verifica o texto dentro do botão verde
        expect(find.text("Selecione um condomínio"), findsOneWidget);

        // Verifica o ícone de busca
        expect(find.byIcon(Icons.search), findsOneWidget);

        // Verifica se o botão tem a cor de fundo correta (0xFF0EA28E)
        final container = tester.widget<Container>(
          find.descendant(
            of: find.byType(InkWell),
            matching: find.byType(Container),
          ),
        );
        expect(
          (container.decoration as BoxDecoration).color,
          const Color(0xFF0EA28E),
        );
      },
    );

    testWidgets('Deve reagir ao clique no botão "Selecione um condomínio"', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: HeaderSection())),
      );

      // Simula o clique no InkWell
      await tester.tap(find.byType(InkWell));
      await tester.pump();

      // Como o onTap atual está vazio (), o teste garante que o widget é "clicável"
      // sem disparar erros de hit-test.
    });
  });
}
