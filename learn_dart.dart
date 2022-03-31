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
  //where筛选条件是一个匿名函数，forEach对于每一个列表中的元素都调用该方法
}

// 注释 https://dart.cn/samples#comments

/// 这是一个文档注释。
/// 文档注释用于为库、类以及类的成员添加注释。
/// 像IDE和dartdoc这样的工具可以专门处理文档注释。
/* 也可以像这样使用单斜杠/和星号*的注释方式 */

void main() {
  //helloWorld();
  //variables();
  //flowControl();
  //function();
  importTest();
}
