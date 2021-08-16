import 'package:flutter/material.dart';
import './Todo.dart';
import './TodoTile.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

class TodoList extends StatelessWidget {

  final ScrollController _scrollController = ScrollController();
  static List<int> entries = List.generate(
      100, (index) => index);


  @override
  Widget build(BuildContext context) {

    return Scrollbar(
      isAlwaysShown: true,
      thickness: 25,
      showTrackOnHover: true,
      interactive: true,
      controller: _scrollController,
      // backgroundColor: Colors.grey,

      child: ListView.separated(
        controller: _scrollController,
        cacheExtent: double.infinity,
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoTile(index:index) ;

        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
      // isAlwaysShown: true,
      // showTrackOnHover: true,
    );
  }
}
