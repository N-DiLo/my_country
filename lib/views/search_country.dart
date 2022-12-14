import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_country/constants/app_const.dart';
import 'package:my_country/constants/textstyles.dart';
import 'package:my_country/models/app_model.dart';
import 'package:my_country/services/web_call.dart';
import 'package:my_country/utils/app_bottomsheet.dart';
import 'package:my_country/utils/responsive.dart';
import 'package:my_country/views/country_details.dart';
import 'package:provider/provider.dart';

class SearchCountry extends StatefulWidget {
  const SearchCountry({super.key});

  @override
  State<SearchCountry> createState() => _SearchCountryState();
}

class _SearchCountryState extends State<SearchCountry> {
  List<Explore>? explore;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    getData(); //Fetches data from given api (explore)
  }

  getData() async {
    explore = (await WebCall().getPosts());
    if (explore != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:
          (BuildContext context, ThemeChanger themeChanger, Widget? child) =>
              ScreenLayout(
        mobile: Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: REdgeInsets.only(right: 24.0),
                child: IconButton(
                  onPressed: () {
                    themeChanger.isDarkTheme = !themeChanger.isDarkTheme;
                  },
                  icon: Icon(
                    themeChanger.isDarkTheme
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined,
                    color: themeChanger.isDarkTheme
                        ? AppColor.grayWarm
                        : AppColor.whiteColor,
                  ),
                ),
              ),
            ],
            elevation: 0,
            title: RichText(
              text: TextSpan(
                  text: 'Explore',
                  style: myAppBarText.copyWith(
                      color: Theme.of(context).primaryColorDark),
                  children: [TextSpan(text: '.', style: logoDot)]),
            ),
          ),
          body: Padding(
            padding: REdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ScreenUtil().setHeight(10)),
                _countrySearch(),
                SizedBox(height: ScreenUtil().setHeight(16)),
                _selectZone(),
                SizedBox(height: ScreenUtil().setHeight(16)),
                Expanded(
                    child: MediaQuery.removePadding(
                  context: context,
                  child: Visibility(
                    visible: isLoaded,
                    replacement:
                        const Center(child: CircularProgressIndicator()),
                    child: ListView.builder(
                        padding: REdgeInsets.symmetric(vertical: 26),
                        itemCount: explore?.length,
                        itemBuilder: ((context, index) => ListTile(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => CountryDetials(
                                          details: explore![index]))),
                              leading: Container(
                                  width: ScreenUtil().setWidth(40),
                                  height: ScreenUtil().setHeight(40),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              explore![index].flags!.png!)))),
                              title: Text(explore![index].name!.common!,
                                  style: homelist),
                              subtitle: Text(explore![index].capital!.first,
                                  style: sublist),
                            ))),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  _countrySearch() {
    return Responsive(
      builder: (BuildContext context, ScreenSizeInfo screenSizeInfo) =>
          Container(
        height: ScreenUtil().setHeight(48),
        width: ScreenUtil().setWidth(380),
        decoration: const BoxDecoration(
            color: AppColor.searchColor,
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: TextFormField(
          onChanged: (value) {
            value = value.toLowerCase();
            setState(() {});
          },
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search,
                size: ScreenUtil().radius(20), color: AppColor.grayText),
            hintText: 'Search Country',
            hintStyle: detailsBody.copyWith(color: AppColor.grayText),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(4)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(4)),
            contentPadding: REdgeInsets.all(12),
          ),
        ),
      ),
    );
  }

  _selectZone() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => showModalBottomSheet(
              useRootNavigator: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (_) => const LangBottomSheet()),
          child: Expanded(
            child: Container(
              padding: REdgeInsets.all(8),
              width: ScreenUtil().setWidth(73),
              height: ScreenUtil().setHeight(40),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.2, color: AppColor.shadowColor),
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                children: [
                  Icon(Icons.language_outlined,
                      size: ScreenUtil().radius(30),
                      color: Theme.of(context).primaryColorDark),
                  SizedBox(width: ScreenUtil().setWidth(8)),
                  Text(
                    'EN',
                    style: appLang,
                  )
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () => showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (_) => const FilterBottomSheet()),
          child: Expanded(
            child: Container(
              padding: REdgeInsets.all(8),
              width: ScreenUtil().setWidth(86),
              height: ScreenUtil().setHeight(40),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.2, color: AppColor.shadowColor),
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                children: [
                  Icon(
                    Icons.filter_alt_outlined,
                    size: ScreenUtil().radius(30),
                    color: Theme.of(context).primaryColorDark,
                  ),
                  SizedBox(width: ScreenUtil().setWidth(8)),
                  Text('Filter', style: appLang)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
