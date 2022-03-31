// 变量 https://dart.cn/samples#variables
void variables() {
  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter','Saturn','Uranus','Neptune'];//列表
  var image = {
  'tags':['saturn'],
  'url':'//path/to/saturn.jpg'
  };//字典

  print('name is $name, year is $year, antennaDiameter is $antennaDiameter,flybyObjects is $flybyObjects, image is $image');
}

void main(){
  //变量
  variables();
}