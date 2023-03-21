import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tabbar_state.dart';


class TabBarCubit extends Cubit<TabbarState> {
  TabBarCubit() : super(TabBarSelected(selectedIndex: 0));

  void selectTab(int index) {
    emit(TabBarSelected(selectedIndex: index));
  }
}