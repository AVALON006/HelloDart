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

void flowControl(){
  // 流程控制 https://dart.cn/samples#control-flow-statements

  for(final object in flybyObjects){
  //for(var obj in flybyObjects){这样也可以输出
    //print(obj);
    print(object);
  }

  for(int month = 1;month <= 12;month++){
    print(month);
  }
  var years = [1977,2010,2022];
  for(year in years){
    print('----------------------');
    print('At first year is $year');
    if(year >= 2001){
      print('21st century');
    }else if(year >= 1901){
      print('20th century');
    }

    while(year < 2016){
      year += 1;
    }

    print('At last year is $year');
  }
}

void main(){  
  //helloWorld();
  //variables();
  flowControl();
}