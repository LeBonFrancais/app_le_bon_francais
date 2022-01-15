import 'package:flutter/material.dart';

class ResearchScreen extends StatefulWidget {
  const ResearchScreen({Key? key}) : super(key: key);

  //`createState()` will create the mutable state for this widget at
  //a given location in the tree.
  @override
  _ResearchScreenState createState() => _ResearchScreenState();
}

//Our Home state, the logic and internal state for a StatefulWidget.
class _ResearchScreenState extends State<ResearchScreen> {
  final _searchview = TextEditingController();

  bool _firstSearch = true;
  String _query = "";

  List<String>? _nebulae;
  List<String>? _filterList;

  @override
  void initState() {
    super.initState();
    _nebulae = <String>[];
    _nebulae = [
      "Mathys",
      "Baptiste",
      "Thaïs",
      "Tanguy",
      "Louis",
      "Théo",
      "Mélissa",
      "Ant",
      "Bernad 68",
      "Flame",
      "Eagle",
      "Horse Head",
      "Elephant's Trunk",
      "Butterfly"
    ];
    _nebulae!.sort();
  }

  _ResearchScreenState() {
    //Register a closure to be called when the object changes.
    _searchview.addListener(() {
      if (_searchview.text.isEmpty) {
        //Notify the framework that the internal state of this object has changed.
        setState(() {
          _firstSearch = true;
          _query = "";
        });
      } else {
        setState(() {
          _firstSearch = false;
          _query = _searchview.text;
        });
      }
    });
  }

//Build our Home widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SearchView ListView"),
      ),
      backgroundColor: Colors.redDark,
      body: Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: Column(
          children: <Widget>[
            _createSearchView(),
            _firstSearch ? _createListView() : _performSearch()
          ],
        ),
      ),
    );
  }
  //Create a SearchView
  Widget _createSearchView() {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1.0),color: Colors.darkblue),
      child: TextField(
        cursorColor: Colors.white,
        controller: _searchview,
        decoration: const InputDecoration(
          fillColor: Colors.white,
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.white),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
  //Create a ListView widget
  Widget _createListView() {
    return Flexible(
      child: ListView.builder(
          itemCount: _nebulae!.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white,
              elevation: 5.0,
              child: Container(
                margin: const EdgeInsets.all(15.0),
                child: Text(_nebulae![index]),
              ),
            );
          }),
    );
  }
  //Perform actual search
  Widget _performSearch() {
    _filterList = <String>[];
    for (int i = 0; i < _nebulae!.length; i++) {
      var item = _nebulae![i];

      if (item.toLowerCase().contains(_query.toLowerCase())) {
        _filterList?.add(item);
      }
    }
    return _createFilteredListView();
  }
  //Create the Filtered ListView
  Widget _createFilteredListView() {
    return Flexible(
      child: ListView.builder(
          itemCount: _filterList!.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white,
              elevation: 5.0,
              child: Container(
                margin: const EdgeInsets.all(15.0),
                child: Text(_filterList![index]),
              ),
            );
          }),
    );
  }
}