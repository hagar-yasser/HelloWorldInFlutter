import 'package:flutter/material.dart';
import 'package:hello_world_in_flutter/Todo.dart';

class TodoTile extends StatefulWidget {
  final int index;
  const TodoTile({Key? key, required this.index}) : super(key: key);

  @override
  _TodoTileState createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  bool checked=false;
  TextStyle style=TextStyle();
  Widget build(BuildContext context) {
    print('building ' + widget.index.toString());
    return ListTile(
      leading: Checkbox(

        value: checked,
        onChanged: (bool? value) {
          setState(() {
            checked = value!;
            if(checked)
              style=TextStyle(decoration: TextDecoration.lineThrough);
            else style=TextStyle();

          });
          final snackBar = SnackBar(
            content: Text(checked?"checked!":"Unchecked :("),
            duration:const Duration(milliseconds: 500),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      ),
      title: Text('tile number${widget.index}',style:style),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(context)=>
            ToDo(
                title: 'the no.${widget.index} title',
                desc: 'the no.${widget.index} descrtiption'
            )
        ));
      },
    );
  }
}

