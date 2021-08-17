// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';
import 'package:hello_world_in_flutter/ActivityBrief.dart';
import 'package:hello_world_in_flutter/objects/Activity.dart';
import './TodoList.dart';
import './FullActivity.dart';
import './ActivityBrief.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(textTheme: TextTheme(bodyText2: GoogleFonts.pacifico(textStyle: TextStyle(color: Color(0xffF7A440))),bodyText1: GoogleFonts.pacifico(textStyle: TextStyle(color: Color(0xffF7A440))),subtitle1:GoogleFonts.pacifico(textStyle:TextStyle(color: Color(0xffF7A440),fontWeight:FontWeight.w100)))),
        title: 'FamilyApp trial',
        home: Scaffold(
          backgroundColor: Colors.white,
          body: ActivityBrief(activity: Activity('Eating together', 70,
              ['Eman Ahmed', 'Yasser AbdelRaouf', 'Omar Yasser'], 1, 2)),
        ));
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  _MyWidgetState createState() => _MyWidgetState();
}

class stflWid extends StatefulWidget {
  const stflWid({Key? key}) : super(key: key);

  @override
  _stflWidState createState() => _stflWidState();
}

class _stflWidState extends State<stflWid> {
  @override
  int count = 43;

  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      GestureDetector(
        onTap: () {
          setState(() {
            count++;
          });
        },
        child: Icon(
          Icons.star,
          color: Colors.red,
        ),
      ),
      Text('$count')
    ]);
  }
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            child: Image(
              height: 250.0,
              width: constraints.maxWidth,
              image: AssetImage('assets/overthinking1.jpg'),
              fit: BoxFit.fill,
            ),
          );
        }),
        ListTile(
            title: Text("Hello there world of flutter"),
            subtitle: Text('yes I\'m here'),
            trailing: stflWid()),
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.lightBlue,
                      ),
                      Text(
                        'CALL',
                        style: TextStyle(color: Colors.lightBlue),
                      )
                    ],
                  )),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Icon(
                        Icons.near_me,
                        color: Colors.lightBlue,
                      ),
                      Text(
                        'ROUTE',
                        style: TextStyle(color: Colors.lightBlue),
                      )
                    ],
                  )),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Icon(
                        Icons.share,
                        color: Colors.lightBlue,
                      ),
                      Text(
                        'SHARE',
                        style: TextStyle(color: Colors.lightBlue),
                      )
                    ],
                  ))
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.all(10),
            child: Text(
                'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                'Alps. Situated 1,578 meters above sea level, it is one of the '
                'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                'half-hour walk through pastures and pine forest, leads you to the '
                'lake, which warms to 20 degrees Celsius in the summer. Activities '
                'enjoyed here include rowing, and riding the summer toboggan run.'))
      ],
    ));
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        // NEW lines from here...
        builder: (BuildContext context) {
          final tiles = _saved.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(context: context, tiles: tiles).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        }, // ...to here.
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return const Divider();
          /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        // NEW from here...
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        // NEW lines from here...
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
