import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terrawalls/image_cubit/images_cubit.dart';

import '../../data/items.dart';
import 'widgets/info_search_widget.dart';

class SearchViewWidget extends StatelessWidget {
  const SearchViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconLeftInput(txt: "Cars, Earth, Mobile, ...", icon: Icons.person),
          GridViewWidget(),
        ],
      ),
    );
  }
}
/////////////////////////////  GridView   //////////////////////////////////

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      // Grid configuration
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns
        crossAxisSpacing: 4.0, // Spacing between columns
        mainAxisSpacing: 4.0, // Spacing between rows
        childAspectRatio: 2.0, // Ratio of item's width to height
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => InfoSearchWidget(searchWord: items[index]),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.primaries[index % Colors.primaries.length],
                width: 1.0,
              ),
            ),
            child: Center(
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    items[index].toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/////////////////////////////  SearchBar   //////////////////////////////////
class IconLeftInput extends StatelessWidget {
  final String txt;
  final IconData icon;
  const IconLeftInput({super.key, required this.txt, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: PrimaryContainer(
        radius: 10,
        child: TextFormField(
          onFieldSubmitted: (value) {
            BlocProvider.of<ImagesCubit>(context).getImagesData(value, 1);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InfoSearchWidget(searchWord: value),
              ),
            );
          },
          style: const TextStyle(fontSize: 18, color: Colors.white),
          controller: TextEditingController(),
          textAlignVertical: TextAlignVertical.center,

          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 3,
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFF00BAAB)),
            ),
            // fillColor: Colors.grey.withValues(alpha: 0.15),
            errorBorder: InputBorder.none,
            // filled: true,
            disabledBorder: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            hintText: txt,
            prefixIcon: Icon(icon),
            hintStyle: const TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final double? radius;
  final Color? color;
  const PrimaryContainer({
    super.key,
    this.radius,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 30),
        boxShadow: [
          BoxShadow(color: color ?? const Color(0XFF1E1E1E)),
          const BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 4,
            spreadRadius: 0,
            color: Colors.black,
          ),
        ],
      ),
      child: child,
    );
  }
}
