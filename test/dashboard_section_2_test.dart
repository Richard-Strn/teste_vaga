import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_vaga/presentation/widgets/dashboard_2/dashboard_card_2.dart';
import 'package:teste_vaga/presentation/widgets/dashboard_2/dashboard_section_2.dart'; // Ajuste o caminho

void main() {
  group('DashboardSection2 Widget Tests', () {
    testWidgets('Deve renderizar o cabeçalho com cores pretas (Black)', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: DashboardSection2())),
      );

      // Verifica o título principal
      final titleFinder = find.text("Dashboard Geral");
      expect(titleFinder, findsOneWidget);

      // Verifica se a cor do texto é preta (conforme definido no seu código)
      final Text titleWidget = tester.widget(titleFinder);
      expect(titleWidget.style?.color, equals(Colors.black));

      // Verifica o subtítulo
      expect(find.text("Dados e métricas dos condomínios"), findsOneWidget);
    });

    testWidgets('Deve conter exatamente 4 instâncias de DashboardCard2', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: DashboardSection2())),
      );

      // Verifica se os 4 cartões específicos desta seção estão presentes
      expect(find.byType(DashboardCard2), findsNWidgets(4));
    });

    testWidgets('Deve exibir os dados específicos de cada card', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: DashboardSection2())),
      );

      // Verifica títulos específicos para garantir que todos os cards foram instanciados
      expect(find.text("Acessos hoje"), findsOneWidget);
      expect(find.text("Veículos cadastrados"), findsOneWidget);
      expect(find.text("Encomendas"), findsOneWidget);
      expect(find.text("Ocorrências"), findsOneWidget);

      // Verifica se o número "100" (exclusivo do card de ocorrências) aparece
      expect(find.text("100"), findsOneWidget);

      // Verifica se o texto "55 ativas" aparece
      expect(find.text("55 ativas"), findsOneWidget);
    });

    testWidgets('Deve manter a estrutura de Row dentro do LayoutBuilder', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: DashboardSection2())),
      );

      // Verifica se existe um LayoutBuilder (que você usou para responsividade)
      expect(find.byType(LayoutBuilder), findsOneWidget);

      // Verifica se os cards estão dentro de Expanded widgets para dividir o espaço
      expect(
        find.byType(Expanded),
        findsAtLeastNWidgets(5),
      ); // 1 do Header + 4 dos Cards
    });
  });
}
