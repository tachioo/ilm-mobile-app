import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_testing/resources/add_data.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({super.key});

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  final MultiSelectController _controller = MultiSelectController();

  @override
  Widget build(BuildContext context) {
    Iterable language = [];

    void saveLanguage() async {
      String res = await StoreData().saveLanguage(languages: language);
      setState(() {});
      Navigator.of(context).pop(true);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => const EditProfile()));
    }

    print('first print is ${language}');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                ),
                const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Choose your Language',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.cancel_presentation,
                        color: Colors.transparent,
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: MultiSelectDropDown(
                controller: _controller,
                showClearIcon: true,
                onOptionSelected: (options) {
                  var list = options.map((e) => e.value);
                  // language = [list];
                  language = list;
                  // var language = list;
                  print('second print is $language');

                  // print(option)
                  // debugPrint(options.toString());
                },
                options: const <ValueItem>[
                  ValueItem(label: 'Math', value: 'Math'),
                  ValueItem(label: 'Science', value: 'Science'),
                  ValueItem(label: 'Biology', value: 'Biology'),
                  ValueItem(label: 'Physic', value: 'Physic'),
                  ValueItem(label: 'English', value: 'English'),
                  ValueItem(label: 'Additional Math', value: 'Additional Math'),
                ],
                // disabledOptions: const [ValueItem(label: 'Option 1', value: '1')],
                dropdownHeight: 500,
                dropdownBorderRadius: 20,
                selectionType: SelectionType.multi,
                chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                optionTextStyle: const TextStyle(fontSize: 16),
                selectedOptionIcon: const Icon(
                  Icons.check_circle,
                ),
                alwaysShowOptionIcon: false,
              ),
            ),
          ),

          //Button
          const SizedBox(height: 10),
          SizedBox(
            width: 200,
            child: TextButton(
              onPressed: saveLanguage,
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
              ),
              child: const Text(
                'Done',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
