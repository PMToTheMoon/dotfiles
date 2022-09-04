import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neat/neat.dart';

List<Widget> texts(BuildContext context) => [
      context.displayLarge('DisplayLarge'),
      context.displayMedium('DisplayMedium'),
      context.displaySmall('DisplaySmall'),
      const SpaceSmall(),
      context.headlineLarge('HeadlineLarge'),
      context.titleLarge('TitleLarge'),
      context.bodyLarge('BodyLarge'),
      const SpaceSmall(),
      context.headlineMedium('HeadlineMedium'),
      context.titleMedium('TitleMedium'),
      context.bodyMedium('BodyMedium'),
      const SpaceSmall(),
      context.headlineSmall('HeadlineSmall'),
      context.titleSmall('TitleSmall'),
      context.bodyMedium('BodySmall'),
      const SpaceSmall(),
      context.labelLarge('LabelLarge'),
      context.labelMedium('LabelMedium'),
      context.labelSmall('LabelSmall'),
      Text(
        'Crimson',
        style: GoogleFonts.crimsonPro(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      const Text(
        'Poppins',
        style: TextStyle(
          fontFamily: 'poppins',
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      Text(
        'Poppins',
        style: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SpaceMedium.h(),
      Center(
        child: Table(
          defaultColumnWidth: FixedColumnWidth(50),
          children: [
            TableRow(children: [
              TableCell(
                child: context.bodySmall(
                  'test',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w100),
                ),
              ),
              TableCell(
                child: context.bodySmall(
                  'test',
                  style: TextStyle(fontWeight: FontWeight.w100),
                ),
              )
            ]),
            TableRow(children: [
              context.bodySmall(
                'test',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w200),
              ),
              context.bodySmall(
                'test',
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontFamily: 'Poppins',
                ),
              )
            ]),
            TableRow(children: [
              context.bodySmall(
                'test',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w300),
              ),
              context.bodySmall(
                'test',
                style: TextStyle(fontWeight: FontWeight.w300),
              )
            ]),
            TableRow(children: [
              context.bodySmall(
                'test',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
              ),
              context.bodySmall(
                'test',
                style: TextStyle(fontWeight: FontWeight.w400),
              )
            ]),
            TableRow(children: [
              context.bodySmall(
                'test',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
              ),
              context.bodySmall(
                'test',
                style: TextStyle(fontWeight: FontWeight.w500),
              )
            ]),
            TableRow(children: [
              context.bodySmall(
                'test',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              context.bodySmall(
                'test',
                style: TextStyle(fontWeight: FontWeight.w600),
              )
            ]),
            TableRow(children: [
              context.bodySmall(
                'test',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
              ),
              context.bodySmall(
                'test',
                style: TextStyle(fontWeight: FontWeight.w700),
              )
            ]),
            TableRow(children: [
              context.bodySmall(
                'test',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w800),
              ),
              context.bodySmall(
                'test',
                style: TextStyle(fontWeight: FontWeight.w800),
              )
            ]),
            TableRow(children: [
              context.bodySmall(
                'test',
                style: context.textTheme.bodySmall
                    ?.copyWith(fontWeight: FontWeight.w100, color: Colors.red),
              ),
              context.bodySmall(
                'test',
                style:
                    TextStyle(fontWeight: FontWeight.w100, color: Colors.red),
              )
            ]),
          ],
        ),
      ),
    ];
