import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dates_provider.g.dart';

@riverpod
class DateState extends _$DateState {
  @override

  String build() {
    return "";
  }
  void setDate (String newState) {
    state = newState;
  }  
}

@riverpod
class StartTimeState extends _$StartTimeState {
  @override

  String build() {
    return "";
  }
  void setStart (String newState) {
    state = newState;
  }  
}

@riverpod
class FinishTimeState extends _$FinishTimeState {
  @override

  String build() {
    return "";
  }
  void setFinish (String newState) {
    state = newState;
  }  
}