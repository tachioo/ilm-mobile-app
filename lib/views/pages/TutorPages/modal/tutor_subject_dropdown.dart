import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class TutorSubjectDropdown extends StatefulWidget {
  const TutorSubjectDropdown({super.key});

  @override
  State<TutorSubjectDropdown> createState() => _TutorSubjectDropdownState();
}

class _TutorSubjectDropdownState extends State<TutorSubjectDropdown> {
  final MultiSelectController _controller = MultiSelectController();

  @override
  Widget build(BuildContext context) {
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
                      'Choose your Subject',
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
                  debugPrint(options.toString());
                },
                options: const <ValueItem>[
                  ValueItem(label: 'Mathematic', value: 'Mathematic'),
                  ValueItem(label: 'Physics', value: 'Physics'),
                  ValueItem(label: 'Biology', value: 'Biology'),
                  ValueItem(label: 'Science', value: 'Science'),
                  ValueItem(label: 'English', value: 'English'),
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
              onPressed: () => Navigator.of(context).pop(),
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
