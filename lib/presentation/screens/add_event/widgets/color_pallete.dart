import 'package:calendar_flutter/core/utils/color_util.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_divider.dart';
import 'package:calendar_flutter/core/widgets/calendar_app_square_icons.dart';
import 'package:calendar_flutter/presentation/screens/add_event/widgets/color_option.dart';
import 'package:flutter/material.dart';

class ColorPalette extends StatefulWidget {
  const ColorPalette({super.key});

  @override
  State<ColorPalette> createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette>
    with TickerProviderStateMixin {
  bool _isExpanded = false;
  final CalendarTheme currentCalendarTheme = CalendarTheme.basic;
  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = currentCalendarTheme.eventColors.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ListTileTheme(
        horizontalTitleGap: 0,
        minVerticalPadding: 0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: ExpansionTile(
            trailing: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AnimatedRotation(
                turns: _isExpanded ? 0 : -0.5,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                child: CalendarAppSquareIcon.chevronUp(16),
              ),
            ),
            initiallyExpanded: _isExpanded,
            onExpansionChanged: (value) => setState(() => _isExpanded = value),
            visualDensity: VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            tilePadding: EdgeInsets.zero,
            shape: const Border(),
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: SizedBox(
                height: 28,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 19, right: 2),
                  itemCount: currentCalendarTheme.eventColors.length,
                  itemBuilder: (context, index) {
                    final Color color = currentCalendarTheme
                        .eventColors[index % Colors.primaries.length];
                    return ColorOption(
                      color: color,
                      value: _selectedColor == color,
                      onChanged: (value) {
                        setState(() => _selectedColor = color);
                      },
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(width: 14),
                ),
              ),
            ),
            childrenPadding: EdgeInsets.zero,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CalendarAppDivider(),
                  Container(
                    padding: const EdgeInsets.fromLTRB(18, 20, 18, 24),
                    color: AppPalette.grey100,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 28,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1,
                      ),
                      itemCount: currentCalendarTheme.eventColors.length,
                      itemBuilder: (context, index) {
                        final Color color = currentCalendarTheme
                            .eventColors[index % Colors.primaries.length];
                        return ColorOption(
                          color: color,
                          value: _selectedColor == color,
                          onChanged: (value) {
                            setState(() => _selectedColor = color);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
