import 'package:bloc/bloc.dart';

enum NavigationEvents {
  DashboardClickedEvent,
  MessagesClickedEvent,
  UtilityClickedEvent
}

// abstract class NavigationStates {}

// class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
//   final Function onMenuTap;

//   NavigationBloc({this.onMenuTap});

//   @override
//   NavigationStates get initialState => null(
//         onMenuTap: onMenuTap,
//       );

//   @override
//   Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
//     switch (event) {
//       case NavigationEvents.DashboardClickedEvent:
//         // yield MyCardsPage(
//         //   onMenuTap: onMenuTap,
//         // );
//         break;
//       case NavigationEvents.MessagesClickedEvent:
//         // yield MessagesPage(
//         //   onMenuTap: onMenuTap,
//         // );
//         break;
//       case NavigationEvents.UtilityClickedEvent:
//         // yield UtilityBillsPage(
//         //   onMenuTap: onMenuTap,
//         // );
//         break;
//     }
//   }
// }
