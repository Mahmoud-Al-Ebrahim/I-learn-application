import 'package:bloc/bloc.dart';
import 'package:graduation_project/features/search/Presentation/save_items/save_item_state.dart';
import 'package:meta/meta.dart';

class SaveItemCubit extends Cubit<SaveItemState> {
  List<int>saved=[0];
  SaveItemCubit() : super(SaveItemChanged([0]));
  void addItem(int index){
    saved.add(index);
    emit(SaveItemChanged(saved));
  }
  void removeItem(int index){
    saved.remove(index);
    emit(SaveItemChanged(saved));
  }
}
