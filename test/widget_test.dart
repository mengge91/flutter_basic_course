// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_basic_course/main.dart';



void main() {
  testWidgets('Flutter basic course demo test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FlutterBasicCourseApp());

    // Verify that our app shows the main title
    expect(find.text('Flutter基础课程'), findsOneWidget);
    
    // Verify that we have the main navigation cards
    expect(find.text('基础组件'), findsOneWidget);
    expect(find.text('布局组件'), findsOneWidget);
    expect(find.text('输入组件'), findsOneWidget);
    expect(find.text('导航'), findsOneWidget);
    expect(find.text('状态管理'), findsOneWidget);
    expect(find.text('动画'), findsOneWidget);
  });
}
