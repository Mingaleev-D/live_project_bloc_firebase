part of 'remember_switch_cubit.dart';

@immutable
abstract class RememberSwitchState {}

class RememberSwitchInitial extends RememberSwitchState {}

class SwitchChangedState extends RememberSwitchState {
  final bool value;

  SwitchChangedState(this.value);
}
