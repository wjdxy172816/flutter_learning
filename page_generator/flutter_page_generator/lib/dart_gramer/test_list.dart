

import 'dart:math';

void main(){

  //List<String> list =["abc","def","ghi","jkl","mno","pqr","stu","vwx","yz"];

  List<String> list =List.generate(Random().nextInt(10)+15, (index)=>"current item is $index");
  /*List<int> listss =list.map((f){
    return 123;
  }).toList();
  for(int each in listss){
    print("value is $each");
  }*/

  Iterator<String> itt =list.iterator;
  while(itt.moveNext()){
    print(itt.current);
  }

}