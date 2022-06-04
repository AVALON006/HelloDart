// Dart库概览 https://dart.cn/guides/libraries/library-tour

import 'dart:collection';
import 'dart:async';
import 'dart:html';

////////////////////////////////////////////////////////////////////////////////
// 核心库（自带） https://dart.cn/guides/libraries/library-tour#dartcore---numbers-collections-strings-and-more
// dart:core API reference https://api.dart.cn/stable/dart-core/dart-core-library.html
class Point {
  num x, y;
  Point()
      : this.x = -1,
        this.y = -1;
  Point.set(this.x, this.y);
  Point.origin() : this.set(0, 0);
  void showVal() {
    print('x: $x, y: $y');
  }
}

class test {
  test() {
    print('test from class');
  }
}

void printFunc() {
  //控制台打印 https://dart.cn/guides/libraries/library-tour#printing-to-the-console
  String tea = 'Black tea';
  print('Hello');
  print('I drink $tea');
  print(tea);

  var nums = [1, 2, 4, 8, 16, 32, 64, 128];
  print(nums);

  Point o = Point.origin();
  Point p = Point.set(10, 10);
  print(Point);
  print(test);
  print(test());
  print(o);
  print(p);
}

void number() {
  //数字 https://dart.cn/guides/libraries/library-tour#numbers
  // int API https://api.dart.cn/stable/dart-core/int-class.html
  // double API https://api.dart.cn/stable/dart-core/double-class.html
  // num API https://api.dart.cn/stable/dart-core/num-class.html
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);
  assert(num.parse('42') is int);
  assert(num.parse('0x42') is int);
  assert(num.parse('0.50') is double);
  assert(int.parse('42', radix: 16) == 66);
  assert(42.toString() == '42');
  assert(123.456.toString() == '123.456');
  assert(123.456.toStringAsFixed(2) == '123.46');
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  //科学计数法
  assert(double.parse('1.2e+2') == 120.0);
}

void stringAreg() {
  //字符和正则表达式 https://dart.cn/guides/libraries/library-tour#strings-and-regular-expressions
  // String API docs https://api.dart.cn/stable/dart-core/String-class.html
  // StringBuffer https://api.dart.cn/stable/dart-core/StringBuffer-class.html
  // Pattern https://api.dart.cn/stable/dart-core/Pattern-class.html
  // RegExp https://api.dart.cn/stable/dart-core/RegExp-class.html
  // Match https://api.dart.cn/stable/dart-core/Match-class.html
  assert('Never odd or even'.contains('odd'));
  assert('Never odd or even'.startsWith('Never'));
  assert('Never odd or even'.endsWith('even'));
  assert('Never odd or even'.indexOf('odd') == 6);
  //从第六位是odd前面的一位数字
  assert('Never odd or even'.substring(6, 9) == 'odd');
  //(6,9]
  var parts = 'progressive web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[0] == 'progressive');
  assert('Never odd or even'[0] == 'N');
  //"Never odd or even"是一个回文的句子neveroddorenen
  for (final char in 'hello'.split('')) {
    print(char);
  }
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);
  assert(String.fromCharCode(78) == 'N');
  assert('web apps'.toUpperCase() == 'WEB APPS');
  assert('WEB APPS'.toLowerCase() == 'web apps');
  //不支持所有语言，比如土耳其的转换不正确，但是大部分都是正确的
  assert('   hello   '.trim() == 'hello');
  assert(''.isEmpty);
  assert('    '.isNotEmpty);
  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');
  assert(greeting != greetingTemplate);
  //所有的字符串操作都是返回一个新的字符串对象
  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');

  var fullString = sb.toString();
  assert(fullString == 'Use a StringBuffer for efficient string creation.');

  var numbers = RegExp(r'\d+'); //正则表达式

  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';
  //美洲驼寿命为15-20岁

  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));
  var exedOut = someDigits.replaceAll(numbers, 'XX');
  assert(exedOut == 'llamas live XX to XX years');

  assert(numbers.hasMatch(someDigits));
  //检查字符串中是否有正则表达式的匹配
  for (final match in numbers.allMatches(someDigits)) {
    print(match.group(0));
  }
}

