// Learn Dart https://dart.cn/samples

// 导入（import） https://dart.cn/samples#imports
//import 'dart:math';导入math库
//import 'package:test/test.dart';导入外部包的文件
import './import_test.dart';

void helloWorld() {
  // 你好,世界! https://dart.cn/samples#hello-world
  print('Hello World!');
}

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

// 注释 https://dart.cn/samples#comments

/// 这是一个文档注释。
/// 文档注释用于为库、类以及类的成员添加注释。
/// 像IDE和dartdoc这样的工具可以专门处理文档注释。
/* 也可以像这样使用单斜杠/和星号*的注释方式 */

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

void main() {
  //helloWorld();
  //variables();
  //flowControl();
  //function();
  //importTest();
  learnClass();
  learnMixins();
}
