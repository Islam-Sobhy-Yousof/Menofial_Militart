import 'dart:async';

import 'package:menofia_military/presentation/common/state_renderer/state_renderer_impl.dart';

abstract class BaseViewModel with BaseViewModelInputs, BaseViewModelOutputs {
  
  final StreamController<FlowState> __inputStreamController  = StreamController<FlowState>.broadcast();

  @override
  Sink get inputState => __inputStreamController.sink;

  @override
  Stream<FlowState> get outputState => __inputStreamController.stream.map((flowState) => flowState);


  @override
  void dispose() {
    __inputStreamController.close();
  }
}

mixin BaseViewModelInputs {
  void start(); 

  void dispose(); 

  Sink get inputState;

}

mixin BaseViewModelOutputs {
  Stream<FlowState> get outputState;
}