void collection() {
  //集合 https://dart.cn/guides/libraries/library-tour#collections
  //Lists
  // List API docs https://api.dart.cn/stable/dart-core/List-class.html
  var grains = <String>[];
  assert(grains.isEmpty);

  var fruits = ['apples', 'organges'];
  //List为[]
  var list = [];
  assert(list is List);

  fruits.add('kiwis');
  fruits.addAll(['grapes', 'bananas']);
  assert(fruits.length == 5);

  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);
  assert(!fruits.contains('apples'));

  fruits.clear();
  assert(fruits.isEmpty);

  var vegetables = List.filled(99, 'broccoli'); //西兰花
  assert(vegetables.every((v) => v == 'broccoli'));

  fruits.addAll(['apples', 'organges']);
  assert(fruits[0] == 'apples');
  assert(fruits.indexOf('apples') == 0);

  fruits.insert(0, 'bananas');
  assert(fruits[0] != 'apples');
  fruits.sort((a, b) => a.compareTo(b));
  assert(fruits[0] == 'apples');

  fruits = <String>[]; //指定list包含的元素类型
  fruits.insert(0, 'watermelon');
  var fruit = fruits[0];
  assert(fruit is String);
  //fruits.add(5);
  //报错，int不能赋值给String类型

  //Sets
  // Set API docs https://api.dart.cn/stable/dart-core/Set-class.html
  var ingredients = <String>{};

  var set = <String>{};
  var testSet = {};
  //Set 不能通过{}创建，必须通过<>{}创建
  assert(!(testSet is Set));
  var testSet2 = <Object>{};
  assert(testSet2 is Set);
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);
  ingredients.add('gold');
  assert(ingredients.length == 3);
  ingredients.remove('gold');
  assert(ingredients.length == 2);
  assert(ingredients.contains('titanium'));
  assert(ingredients.containsAll(['titanium', 'xenon']));

  var atomicNumbers = Set.from([79, 22, 54]);
  //通过List来生成Set
  atomicNumbers.add(79);
  assert(atomicNumbers.length == 3);

  var nobleGases = Set.from(['xenon', 'argon']);
  var intersection = ingredients.intersection(nobleGases);
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));

  //Maps
  // Map API docs https://api.dart.cn/stable/dart-core/Map-class.html
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu'],
  };
  var searchTerms = Map();
  var map = {};
  //Map也可以通过{}来创建
  assert(map is Map);
  var int2string = Map<int, String>();
  //Map可以在创建的时候指定对应的类型
  var int2gas = {54: 'xenon'};
  int2string.addAll({
    54: 'xenon',
    79: 'helium',
    90: 'radium',
  });
  //通过大括号可以给map添加、获取、设置元素
  assert(int2gas[54] == 'xenon');
  assert(int2gas.containsKey(54));
  assert(int2string[54] == 'xenon');
  assert(int2string.containsKey(54));
  int2gas.remove(54);
  assert(!int2gas.containsKey(54));

  assert(hawaiianBeaches.containsKey('Oahu'));
  assert(!hawaiianBeaches.containsKey('Florida'));
  print(hawaiianBeaches['Oahu']);
  print(hawaiianBeaches['Floridad']); //当找不到值的时候，返回null

  var keys = hawaiianBeaches.keys;
  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));

  var values = hawaiianBeaches.values;
  //得到的值values为无序集合（an Iterble of Lists）
  assert(values.length == 3);
  print(values);
  assert(values.any((v) => v.contains('Waikiki')));

  var teamAssignments = <String, String>{};
  String pickToughestKid() {
    return 'pickToughestKid';
  }

  teamAssignments.putIfAbsent('Catcher', () => pickToughestKid());
  assert(teamAssignments['Catcher'] != null);

  //Iterable 公共集合
  // Iterable API docs https://api.dart.cn/stable/dart-core/Iterable-class.html
  var coffees = <String>[]; //List
  var teas = ['green', 'black', 'chamomile', 'earl grey']; //List
  assert(coffees.isEmpty);
  assert(teas.isNotEmpty);
  //isEmpty和isNotEmpty都是Iterable的属性

  teas.forEach((tea) {
    print('I drink $tea');
  });

  hawaiianBeaches.forEach((key, value) {
    print('I want to visit $key and swim at $value');
  });
  var loudTeas = teas.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);
  //map()方法返回的对象是一个懒求值(lazily evaluated)对象：
  //只有访问对象里面的元素时，函数才会被调用
}

