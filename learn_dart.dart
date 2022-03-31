// Learn Dart https://dart.cn/samples

void helloWorld(){
  // 你好,世界! https://dart.cn/samples#hello-world
  print('Hello World!');
}

var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter','Saturn','Uranus','Neptune'];//列表
  var image = {
  'tags':['saturn'],
  'url':'//path/to/saturn.jpg'
  };//字典
void variables(){
  // 变量 https://dart.cn/samples#variables
  print('name is $name, year is $year, antennaDiameter is $antennaDiameter,flybyObjects is $flybyObjects, image is $image');
}

void main(){  
  helloWorld();
  variables();
}