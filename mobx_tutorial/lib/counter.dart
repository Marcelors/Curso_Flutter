import 'package:mobx/mobx.dart';

part 'counter.g.dart';


class Counter = _Counter with _$Counter;

 abstract class _Counter with Store{
//
//  Counter(){
//    increment = Action(_increment);
//  }
//
//  Observable _count = Observable(0);
//
//  int get count => _count.value;
//
//  Action increment;
//
//  void _increment(){
//    _count.value++;
//  }

  @observable
  int count = 0;

  @action
  void increment(){
    count++;
  }
}