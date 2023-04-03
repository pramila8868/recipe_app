// ignore: file_names, depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'checkboxState.dart';

class CheckboxCubit extends Cubit<bool> {
  CheckboxCubit() : super(false);
  void updateCheckbox() {
    emit(!state);
  }
}
