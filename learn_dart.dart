// Learn Dart https://dart.cn/samples

// 导入（import） https://dart.cn/samples#imports
//import 'dart:math';导入math库
//import 'package:test/test.dart';导入外部包的文件
import 'dart:async'; //StreamController
import 'dart:ffi';
import 'dart:io';
import './import_test.dart';

////////////////////////////////////////////////////////////////////////////////
void helloWorld() {
  // 你好,世界! https://dart.cn/samples#hello-world
  print('Hello World!');
}

////////////////////////////////////////////////////////////////////////////////
var name = 'Voyager I';
var year = 1977;
var antennaDiameter = 3.7;
var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune']; //列表
var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg'
}; //字典
void variables() {
  // 变量 https://dart.cn/samples#variables
  print(
      'name is $name, year is $year, antennaDiameter is $antennaDiameter,flybyObjects is $flybyObjects, image is $image');
}

////////////////////////////////////////////////////////////////////////////////
void flowControl() {
  // 流程控制 https://dart.cn/samples#control-flow-statements

  for (final object in flybyObjects) {
    //for(var obj in flybyObjects){这样也可以输出
    //print(obj);
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }
  var years = [1977, 2010, 2022];
  for (year in years) {
    print('----------------------');
    print('At first year is $year');
    if (year >= 2001) {
      print('21st century');
    } else if (year >= 1901) {
      print('20th century');
    }

    while (year < 2016) {
      year += 1;
    }

    print('At last year is $year');
  }
}

