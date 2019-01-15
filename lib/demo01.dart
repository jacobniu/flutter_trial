import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

// 程序入口，单行函数写法
void main() => runApp(App());

// 根据官方起步教程添加一个简易列表的演示
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: '标题1',
        theme: new ThemeData(primaryColor: Colors.white),
        home: new RandomWords());
  }
}

// 添加一个有状态的控件
class RandomWords extends StatefulWidget {
  // 单行函数可以这样简写
  @override
  createState() => new RandomWordState();
}

class RandomWordState extends State<RandomWords> {
  // 用于存储item数据的类似数组的数据结构
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0, color: Colors.green);
  // 用于存储用户喜欢的条目的集合
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("单词列表"),
        backgroundColor: Colors.deepOrangeAccent,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), color: Colors.blue ,onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  // 跳转到新的保存了喜欢条目的页面
  void _pushSaved() {
    final _favFont = new TextStyle(color: Colors.red, fontSize: 30.0);
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final titles = _saved.map((pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: _favFont,
          ),
        );
      });
      final divided =
          ListTile.divideTiles(tiles: titles, context: context).toList();
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("喜爱列表"),
        ),
        body: new ListView(
          children: divided,
          padding: const EdgeInsets.only(left: 16.0, top: 20.0),
        ),
      );
    }));
  }

  // 构建列表
  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          // 如果行的索引为基数则添加一条分割线
          if (i.isOdd) return new Divider(
            color: Colors.deepPurple,
          );
          final index = i ~/ 2;
          // 如果时列表的最后一个单词
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  // 构建列表的一个item
  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      // 开头部分的标题文本
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      subtitle: new Text(
        pair.asLowerCase,
        style: new TextStyle(
          color: Colors.black,
          fontSize: 12.0
        ),
      ),
      // 尾部添加一个icon
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        // 调用setState()会触发State对象的build方法，从而导致ui的更新
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
