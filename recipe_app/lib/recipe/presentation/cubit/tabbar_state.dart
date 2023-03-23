part of 'tabbar_cubit.dart';

@immutable
abstract class TabbarState {}


class TabBarSelected extends TabbarState {
  final int selectedIndex;
  TabBarSelected({required this.selectedIndex});
}