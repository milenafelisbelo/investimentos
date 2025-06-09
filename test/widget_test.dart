import 'package:flutter_test/flutter_test.dart';

import 'package:myapp/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const InvestimentoApp());

    // await tester.enterText(find.byType(TextField).first, '100');
    // await tester.tap(find.byType(ElevatedButton));
    // await tester.pump();

    // Aqui você pode adaptar os testes para verificar o comportamento da simulação, por exemplo:
    expect(find.text('Simular'), findsOneWidget);
    expect(find.text('Sem juros:'), findsOneWidget);
    expect(find.text('Com juros:'), findsOneWidget);
  });
}
