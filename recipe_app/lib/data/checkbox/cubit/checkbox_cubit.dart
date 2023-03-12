import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'checkbox_state.dart';

class CheckboxCubit extends Cubit<bool> {
  CheckboxCubit() : super(false);
  void updateCheckbox() {
    emit(!state);
  }
}
