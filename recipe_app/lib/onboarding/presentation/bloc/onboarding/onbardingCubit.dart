import 'package:bloc/bloc.dart';
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
    print(newPageIndex);
    activePageIndex = newPageIndex;
    emit(OnboardingLoaded(activePageIndex: newPageIndex));
  }
}
