import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:govbr_ds/components/br_footer.dart';
import 'package:govbr_ds/components/br_footer_category.dart';
import 'package:govbr_ds/components/br_footer_partner_image.dart';
import 'package:govbr_ds/components/br_footer_social_button.dart';
import 'package:govbr_ds/components/br_grid.dart';
import 'package:govbr_ds/utils/responsive.dart';

class RescarFooter extends StatelessWidget {
  const RescarFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BrFooter(
      label: "® Serpro 2023",
      license: Text(
          "Texto destinado a exibição de informações relacionadas à licença de uso."),
      categories: BrGrid(margin: 16, children: [
        BrResponsiveItem(
          sm: 6,
          md: 4,
          lg: 3,
          xl: 2,
          child: BrFooterCategory(
            title: "CATEGORIA 1",
            itens: [
              BrFooterItem(title: "Qui esse"),
              BrFooterItem(title: "Adipisicing culpa et ad consequat"),
              BrFooterItem(title: "Nulla occaecat eiusmod"),
              BrFooterItem(title: "Est ex deserunt"),
            ],
          ),
        ),
        BrResponsiveItem(
          sm: 6,
          md: 4,
          lg: 3,
          xl: 2,
          child: BrFooterCategory(
            title: "CATEGORIA 2",
            itens: [
              BrFooterItem(title: "Qui esse"),
              BrFooterItem(title: "Adipisicing culpa et ad consequat"),
              BrFooterItem(title: "Nulla occaecat eiusmod"),
              BrFooterItem(title: "Est ex deserunt"),
            ],
          ),
        ),
        BrResponsiveItem(
          sm: 6,
          md: 4,
          lg: 3,
          xl: 2,
          child: BrFooterCategory(
            title: "CATEGORIA 3",
            itens: [
              BrFooterItem(title: "Qui esse"),
              BrFooterItem(title: "Adipisicing culpa et ad consequat"),
              BrFooterItem(title: "Nulla occaecat eiusmod"),
              BrFooterItem(title: "Est ex deserunt"),
            ],
          ),
        ),
        BrResponsiveItem(
          sm: 6,
          md: 4,
          lg: 3,
          xl: 2,
          child: BrFooterCategory(
            title: "CATEGORIA 4",
            itens: [
              BrFooterItem(title: "Qui esse"),
              BrFooterItem(title: "Adipisicing culpa et ad consequat"),
              BrFooterItem(title: "Nulla occaecat eiusmod"),
              BrFooterItem(title: "Est ex deserunt"),
            ],
          ),
        ),
        BrResponsiveItem(
          sm: 6,
          md: 4,
          lg: 3,
          xl: 2,
          child: BrFooterCategory(
            title: "CATEGORIA 5",
            itens: [
              BrFooterItem(title: "Qui esse"),
              BrFooterItem(title: "Adipisicing culpa et ad consequat"),
              BrFooterItem(title: "Nulla occaecat eiusmod"),
              BrFooterItem(title: "Est ex deserunt"),
            ],
          ),
        ),
        BrResponsiveItem(
          sm: 6,
          md: 4,
          lg: 3,
          xl: 2,
          child: BrFooterCategory(
            title: "CATEGORIA 6",
            itens: [
              BrFooterItem(title: "Qui esse"),
              BrFooterItem(title: "Adipisicing culpa et ad consequat"),
              BrFooterItem(title: "Nulla occaecat eiusmod"),
              BrFooterItem(title: "Est ex deserunt"),
            ],
          ),
        ),
      ]),
      social: [
        BrFooterSocialButton(
            tooltip: "Social Facebook",
            url: "",
            icon: FaIcon(
              FontAwesomeIcons.facebook,
            )),
        BrFooterSocialButton(
            tooltip: "Social Twitter",
            url: "",
            icon: FaIcon(
              FontAwesomeIcons.twitter,
            )),
        BrFooterSocialButton(
            tooltip: "Social Linkedin",
            url: "",
            icon: FaIcon(
              FontAwesomeIcons.linkedin,
            )),
        BrFooterSocialButton(
            tooltip: "Social Whatsapp",
            url: "",
            icon: FaIcon(
              FontAwesomeIcons.whatsapp,
            ))
      ],
      partners: [
        BrFooterPartnerImage(
            image: AssetImage("assets/images/fake_partner.png"),
            tooltip: "Imagem Parceiro 1",
            url: ""),
        BrFooterPartnerImage(
            image: AssetImage("assets/images/fake_partner.png"),
            tooltip: "Imagem Parceiro 2",
            url: ""),
      ],
    );
  }
}
