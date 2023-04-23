import 'package:flutter/material.dart';
import 'package:okoul_recipe_challenge/features/recipe_details/domain/entities/instruction.dart';

class InstructionsCardWidget extends StatelessWidget {
  final List<Instruction> instructions;
  const InstructionsCardWidget({super.key, required this.instructions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Icon(Icons.soup_kitchen),
            SizedBox(
              width: 5,
            ),
            Text(
              'Instructions',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        Divider(
          color: Colors.white.withOpacity(0.8),
        ),
        SizedBox(
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: instructions.length,
              itemBuilder: (context, index) => Text(
                    "${instructions[index].step}- ${instructions[index].instructionDescription}\n",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  )),
        ),
      ],
    );
  }
}
