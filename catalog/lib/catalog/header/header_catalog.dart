import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class HeaderCatalog extends StatelessWidget {
  const HeaderCatalog({super.key});

  List<Widget> listHeader(BuildContext context, bool useDarkBg) => [
        FunDsHeader(
          key: const Key('header1'),
          useDarkBg: useDarkBg,
          automaticallyImplyBack: false,
          title: 'Title Here',
          link: 'Download',
          withSafeArea: false,
          onClickLink: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("On Click Link"),
            ));
          },
          rightIcon1: FunDsIcon(
            funDsIconography: FunDsIconography.transactionIcWithdraw,
            size: 24.w,
          ),
          onClickRightIcon1: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("On Click Right Icon 1"),
            ));
          },
          rightIcon2: FunDsIcon(
            funDsIconography: FunDsIconography.actionIcSort,
            size: 24.w,
          ),
          onClickRightIcon2: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("On Click Right Icon 2"),
            ));
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: FunDsHeader(
            key: const Key('header2'),
            useDarkBg: useDarkBg,
            automaticallyImplyBack: true,
            withSafeArea: false,
            onClickBack: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("On Click Back"),
              ));
            },
            title: 'Title Here',
            link: 'Download',
            onClickLink: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("On Click Link"),
              ));
            },
            rightIcon1: FunDsIcon(
              funDsIconography: FunDsIconography.actionIcFilter,
              size: 24.w,
            ),
            onClickRightIcon1: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("On Click Right Icon 1"),
              ));
            },
            rightIcon2: FunDsIcon(
              funDsIconography: FunDsIconography.actionIcScan,
              size: 24.w,
            ),
            onClickRightIcon2: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("On Click Right Icon 2"),
              ));
            },
          ),
        ),
        FunDsHeader(
          key: const Key('header3'),
          useDarkBg: useDarkBg,
          automaticallyImplyBack: true,
          withSafeArea: false,
          onClickBack: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("On Click Back"),
            ));
          },
          title: 'lorem ipsum dolor sit amet adispiscing',
          rightIcon1: FunDsIcon(
            funDsIconography: FunDsIconography.actionIcDownload,
            size: 24.w,
          ),
          onClickRightIcon1: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("On Click Right Icon 1"),
            ));
          },
          rightIcon2: FunDsIcon(
            funDsIconography: FunDsIconography.actionIcCloud,
            size: 24.w,
          ),
          onClickRightIcon2: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("On Click Right Icon 2"),
            ));
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: FunDsHeader(
            key: const Key('header4'),
            useDarkBg: useDarkBg,
            automaticallyImplyBack: true,
            withSafeArea: false,
            onClickBack: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("On Click Back"),
              ));
            },
            title: 'lorem ipsum dolor sit amet adispiscing',
            link: 'Unduh',
            onClickLink: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("On Click Link"),
              ));
            },
            rightIcon2: FunDsIcon(
              funDsIconography: FunDsIconography.actionIcPaperPlane,
              size: 24.w,
            ),
            onClickRightIcon2: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("On Click Right Icon 2"),
              ));
            },
          ),
        ),
        FunDsHeader(
          key: const Key('header5'),
          useDarkBg: useDarkBg,
          automaticallyImplyBack: true,
          withSafeArea: false,
          onClickBack: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("On Click Back"),
            ));
          },
          title: 'lorem ipsum dolor sit amet adispiscing',
          link: 'Unduh',
          onClickLink: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("On Click Link"),
            ));
          },
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final toogleKnob = context.knobs.boolean(
      label: 'Use Dark Background',
      description: 'Change background by this knobs',
      initial: false,
    );

    return Scaffold(
      appBar: const FunDsHeader(title: 'FunDsHeader (Scaffold AppBar)'),
      backgroundColor: FunDsColors.colorNeutral200,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            ...listHeader(context, toogleKnob),
          ],
        ),
      ),
    );
  }
}
