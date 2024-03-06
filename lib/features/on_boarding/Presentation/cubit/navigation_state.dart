

import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable{}
class NavigationToPage extends NavigationState {
  final int pageNumber;
  NavigationToPage(this.pageNumber);
  @override
  // TODO: implement props
  List<Object?> get props => [pageNumber];
}
