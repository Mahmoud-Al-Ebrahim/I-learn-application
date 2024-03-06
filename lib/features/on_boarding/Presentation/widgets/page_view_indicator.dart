import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/on_boarding/Presentation/cubit/navigation_cubit.dart';
import '../cubit/navigation_state.dart';
import 'active_circle.dart';
import 'inactive_circle.dart';
class PageViewIndicator extends StatefulWidget {
  const PageViewIndicator({Key? key}) : super(key: key);

  @override
  _PageViewIndicatorState createState() => _PageViewIndicatorState();
}

class _PageViewIndicatorState extends State<PageViewIndicator> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit,NavigationState>(
     builder: (context,state) {
          if(state is NavigationToPage)
            {
              return Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    state.pageNumber==0? const ActiveCircle():const InactiveCircle(),
                    state.pageNumber==1?const ActiveCircle():const InactiveCircle(),
                    state.pageNumber==2?const ActiveCircle():const InactiveCircle(),
                  ],
                ),
              );
            }
          else {
            return Container();
          }
       }
        );
  }
}
