// 流程控制 https://dart.cn/samples#control-flow-statements
void flowControl(int year){
  print('At first year is $year');
  var flybyObjects = ['Jupiter','Saturn','Uranus','Neptune'];

  if(year >= 2001){
    print('21st century');
  }else if(year >= 1901){
    print('20th century');
  }

  for(final object in flybyObjects){
  //for(var obj in flybyObjects){这样也可以输出
    //print(obj);
    print(object);
  }

  for(int month = 1;month <= 12;month++){
    print(month);
  }

  while(year < 2016){
    year += 1;
  }

  print('At last year is $year');
  print('----------------------');
}

void main(){
  flowControl(1997);
  flowControl(2010);
  flowControl(2022);
}