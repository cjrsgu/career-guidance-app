import 'package:flutter/material.dart';

import 'package:career_guidance/professiogramsScreen.dart';
import 'package:career_guidance/testsScreen.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:career_guidance/model/model.dart';
import 'package:career_guidance/redux/reducers.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
      middleware: [thunkMiddleware],
    );

    return StoreProvider<AppState>(
      store: store,
      child: Root(),
    );
  }
}

class Root extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RootState();
  }
}

class RootState extends State<Root> {
  int _selectedPage = 0;
  final _pageOptions = [
    TestsScreen(),
    ProfessiogramsScreen(),
  ];

  final _pageTitles = [
    Text('Тесты'),
    Text('Профессиограммы'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Профориентация',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: _pageTitles[_selectedPage]),
          body: _pageOptions[_selectedPage],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedPage,
              onTap: (int index) {
                setState(() {
                  _selectedPage = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.library_books),
                  title: _pageTitles[0],
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business_center),
                  title: _pageTitles[1],
                ),
              ]),
        ));
  }
}
