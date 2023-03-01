import 'package:flutter/material.dart';
import 'package:umik/constants.dart';

class CustomTextInputField extends StatefulWidget {
  final String label;
  final bool needLabel;
  final String hint;
  final int? inputMaxLength;
  final TextEditingController fieldController;
  final bool isRequired;

  const CustomTextInputField({
    super.key,
    required this.label,
    required this.needLabel,
    required this.hint,
    this.inputMaxLength,
    required this.fieldController,
    required this.isRequired,
  });

  @override
  State<CustomTextInputField> createState() => _CustomTextInputFieldState();
}

class _CustomTextInputFieldState extends State<CustomTextInputField> {
  int inputLength = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: KBgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Row(
              children: [
                if (widget.needLabel) ...[
                  Expanded(
                    child: Text(
                      widget.label,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
                if (widget.inputMaxLength != null) ...[
                  Text(
                    '${inputLength.toString()}/${widget.inputMaxLength.toString()}',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: kTextSecondColor, fontWeight: FontWeight.w400),
                  ),
                ],
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: TextFormField(
              controller: widget.fieldController,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                floatingLabelAlignment: FloatingLabelAlignment.start,
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(
                      color: Colors.black38,
                      width: 0.5,
                    )),
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.zero,
                ),
                hintText: widget.hint,
                counterText: '',
              ),
              style: Theme.of(context).textTheme.titleMedium,
              maxLength: widget.inputMaxLength,
              validator: (value) {
                if (!widget.isRequired | value!.isNotEmpty) {
                  return null;
                }
                return '${widget.label} tidak boleh kososng';
              },
              onChanged: (value) {
                setState(() {
                  inputLength = value.length;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
