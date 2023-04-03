// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'onbardingState.dart';

class OnbardingCubit extends Cubit<OnbardingState> {
  OnbardingCubit() : super(OnbardingInitial()) {
    // getInitialState();
    updatePageIndex(activePageIndex);
  }

  int activePageIndex = 0;

  // getInitialState() {
  //   print(activePageIndex);
  //   emit(OnboardingLoaded(activePageIndex: activePageIndex));
  // }

  updatePageIndex(int newPageIndex) {
    print("called");
    emit(OnbardingInitial());
    // ignore: avoid_print
    print(newPageIndex);
    activePageIndex = newPageIndex;
    emit(OnboardingLoaded(activePageIndex: newPageIndex));
  }
}
