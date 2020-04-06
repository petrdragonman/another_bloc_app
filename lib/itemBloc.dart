import 'dart:async';

import './item.dart';
//1 -> imports

class ItemBloc{
  // sink to add in pipe
  // stream to get data from pipe

  //2 -> lists or datasets -> employees
  List<Item> _itemList = [
    Item(1, 'apple', 'petr@me.com', 'password', 'apple credentials', true),
    Item(2, 'netflix', 'petr@me.com', 'password', 'netflix credentials', true),
    Item(3, 'google', 'petr@me.com', 'password', 'google credentials', true),
    Item(4, 'github', 'petr@me.com', 'password', 'github credentials', false),
  ];
  // 3 -> stream controllers
  final _itemListStreamController = StreamController<List<Item>>();
  final _addNewItemStreamController = StreamController<Item>();
  final _showItemStreamController = StreamController<Item>();

  //4 -> stream sink getters
  Stream<List<Item>> get itemListStream => _itemListStreamController.stream;
  StreamSink<List<Item>> get itemListSink => _itemListStreamController.sink;

  StreamSink<Item> get addNewItemSink => _addNewItemStreamController.sink;
  StreamSink<Item> get showItemSink => _showItemStreamController.sink;

  ItemBloc(){
    //5 -> contructor -> add data
    _itemListStreamController.add(_itemList);
    //5 -> contructor -> listen to changes
    _addNewItemStreamController.stream.listen(_addNewItem);
    _showItemStreamController.stream.listen(_showItem);
  }

  //6 -> core functions
  _addNewItem(Item item){
    
    itemListSink.add(_itemList);
  }

  _showItem(Item item){
    print('in show item');
    bool isVisible = item.isVisible;
    // get isVisible bool value, toggle it and set it as a new state value
    _itemList[item.id-1].isVisible = !isVisible;
    itemListSink.add(_itemList);
  }

  //7 -> dispose
  void dispose(){
    _addNewItemStreamController.close();
    _showItemStreamController.close();
    _itemListStreamController.close();
  }
}
  