void URIs() {
  // URIs https://dart.cn/guides/libraries/library-tour#uris
  // Uri提供对字符串的编解码操作，用来处理URI特有的字符，如&和=
  // Universal Resource Identifier 统一资源标识符：标识一个资源的字符串
  // Universal Resource Locator 统一资源定位符：唯一的标志一个资源在Internet上的位置
  // Uri API docs https://api.dart.cn/stable/dart-core/Uri-class.html
  var uri = 'https://example.org/api?foo=some message';

  var encoded = Uri.encodeFull(uri); //编码
  assert(encoded == 'https://example.org/api?foo=some%20message');

  var decoded = Uri.decodeFull(encoded);
  assert(uri == decoded);

  //编码和解码所有组件
  encoded = Uri.encodeComponent(uri);
  assert(encoded == 'https%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');
  decoded = Uri.decodeComponent(encoded);
  assert(uri == decoded);

  var uri2 = Uri.parse('https://example.org:8080/foo/bar#frag');

  assert(uri2.scheme == 'https');
  assert(uri2.host == 'example.org');
  assert(uri2.path == '/foo/bar');
  assert(uri2.fragment == 'frag');
  assert(uri2.origin == 'https://example.org:8080');

  var uri3 = Uri(
      scheme: 'https', host: 'example.org', path: '/foo/bar', fragment: 'frag');

  assert(uri3.toString() == 'https://example.org/foo/bar#frag');
}

void DateAndTime() {
  // 日期和时间 https://dart.cn/guides/libraries/library-tour#dates-and-times
  //DateTime类 https://api.dart.cn/stable/dart-core/DateTime-class.html
  //Duration类 https://api.dart.cn/stable/dart-core/Duration-class.html
  var now = DateTime.now();
  print('当前时间为：${now.toString()}');
  var y2k = DateTime(2000);
  print('当前时区的2000年开始是：${y2k.toString()}');
  y2k = DateTime(2000, 1, 2);
  print('DateTime(2000, 1, 2)=${y2k.toString()}');
  y2k = DateTime.utc(2000);
  assert(y2k.millisecondsSinceEpoch == 946684800000);
  print('UTC 2000年开始是：${y2k.toString()}');
  y2k = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);
  //指定自 Unix 时代以来的日期和时间（以毫秒为单位）
  print(y2k);
  y2k = DateTime.parse('2021-05-21T00:13:14.000Z');
  var unixEpoch = DateTime.utc(1970);
  assert(unixEpoch.millisecondsSinceEpoch == 0);

  //用Duration类来计算和转换时间
  y2k = DateTime.utc(2000);
  var y2001 = y2k.add(const Duration(days: 366));
  assert(y2001.year == 2001);
  var december2000 = y2001.subtract(const Duration(days: 30));
  assert(december2000.year == 2000);
  assert(december2000.month == 12);
  var duration = y2001.difference(y2k);
  assert(duration.inDays == 366);
}

class Line implements Comparable<Line> {
  final int length;
  const Line(this.length);

  @override
  int compareTo(Line other) => length - other.length;
}

