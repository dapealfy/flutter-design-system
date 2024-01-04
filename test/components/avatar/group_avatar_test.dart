// import 'package:flutter_design_system/funds.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// import '../../utils/test_utils.dart';
//
// void main() {
//   group('Group Text FunDsAvatar Test', () {
//     List<String> listInitialUsers = [
//       'AB',
//       'CD',
//       'EF',
//       'GH',
//       'IJ',
//     ];
//
//     List<FunDsAvatar> listAvatar = listInitialUsers.map((user) {
//       return FunDsAvatar(
//         size: FunDsAvatarSize.medium,
//         initialText: user,
//       );
//     }).toList();
//
//     testWidgets(
//       'Group Text FunDsAvatar with +1',
//       (tester) async {
//         await tester.pumpWidget(
//           buildTestableWidget(
//             child: FunDsGroupAvatar(
//               listAvatar: listAvatar,
//               size: FunDsAvatarSize.large,
//             ),
//           ),
//         );
//
//         expect(find.byType(FunDsGroupAvatar), findsOneWidget);
//         expect(find.text('+1'), findsOneWidget);
//       },
//     );
//   });
// }
