import 'package:bookly/features/Search/presentation/manager/searchCubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchTextField extends StatefulWidget {
  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  TextEditingController searchcController = TextEditingController();
  @override
  void initState() {
    context.read<SearchCubit>().fetchSearchBook(searchcController.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchcController,
      decoration: InputDecoration(
          suffixIcon: Opacity(
              opacity: .5,
              child: IconButton(
                  onPressed: () {
                    BlocProvider.of<SearchCubit>(context)
                        .fetchSearchBook(searchcController.text);
                    searchcController.clear();
                  },
                  icon: const Icon(FontAwesomeIcons.magnifyingGlass))),
          hintText: 'Search',
          focusedBorder: outlineBorder(),
          enabledBorder: outlineBorder()),
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.white));
  }
}