class Person {
  final String firstName, lastName;
  Person(this.firstName, this.lastName);

  @override
  int get hashCode => Object.hash(firstName, lastName);

  @override
  bool operator ==(dynamic other) {
    //dynamic会关闭变量类型检查，不过可以用于存储任何一个类型的变量
    return other is Person &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }
}

class Process {
  final String name;
  final int pid;
  Process(this.name, this.pid);
}

class ProcessIterator implements Iterator<Process> {
  final List<Process> _processes;
  int _index = -1;
  ProcessIterator(this._processes);

  @override
  Process get current => _processes[_index];
  @override
  bool moveNext() {
    if (_index < _processes.length - 1) {
      _index++;
      return true;
    } else {
      return false;
    }
  }
}

class Processes extends IterableBase<Process> {
  final List<Process> _processes;

  @override
  final Iterator<Process> iterator;

  Processes(this._processes) : iterator = ProcessIterator(_processes);
}

void tools() {
  //工具类 https://dart.cn/guides/libraries/library-tour#utility-classes
  //比较 Comparable接口
  var short = const Line(1);
  var long = const Line(100);
  assert(short.compareTo(long) < 0);

  //比较自定义类
  var p1 = Person('Bob', 'Smith');
  var p2 = Person('Bob', 'Smith');
  var p3 = 'not a person';
  assert(p1.hashCode == p2.hashCode);
  assert(p1 == p2);
  assert(p1 != p3);

  //迭代器
  var processes = Processes([
    Process('dart', 127),
    Process('python', 234),
    Process('java', 325),
  ]);
  for (var process in processes) {
    print('${process.name} ${process.pid}');
  }
}

class FooException implements Exception {
  final String? msg;

  const FooException([this.msg]);

  @override
  String toString() => msg ?? 'FooException';
}

void error() {
  //异常 https://dart.cn/guides/libraries/library-tour#exceptions
  //Exception API 文档 https://api.dart.cn/stable/dart-core/Exception-class.html
  //Exceptions https://dart.cn/guides/libraries/library-tour#exceptions
  try {
    throw FooException('foo');
  } on FooException catch (e) {
    print(e);
  }
}

void learnCoreLib() {
  printFunc();
  number();
  stringAreg();
  collection();
  URIs();
  DateAndTime();
  tools();
  error();
}

////////////////////////////////////////////////////////////////////////////////
//dart:async 异步编程 https://dart.cn/guides/libraries/library-tour#dartasync---asynchronous-programming
//dart:async library API文档 https://api.dart.cn/stable/dart-async/dart-async-library.html

Future findEntryPoint() async {
  Future.delayed(Duration(seconds: 1));
  print('findEntryPoint');
  return 'entry point';
}

Future runExecutable(var entryPoint, var args) async {
  print('runExecutable');
  print(entryPoint);
  print(args);
  if (args.length == 0) {
    return 'no args';
  } else {
    return 'args: ${args.join(',')}';
  }
}

void func() {
  print('void function');
}

FutureOr<dynamic> flushThenExit(void func) {
  //void 类型表示一个值永远也不会被使用
  print('flushThenExit');
}

void runUsingFuture() {
  findEntryPoint().then((entryPoint) async {
    var args = ['--foo', '--bar'];
    return runExecutable(entryPoint, args);
  }).then(flushThenExit);
}

Future<void> runUsingAsyncAwait() async {
  var entryPoint = await findEntryPoint();
  var args = ['--foo', '--bar'];
  var result = await runExecutable(entryPoint, args);
  print(result);
  await flushThenExit(result);
}

void learnAsyncLib() async {
  runUsingFuture();
  runUsingAsyncAwait();
  //加上try catch可以捕获异常
  var url = Url.createObjectUrl('http://cn.bing.com');
  HttpRequest.getString(url).then((String result) {
    print(result);
  });
}

void main() {
  learnCoreLib();
  learnAsyncLib();
}
