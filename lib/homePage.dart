import 'package:flutter/material.dart';

import './item.dart';
import './itemBloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ItemBloc _itemBloc = ItemBloc();

  @override
  void dispose() {
    super.dispose();
    _itemBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('another bloc app'),
      ),
      body: Container(
        child: StreamBuilder<List<Item>>(
          //stream: _employeeBloc.employeeListStream,
          stream: _itemBloc.itemListStream,
          builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              snapshot.data[index].title,
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.bold),
                            ),
                            snapshot.data[index].isVisible
                                ? Text(
                                    snapshot.data[index].username,
                                    style: TextStyle(fontSize: 16.0),
                                  )
                                : Text(
                                    'hidden, press icon to show',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                            snapshot.data[index].isVisible
                                ? Text(
                                    snapshot.data[index].password,
                                    style: TextStyle(fontSize: 16.0),
                                  )
                                : Text(
                                    'hidden, press icon to show',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      Container(
                        child: IconButton(
                            icon: snapshot.data[index].isVisible
                                ? Icon(
                                    Icons.visibility,
                                    color: Colors.orange,
                                  )
                                : Icon(Icons.visibility_off),
                            onPressed: () {
                              _itemBloc.showItemSink.add(snapshot.data[index]);
                            }),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
