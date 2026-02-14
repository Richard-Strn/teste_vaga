import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teste_vaga/presentation/widgets/info_section/info_card.dart';
import 'package:teste_vaga/presentation/widgets/info_section/info_section.dart'; // Ajuste o import

void main() {
  group('InfoSection Widget Tests', () {
    testWidgets('Deve renderizar o título e subtítulo da seção', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: InfoSection())),
      );

      expect(find.text("Informações gerais"), findsOneWidget);
      expect(find.text("Dados de todos os condomínios"), findsOneWidget);
    });

    testWidgets('Deve renderizar exatamente 15 instâncias de InfoCard', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: InfoSection())),
      );

      // Verifica se todos os cartões (InfoCard) foram criados
      expect(find.byType(InfoCard), findsNWidgets(15));
    });

    testWidgets(
      'Deve exibir títulos específicos de cartões para validar a lista',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: InfoSection())),
        );

        // Testamos alguns títulos aleatórios da sua lista para garantir a integridade
        expect(find.text("Controle de acesso"), findsOneWidget);
        expect(find.text("Assembleias"), findsOneWidget);
        expect(find.text("Marketing place"), findsOneWidget);
        expect(find.text("Calendário do síndico"), findsOneWidget);
      },
    );

    testWidgets('Deve usar um Wrap para garantir responsividade dos cards', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: InfoSection())),
      );

      // Verifica se o componente Wrap está presente
      final wrapFinder = find.byType(Wrap);
      expect(wrapFinder, findsOneWidget);

      // Verifica se o espaçamento definido (spacing: 20.8) está configurado
      final Wrap wrapWidget = tester.widget(wrapFinder);
      expect(wrapWidget.spacing, equals(20.8));
    });

    testWidgets(
      'Deve verificar se existem notificações (10) em cartões específicos',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(home: Scaffold(body: InfoSection())),
        );

        // No seu código, vários cartões têm notificationCount: "10"
        // Vamos verificar se o texto "10" aparece múltiplas vezes
        expect(find.text("10"), findsAtLeastNWidgets(5));
      },
    );
  });
}
