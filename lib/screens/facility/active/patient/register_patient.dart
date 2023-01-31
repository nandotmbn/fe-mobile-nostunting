import 'package:flutter/material.dart';
import 'package:no_stunting/views/facility/active/patient/register.dart';
import 'package:no_stunting/widgets/base_scaffold.dart';

class FacilityRegisterPatient extends StatelessWidget {
  const FacilityRegisterPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(FacilityRegisterPatientView());
  }
}
