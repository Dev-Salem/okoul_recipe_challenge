import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_controllers.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/controllers/home_states.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/screens/feed_tab.dart';
import 'package:okoul_recipe_challenge/features/home/presentation/screens/home_page.dart';

class MockHome extends MockBloc<HomeEvents, HomeState>
    implements HomeFeatureBloc {}

void main() {
  late MockHome mockBloc;
  setUp(() {
    mockBloc = MockHome();
  });
  tearDown(() {
    mockBloc.close();
  });
  group('Test HomePage -', () {
    testWidgets("Test", (tester) async {});
  });
}
