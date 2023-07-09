import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tendemo/constants/app_colors.dart';
import 'package:tendemo/constants/app_textstyle.dart';
import 'package:tendemo/extensions/sized_box.dart';
import 'package:tendemo/providers/watch_provider.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 77),
      child: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0.3,
        toolbarHeight: 77,
        flexibleSpace: Container(
          child:
              context.watch<WatchProvider>().appBarState == AppBarState.normal
                  ? _NormalComponent(
                      onToggle: () => context
                          .read<WatchProvider>()
                          .changeState(AppBarState.searchOpened))
                  : context.watch<WatchProvider>().appBarState ==
                          AppBarState.searchOpened
                      ? _SearchComponent(
                          onToggle: () => context
                              .read<WatchProvider>()
                              .changeState(AppBarState.normal),
                          onSubmit: () => context
                              .read<WatchProvider>()
                              .changeState(AppBarState.searchSubmit))
                      : _ResultComponent(onToggle: () => context
                              .read<WatchProvider>()
                              .changeState(AppBarState.normal)),
        ),
      ),
    );
  }
}

class _NormalComponent extends StatelessWidget {
  final VoidCallback onToggle;
  const _NormalComponent({required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Watch',
            style: AppTextstyle.poppins(
                color: AppColors.darkBlue,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          InkWell(
              onTap: onToggle,
              // radius: 40,
              // borderRadius: BorderRadius.circular(100),
              child: const Icon(Icons.search, color: AppColors.darkBlue)),
          // IconButton(onPressed: onToggle, icon: const Icon(Icons.search,color: AppColors.darkBlue))
        ],
      ),
    );
  }
}

class _ResultComponent extends StatelessWidget {
  final VoidCallback onToggle;
  const _ResultComponent({required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            IconButton(onPressed: onToggle, icon:  const Icon(Icons.arrow_back_ios_new)),
          15.spaceX,
          Text(
            '${context.watch<WatchProvider>().filtered.length} Results Found',
            style: AppTextstyle.poppins(
                color: AppColors.darkBlue,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class _SearchComponent extends StatelessWidget {
  final VoidCallback onToggle;
  final VoidCallback onSubmit;
  const _SearchComponent({required this.onToggle, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.lightGrey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(30)),
        height: 52,
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: context.read<WatchProvider>().searchController,
                onChanged: (value) =>
                    context.read<WatchProvider>().onSearchValueChange(value),
                onSubmitted: (h) => onSubmit(),
                decoration: InputDecoration(
                    hintText: "TV shows, movies and more",
                    hintStyle: AppTextstyle.poppins(
                        color: AppColors.darkBlue.withOpacity(0.3)),
                    prefixIcon:
                        const Icon(Icons.search, color: AppColors.darkBlue),
                    border: InputBorder.none),
              ),
            ),
            IconButton(
                onPressed: onToggle,
                icon: const Icon(
                  Icons.close,
                  color: AppColors.darkBlue,
                ))
          ],
        ),
      ),
    );
  }
}