////////////////////////////////////////////////////////////////////////////////
int fibonacci(int n) {
  if (n == 0 || n == 1) return 1;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

void function() {
  // 函数 https://dart.cn/samples#functions

  var result = fibonacci(20);
  print('fibonacci(20)的运行结果为：$result');
  flybyObjects.where((name) => name.contains('turn')).forEach(print);
  //where筛选条件是一个匿名函数（=>胖箭头），forEach对于每一个列表中的元素都调用该方法
}
////////////////////////////////////////////////////////////////////////////////
// 注释 https://dart.cn/samples#comments

/// 这是一个文档注释。
/// 文档注释用于为库、类以及类的成员添加注释。
/// 像IDE和dartdoc这样的工具可以专门处理文档注释。
/* 也可以像这样使用单斜杠/和星号*的注释方式 */
////////////////////////////////////////////////////////////////////////////////
class Spacecraft {
  String name;
  DateTime? launchDate;

  int? get launchYear => launchDate?.year;
  //有问号不自动检查是否为null

  Spacecraft(this.name, this.launchDate) {
    //初始化代码（构造器）
  }

  Spacecraft.unlaunched(String name) : this(name, null);
  //这个也是一个构造器

  void describe() {
    print('Spacecraft: $name');
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(String name, DateTime launchDate, this.altitude)
      : super(name, launchDate);
}

void learnClass() {
  // 类 https://dart.cn/samples#classes
  // 扩展类（继承） https://dart.cn/samples#inheritance
  var launchTime1 = DateTime(1970, 4, 24, 21, 35);
  var craft1 = Spacecraft('东方红', launchTime1);
  var craft2 = Spacecraft.unlaunched('未发射的航天器');
  print('Spacecraft1');
  craft1.describe();
  print(' ');
  print('Spacecraft2');
  craft2.describe();
  print('');
  var orbiter = Orbiter('orbiter', launchTime1, 12.4);
  orbiter.describe();
  print(orbiter.altitude);
}

////////////////////////////////////////////////////////////////////////////////
mixin Piloted {
  // 添加一个功能
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(String name, DateTime? launchDate) : super(name, launchDate);
  PilotedCraft.unlaunched(String name) : super.unlaunched(name);

  @override
  void describe() {
    describeCrew();
    super.describe();
  }
}

void learnMixins() {
  // mixin https://dart.cn/samples#mixins
  var pilotedCraft = PilotedCraft.unlaunched('PilotedCraft');
  print('');
  pilotedCraft.describe();
}

////////////////////////////////////////////////////////////////////////////////
class MockSpaceship extends Describable implements Spacecraft {
  @override
  String name;
  MockSpaceship(this.name);
  @override
  DateTime? launchDate;

  @override
  void describe() {
    print('new implement describe function');
  }

  @override
  int? get launchYear => launchDate?.year;
}

abstract class Describable {
  void describe();
  void describeWithEmphasis() {
    print('=' * 10);
    describe();
    print('=' * 10);
  }
}

void learnInterface() {
  // 接口和抽象类 https://dart.cn/samples#interfaces-and-abstract-classes
  var mockSpaceship = MockSpaceship('mock');
  mockSpaceship.describeWithEmphasis();
}

////////////////////////////////////////////////////////////////////////////////
const oneSecond = Duration(seconds: 1);
Future<void> printWithDelay1(String message) async {
  await Future.delayed(oneSecond);
  print(message);
}

Future<void> printWithDelay2(String message) {
  return Future.delayed(oneSecond).then((_) {
    print(message);
  });
}

Future<void> createDescriptions(Iterable<String> objects) async {
  for (final object in objects) {
    try {
      var file = File('$object.txt');
      if (await file.exists()) {
        var modified = await file.lastModified();
        print('File for %object already exists. It was modified on $modified.');
        continue;
      }
      await file.create();
      await file.writeAsString('Start describing $object in this file.');
    } on IOException catch (e) {
      print('Cannot create description for $object: $e');
    }
  }
}

Stream<String> report(Spacecraft craft, Iterable<String> objects) async* {
  for (final object in objects) {
    await Future.delayed(oneSecond);
    yield '${craft.name} flies by $object';
    //用于从流中发出值
  }
}

Future<void> streamAdvance() async {
  StreamController<double> ctl = StreamController<double>();
  Stream stm = ctl.stream;
  stm.listen((event) {
    print('event from controller is: $event');
  });

  Future<void> addWithDelay(value) async {
    await Future.delayed(oneSecond);
    ctl.add(value);
  }

  await addWithDelay(11.1); //等11.1完成后再进行22.2
  addWithDelay(22.2);
  addWithDelay(33.3);
}

void learnAsyncAndStream() {
  // AsyncAndStream https://dart.cn/samples#async
  // StreamAdvanced https://www.jianshu.com/p/f9af079782af
  print('1');
  printWithDelay1('2');
  print('3');
  printWithDelay2('4');
  var objs = <String>[];
  objs.addAll(['111', '222', '333', '444']);
  createDescriptions(objs);
  var craft1 = Spacecraft('东方红', DateTime(1970, 4, 24, 21, 35));
  var craft2 = Spacecraft.unlaunched('未发射的航天器');
  var mockSpaceship = MockSpaceship('mock');
  var pilotedCraft = PilotedCraft.unlaunched('PilotedCraft');
  report(craft1, objs).forEach(print);
  streamAdvance();
}

////////////////////////////////////////////////////////////////////////////////
void NotZeroError(value) {
  if (value != 0) {
    throw StateError('Not Zero');
  } else {
    print('value is $value = 0');
  }
}

void learnError() async {
  for (final obj in flybyObjects) {
    var file = File('$obj.txt');
    if (!await file.exists()) {
      await file.create();
      await file.writeAsString('Start describing $obj in this file');
    }
  }
  try {
    print('请输入一个数字（为0进入下一个Exception，不为0为Error测试）');
    stdout.write('>>');
    String? str = stdin.readLineSync();
    if (str != null) {
      int num = int.parse(str);
      NotZeroError(num);
    } else {
      print('输入的不是数字哦~');
    }
    flybyObjects.addAll(['111', '222', '333', '123']);
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (ex) {
    print('Could not describe object: $ex');
  } on StateError catch (error) {
    print(error);
  } on FormatException catch (ex) {
    print('输入的不是数字哦~');
    print(ex);
  } finally {
    flybyObjects.clear();
  }
}

void main() {
  //helloWorld();
  //variables();
  //flowControl();
  //function();
  //importTest();
  //learnClass();
  //learnMixins();
  //learnInterface();
  //learnAsyncAndStream();
  learnError();
}
