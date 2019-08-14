import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _list;
  var _isLoading = false;


  @override
  void initState() {
    super.initState();

    /* pause 5 seconds */
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _list = [];
      });
    });
  }

  Widget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text('flutter example'),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_list.isEmpty) {
      return Center(
        child: Text('List is empty.'),
      );
    }

    return ListView.builder(
      itemCount: _list.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(_list[index]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_list == null) return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {

          Future.delayed(Duration(seconds: 1), () {
            setState(() {
              _list.add('no. ${_list.length + 1}');
              _isLoading = false;
            });
          });

          setState(() {
            _isLoading = true;
          });
        },
      ),
    );
  }
}
