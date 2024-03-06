
import 'package:equatable/equatable.dart';

abstract class SaveItemState {}

class SaveItemChanged extends SaveItemState {
  List<int> saved;
  SaveItemChanged(this.saved);
}