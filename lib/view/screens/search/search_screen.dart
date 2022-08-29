import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainery/config/colors.dart';
import 'package:rainery/utils/align_constants.dart';
import 'package:rainery/view-model/weather_provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
            left: elementAlignment.left, right: elementAlignment.left, top: 10),
        child: Consumer<WeatherProvider>(
          builder: (context, weatherNotifier, child) => Column(
            children: [
              TextField(
                onChanged: (value) => weatherNotifier.findCoundtry(value),
                style: Theme.of(context).textTheme.headlineSmall,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Theme.of(context).backgroundColor,
                      width: 0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Theme.of(context).backgroundColor,
                      width: 0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Theme.of(context).backgroundColor,
                      width: 0,
                    ),
                  ),
                  focusColor: Theme.of(context).backgroundColor,
                  fillColor: Theme.of(context).backgroundColor,
                  filled: true,
                  prefixIconColor: utilsColors.lightSelectedIconColor,
                  hintText: "Search Your Country",
                  hintStyle: Theme.of(context).textTheme.headlineSmall,
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: utilsColors.lightSelectedIconColor,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: weatherNotifier.searchedListCountries.length,
                  itemBuilder: (BuildContext context, int index) {
                    final country =
                        weatherNotifier.searchedListCountries[index];
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).backgroundColor),
                      child: Center(
                        child: Text(country.name),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
