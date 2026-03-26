import 'package:bhf_player/core/presentation/components/icons/build_icon.dart';
import 'package:bhf_player/core/utils/enums/enums.dart';
import 'package:bhf_player/core/utils/extensions/export/all_extensions.dart';
import 'package:bhf_player/generated/l10n.dart';
import 'package:flutter/material.dart';

class LanguageDropdown extends StatelessWidget {
  final Language value;
  final ValueChanged<Language?> onChanged;

  const LanguageDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme.labelSmall?.copyWith(
      fontWeight: FontWeight.bold,
    );
    return DropdownMenuFormField<Language>(
      initialSelection: value,
      textStyle: textTheme,
      expandedInsets: const EdgeInsets.all(0),
      leadingIcon: const BuildIcon(Icons.language),
      trailingIcon: const BuildIcon(Icons.keyboard_arrow_down_rounded),
      selectedTrailingIcon: const BuildIcon(Icons.keyboard_arrow_up_rounded),

      dropdownMenuEntries: [
        DropdownMenuEntry(
          value: Language.en,
          label: S.of(context).english,
          labelWidget: Text(S.of(context).english, style: textTheme),
        ),
        DropdownMenuEntry(
          value: Language.ar,
          label: S.of(context).arabic,
          labelWidget: Text(S.of(context).arabic, style: textTheme),
        ),
      ],
      onSelected: onChanged,
    );
  }
}
