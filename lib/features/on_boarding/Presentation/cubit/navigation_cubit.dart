import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_state.dart';
class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationToPage(0));

  void navigateToPage(int index)=>emit(NavigationToPage(index));
}
