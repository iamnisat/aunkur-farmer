import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/feature/authentication/bloc/auth_bloc.dart';
import 'package:aunkur_farmer/src/feature/authentication/repositories/authentication_repository.dart';
import 'package:aunkur_farmer/src/feature/chat/bloc/chat_bloc.dart';
import 'package:aunkur_farmer/src/feature/chat/presentation/page/conversation_list_page.dart';
import 'package:aunkur_farmer/src/feature/chat/repositories/chat_repo.dart';
import 'package:aunkur_farmer/src/feature/crop/bloc/crop_bloc.dart';
import 'package:aunkur_farmer/src/feature/crop/repositories/crop_repo.dart';
import 'package:aunkur_farmer/src/feature/home/presentation/page/home_page.dart';
import 'package:aunkur_farmer/src/feature/userProfile/presentation/page/user_profile_page.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RootScreen extends StatefulWidget {
  final int? initIndex;
  const RootScreen({super.key, this.initIndex});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final List<Widget> _children = [
    MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (context) => CropRepo())],
      child: BlocProvider(
        create: (context) =>
            CropBloc(context.read<CropRepo>())..add(CropListRequestEvent()),
        child: const HomePage(),
      ),
    ),
    RepositoryProvider(
      create: (context) => ChatRepo(),
      child: BlocProvider(
        create: (context) =>
            ChatBloc(context.read<ChatRepo>())
              ..add(const ChatConversationEvent()),
        child: const ConversationListPage(),
      ),
    ),

    RepositoryProvider(
      create: (context) => AuthenticationRepository(),
      child: BlocProvider(
        create: (context) =>
            AuthBloc(context.read<AuthenticationRepository>())
              ..add(AuthUserProfileEvent()),
        child: UserProfilePage(),
      ),
    ),
  ];
  int index = 0;

  @override
  void initState() {
    index = widget.initIndex ?? 0;
    debugPrint("RootScreen index: $index");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: index, children: _children),
      bottomNavigationBar: ConvexAppBar(
        height: 70,
        backgroundColor: AppColors.primaryGray,
        style: TabStyle.react,
        activeColor: AppColors.primaryBlack,
        curveSize: 0,
        color: AppColors.primaryGrey,
        shadowColor: Colors.transparent,
        elevation: 1,
        items: [
          TabItem(
            icon: Icon(FontAwesomeIcons.houseChimney),
            title: S.of(context).home,
          ),
          TabItem(icon: Icon(FontAwesomeIcons.message), title: "Chat"),
          TabItem(
            icon: Icon(FontAwesomeIcons.solidUser),
            title: S.of(context).profile,
          ),
        ],
        initialActiveIndex: widget.initIndex ?? 0,
        onTap: (i) => setState(() => index = i),
      ),
    );
  }
}
