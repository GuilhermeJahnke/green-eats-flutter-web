import 'package:flutter/material.dart';

import '../../../../shared/domain/entities/characteristics.dart';
import '../../../../shared/utils/mixins/interable_mixin.dart';
import '../../../../shared/utils/utils.dart';
import '../molecules/characteristic_card_molecule.dart';

class CharacteristicsCardBuilderOrganism extends StatelessWidget {
  const CharacteristicsCardBuilderOrganism({
    super.key,
    required this.characteristicList,
  });

  final List<Characteristic> characteristicList;

  List<Widget> _buildTermGroups(List<Characteristic> termsList) {
    final groupedTerms =
        Utils.groupElements<Characteristic>(termsList, groupSize: 2);

    final termGroups = groupedTerms
        .map(
          (group) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...group.map(
                (characteristic) {
                  return Flexible(
                    child: CharacteristicCardMolecule(
                      characteristic: characteristic,
                    ),
                  );
                },
              ),
              if (group.length.isOdd) const Spacer(),
            ]..insert(1, const SizedBox(width: 16)),
          ),
        )
        .toList();

    return termGroups;
  }

  @override
  Widget build(BuildContext context) {
    final termGroups = _buildTermGroups(characteristicList);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: termGroups.addSeparators(const SizedBox(height: 16)),
    );
  }
}
