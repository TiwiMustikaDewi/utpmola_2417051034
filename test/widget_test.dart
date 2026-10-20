import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:utpmola_2417051034/main.dart';
import 'package:utpmola_2417051034/screens/chat_detail_screen.dart';

void main() {
  testWidgets('ChatDetailScreen renders messages directly', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ChatDetailScreen()));
    await tester.pumpAndSettle();
    expect(find.text('kkiya'), findsOneWidget);
    expect(find.text('untuk tugas metopen km udah belum'), findsOneWidget);
    expect(find.text('bentar lagi selesai'), findsOneWidget);
  });

  testWidgets('Full LINE Clone 4-screen navigation test', (WidgetTester tester) async {
    // 1. Build app and check Beranda
    await tester.pumpWidget(const LineCloneApp());
    await tester.pumpAndSettle();

    expect(find.text('Tiwi MD'), findsOneWidget);
    expect(find.text('9am-9pm'), findsOneWidget);
    expect(find.text('Daftar Teman'), findsOneWidget);
    expect(find.text('Teman'), findsOneWidget);
    expect(find.text('Grup'), findsOneWidget);

    // 2. Switch tabs to Obrolan
    await tester.tap(find.text('Obrolan').last);
    await tester.pumpAndSettle();
    expect(find.text('Tak Ada Permintaan Obrolan Baru'), findsOneWidget);
    // Scroll chat list to bring kkiya fully into view
    await tester.drag(find.byType(ListView).first, const Offset(0, -150));
    await tester.pumpAndSettle();

    // Tap specifically on kkiya to open detail screen
    await tester.tap(find.text('kkiya'));
    await tester.pumpAndSettle();
    expect(find.text('untuk tugas metopen km udah belum'), findsOneWidget);

    // Return back to Obrolan
    await tester.tap(find.byIcon(Icons.chevron_left));
    await tester.pumpAndSettle();

    // 3. Switch to Panggilan
    await tester.tap(find.text('Panggilan').last);
    await tester.pumpAndSettle();
    expect(find.text('farel arbi'), findsOneWidget);

    // 4. Tap on News (should show SnackBar without opening a new screen)
    await tester.tap(find.text('News').last);
    await tester.pumpAndSettle();
    expect(find.text('Menu News nonaktif'), findsOneWidget);
  });
}
