import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<String>_listData;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listData=List();
    _listData.add("A");
    _listData.add("B");
    _listData.add("C");
    _listData.add("D");
    _listData.add("F");
    _listData.add("G");
    _listData.add("H");
    _listData.add("I");
    _listData.add("J");
    _listData.add("K");
    _listData.add("L");
    _listData.add("M");
    _listData.add("N");
    _listData.add("O");
    _listData.add("P");
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text("Listview Drag and Drop"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(

        child: ReorderableListView(
          header:
          Container(
             margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                border: Border.all(color: Colors.white,width: 2),
                borderRadius: BorderRadius.all(Radius.circular(4))
            ),

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("ReorderableListView",textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white,fontSize: 18),),
            ),
          ),
            children: <Widget>[
              for(final item in _listData)
          getChildItems(item,context)
             /* ListTile(
                key: ValueKey(item),
                title: Text('Item $item'),
              ),*/

            ],
            onReorder: (oldIndex,newIndex){

                _updateMyItems(oldIndex,newIndex);


            }
        ),
      ),
    // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget getChildItems(_item,_context)
  {
    return Padding(
      key: ValueKey(_item),

      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Selected Item $_item"),duration: Duration(milliseconds: 500),));
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            border: Border.all(color: Colors.white,width: 2),
            borderRadius: BorderRadius.all(Radius.circular(4))
          ),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_item+" Items",textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white,fontSize: 18),),
          ),
        ),
      ),
    );
  }

  _updateMyItems(int old,int newIndex)
  {
    setState(() {

      if(newIndex>old)
        {
          newIndex-=1;
        }
        var item=_listData.removeAt(old);
      _listData.insert(newIndex, item);


    });

  }
}
