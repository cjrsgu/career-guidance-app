import 'package:flutter/material.dart';

import 'package:career_guidance/professiogramsScreen.dart';
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
    Text('Тесты'),
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
/* 
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redux items')
      ),
      body: StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) => _ViewModel.create(store),
        builder: (BuildContext context, _ViewModel viewModel) => Column(
          children: <Widget>[
            AddItemWidget(viewModel),
            Expanded(child: ItemListWidget(viewModel)),
            RemoveItemsButton(viewModel),
          ],
        ),
      ),
    );
  }
}

class AddItemWidget extends StatefulWidget {
  final _ViewModel model;

  AddItemWidget(this.model);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItemWidget> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'add an Item',
      ),
      onSubmitted: (String s) {
        widget.model.onAddItem(s);
        controller.text = '';
      },
    );
  }
}

class ItemListWidget extends StatelessWidget {
  final _ViewModel model;

  ItemListWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: model.items.map((Item item) => ListTile(
        title: Text(item.body),
        leading: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () => model.onRemoveItem(item),
        ),
      )).toList(),
    );
  }
}

class RemoveItemsButton extends StatelessWidget {
  final _ViewModel model;

  RemoveItemsButton(this.model);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Delete all Items'),
      onPressed: () => model.onRemoveItems(),
    );
  }
}

class _ViewModel {
  final List<Item> items;
  final Function(String) onAddItem;
  final Function(Item) onRemoveItem;
  final Function() onRemoveItems;

  _ViewModel({
    this.items,
    this.onAddItem,
    this.onRemoveItem,
    this.onRemoveItems,
  });

  factory _ViewModel.create(Store<AppState> store) {
    _onAddItem(String body) {
      store.dispatch(AddItemAction(body));
    }

    _onRemoveItem(Item item) {
      store.dispatch(RemoveItemAction(item));
    }

    _onRemoveItems() {
      store.dispatch(RemoveItemsAction());
    }

    return _ViewModel(
      items: store.state.items,
      onAddItem: _onAddItem,
      onRemoveItem: _onRemoveItem,
      onRemoveItems: _onRemoveItems,
    );
  }
}

 */
