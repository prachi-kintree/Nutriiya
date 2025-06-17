import 'package:flutter/material.dart';
import 'package:nutriya/Injector/app_injector.dart';
import 'package:nutriya/RouteManager/route_manager_barrel.dart';
import 'package:nutriya/utils/LocalData/LocalData.dart';

enum RelationshipEnum {
  Father,
  Mother, // 1
  Brother,
  Sister, // 1
  Husband,
  Wife, // 1
  Son,
  Daughter, // 1
  GrandFather,
  GrandMother, //1
  Grandson,
  Granddaughter, // 1
  SonOfDaughter,
  DaughterOfDaughter, // 1
  Uncle,
  Aunt,
  Nephew,
  Niece,
  StepFather,
  StepMother,
  StepBrother,
  StepSister,
  GreatGrandFather,
  GreatGrandMother,
  CousinBrother,
  CousinSister,
  MaternalUncle,
  MaternalAunt,
  AuntBua,
  UncleFufa,
  AuntMausi,
  UncleMausa,
  NephewSistersSon,
  NieceSistersDaughter,
  BrotherInLaw,
  CousinBrotherMaternal,
  CousinSisterMaternal,
  CousinBrotherBua,
  CousinSisterBua,
  SisterInLaw,
  DaughterInLaw,
  GrandFatherNana,
  GrandMotherNani,
  FatherInLaw,
  MotherInLaw,
  SonInLaw,
  GrandDaughterInLaw,
  GrandSonInLaw,
  GreatGrandSon,
  GreatGrandDaughter,
  CousinBrotherMausi,
  CousinSisterMausi,
}

extension RelationExtension on RelationshipEnum {
  String get value {
    switch (this) {
      case RelationshipEnum.Father:
        return "1";
      case RelationshipEnum.Mother:
        return "2";
      case RelationshipEnum.Brother:
        return "3";
      case RelationshipEnum.Sister:
        return "4";
      case RelationshipEnum.Husband:
        return "5";
      case RelationshipEnum.Wife:
        return "6";
      case RelationshipEnum.Son:
        return "7";
      case RelationshipEnum.Daughter:
        return "8";
      case RelationshipEnum.GrandFather:
        return "9";
      case RelationshipEnum.GrandMother:
        return "10";
      case RelationshipEnum.Grandson:
        return "11";
      case RelationshipEnum.Granddaughter:
        return "12";
      case RelationshipEnum.Uncle:
        return "13";
      case RelationshipEnum.Aunt:
        return "14";
      case RelationshipEnum.Nephew:
        return "15";
      case RelationshipEnum.Niece:
        return "16";
      case RelationshipEnum.StepFather:
        return "17";
      case RelationshipEnum.StepMother:
        return "18";
      case RelationshipEnum.StepBrother:
        return "19";
      case RelationshipEnum.StepSister:
        return "20";
      case RelationshipEnum.GreatGrandFather:
        return "23";
      case RelationshipEnum.GreatGrandMother:
        return "24";
      case RelationshipEnum.GreatGrandSon:
        return "25";
      case RelationshipEnum.GreatGrandDaughter:
        return "26";
      case RelationshipEnum.CousinBrother:
        return "27";
      case RelationshipEnum.CousinSister:
        return "28";
      case RelationshipEnum.MaternalUncle:
        return "29";
      case RelationshipEnum.MaternalAunt:
        return "30";
      case RelationshipEnum.AuntBua:
        return "33";
      case RelationshipEnum.UncleFufa:
        return "34";
      case RelationshipEnum.AuntMausi:
        return "35";
      case RelationshipEnum.UncleMausa:
        return "36";
      case RelationshipEnum.NephewSistersSon:
        return "37";
      case RelationshipEnum.NieceSistersDaughter:
        return "38";
      case RelationshipEnum.BrotherInLaw:
        return "39";
      case RelationshipEnum.CousinBrotherMaternal:
        return "40";
      case RelationshipEnum.CousinSisterMaternal:
        return "41";
      case RelationshipEnum.CousinBrotherBua:
        return "42";
      case RelationshipEnum.CousinSisterBua:
        return "43";
      case RelationshipEnum.SisterInLaw:
        return "44";
      case RelationshipEnum.DaughterInLaw:
        return "45";
      case RelationshipEnum.GrandFatherNana:
        return "46";
      case RelationshipEnum.GrandMotherNani:
        return "47";
      case RelationshipEnum.FatherInLaw:
        return "48";
      case RelationshipEnum.MotherInLaw:
        return "49";
      case RelationshipEnum.SonInLaw:
        return "50";
      case RelationshipEnum.GrandDaughterInLaw:
        return "51";
      case RelationshipEnum.GrandSonInLaw:
        return "52";
      case RelationshipEnum.CousinBrotherMausi:
        return "53";
      case RelationshipEnum.CousinSisterMausi:
        return "54";
      case RelationshipEnum.SonOfDaughter:
        return "55";
      case RelationshipEnum.DaughterOfDaughter:
        return "56";
    }
  }
}

class TreeHelper {
  List<String> presentRelation = [];
  bool isMale() {
    print(" From tree_service ${getIt<LocalDataManager>().userGender}");
    return getIt<LocalDataManager>().userGender == "1";
  }

  bool isFemale() {
    return getIt<LocalDataManager>().userGender == "2";
  }

  setRelationList({required List<String> relationList}) {
    presentRelation = relationList;
  }

  bool addedRelationContains({required RelationshipEnum relation}) {
    return presentRelation.contains(relation.value);
  }

  bool addedRelationNotContains({required RelationshipEnum relation}) {
    print(relation.value);
    return !presentRelation.contains(relation.value);
  }

  bool canAddMemberWithRelation(
      {required String relationId, required List<String> relationList}) {
// Global Condition
// Gender 1:Male 2:Female
//  Check Gender of Logged in User

    // Husband
    // Condition : If you are a male you cannot add male relations i.e  You cannot add Husband
    setRelationList(relationList: relationList);
    if (relationId == RelationshipEnum.Husband.value) {
      if (isMale()) {
        showError(ForCase: 0);
        return false;
      }
      // relationList Doesn't contain father or mother
      else if (addedRelationNotContains(relation: RelationshipEnum.Father) ||
          addedRelationNotContains(relation: RelationshipEnum.Mother)) {
        showError(ForCase: 54);
        return false;
      } else {}
    }

    // Wife
    else if (relationId == RelationshipEnum.Wife.value) {
      if (isFemale()) {
        showError(ForCase: 1);
        return false;
      } else if (addedRelationNotContains(relation: RelationshipEnum.Father) ||
          addedRelationNotContains(relation: RelationshipEnum.Mother)) {
        showError(ForCase: 53);
        return false;
      } else {}
    }

    // Son
    else if (relationId == RelationshipEnum.Son.value) {
      if (isMale()) {
        if (addedRelationNotContains(relation: RelationshipEnum.Wife)) {
          showError(ForCase: 2);
          return false;
        }
      } else if (isFemale()) {
        if (addedRelationNotContains(relation: RelationshipEnum.Husband)) {
          showError(ForCase: 3);
          return false;
        }
      }
    }

    // Daughter
    else if (relationId == RelationshipEnum.Daughter.value) {
      if (isMale()) {
        if (addedRelationNotContains(relation: RelationshipEnum.Wife)) {
          showError(ForCase: 4);
          return false;
        }
      } else if (isFemale()) {
        if (addedRelationNotContains(relation: RelationshipEnum.Husband)) {
          showError(ForCase: 5);
          return false;
        }
      }
    }

    // Brother
    else if (relationId == RelationshipEnum.Brother.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Father) ||
          addedRelationNotContains(relation: RelationshipEnum.Mother)) {
        showError(ForCase: 6);
        return false;
      }
    }

// Sister
    if (relationId == RelationshipEnum.Sister.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Father) ||
          addedRelationNotContains(relation: RelationshipEnum.Mother)) {
        showError(ForCase: 7);
        return false;
      }
    }

    // GreatGrandFather

    if (relationId == RelationshipEnum.GreatGrandFather.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Father)) {
        showError(ForCase: 8);
        return false;
      }
    }

    // GreatGrandMother
    if (relationId == RelationshipEnum.GreatGrandMother.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Father)) {
        showError(ForCase: 9);
        return false;
      }
    }

// GrandFather
    if (relationId == RelationshipEnum.GrandFather.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Father)) {
        showError(ForCase: 10);
        return false;
      }
    }
// GrandMother
    if (relationId == RelationshipEnum.GrandMother.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Father)) {
        showError(ForCase: 11);
        return false;
      }
    }
// GrandFatherNana
    if (relationId == RelationshipEnum.GrandFatherNana.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Mother)) {
        showError(ForCase: 12);
        return false;
      }
    }
// GrandMotherNani
    if (relationId == RelationshipEnum.GrandMotherNani.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Mother)) {
        showError(ForCase: 13);
        return false;
      }
    }

    // FatherInLaw
    if (relationId == RelationshipEnum.FatherInLaw.value) {
      if (isMale()) {
        if (addedRelationNotContains(relation: RelationshipEnum.Wife)) {
          showError(ForCase: 14);
          return false;
        }
      } else if (isFemale()) {
        if (addedRelationNotContains(relation: RelationshipEnum.Husband)) {
          showError(ForCase: 15);
          return false;
        }
      }
    }
    // MotherInLaw
    if (relationId == RelationshipEnum.MotherInLaw.value) {
      if (isMale()) {
        if (addedRelationNotContains(relation: RelationshipEnum.Wife)) {
          showError(ForCase: 16);
          return false;
        }
      } else if (isFemale()) {
        if (addedRelationNotContains(relation: RelationshipEnum.Husband)) {
          showError(ForCase: 17);
          return false;
        }
      }
    }

    //Grandson
    if (relationId == RelationshipEnum.Grandson.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Son)) {
        showError(ForCase: 18);
        return false;
      }
    }
// GrandDaughter
    if (relationId == RelationshipEnum.Granddaughter.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Son)) {
        showError(ForCase: 19);
        return false;
      }
    }
// Uncle
    if (relationId == RelationshipEnum.Uncle.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Father)) {
        showError(ForCase: 20);
        return false;
      }
    }
// Aunt
    if (relationId == RelationshipEnum.Aunt.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Uncle)) {
        showError(ForCase: 21);
        return false;
      }
    }

// CousinBrother
    if (relationId == RelationshipEnum.CousinBrother.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Uncle) &&
          addedRelationNotContains(relation: RelationshipEnum.Aunt)) {
        showError(ForCase: 22);
        return false;
      }
    }
// CousinSister
    if (relationId == RelationshipEnum.CousinSister.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Uncle) &&
          addedRelationNotContains(relation: RelationshipEnum.Aunt)) {
        showError(ForCase: 23);
        return false;
      }
    }
    // Nephew
    if (relationId == RelationshipEnum.Nephew.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Brother)) {
        showError(ForCase: 24);
        return false;
      }
    }

    // Niece
    if (relationId == RelationshipEnum.Niece.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Brother)) {
        showError(ForCase: 25);
        return false;
      }
    }
// Maternal Uncle
    if (relationId == RelationshipEnum.MaternalUncle.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Mother)) {
        showError(ForCase: 26);
        return false;
      }
    }
// Maternal Aunt
    if (relationId == RelationshipEnum.MaternalAunt.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.MaternalUncle)) {
        showError(ForCase: 27);
        return false;
      }
    }
// Step Father
    if (relationId == RelationshipEnum.StepFather.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Mother)) {
        showError(ForCase: 28);
        return false;
      }
    }
    // Step Mother
    if (relationId == RelationshipEnum.StepMother.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Father)) {
        showError(ForCase: 29);
        return false;
      }
    }

    // Step Brother
    if (relationId == RelationshipEnum.StepBrother.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.StepMother) &&
          addedRelationNotContains(relation: RelationshipEnum.StepFather)) {
        showError(ForCase: 30);
        return false;
      }
    }

    // Step Sister
    if (relationId == RelationshipEnum.StepSister.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.StepMother) &&
          addedRelationNotContains(relation: RelationshipEnum.StepFather)) {
        showError(ForCase: 31);
        return false;
      }
    }

    // AuntBua
    if (relationId == RelationshipEnum.AuntBua.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Father)) {
        showError(ForCase: 32);
        return false;
      }
    }
// Uncle FuFa
    if (relationId == RelationshipEnum.UncleFufa.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.AuntBua)) {
        showError(ForCase: 33);
        return false;
      }
    }

    // Aunt Mausi
    if (relationId == RelationshipEnum.AuntMausi.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Mother)) {
        showError(ForCase: 34);
        return false;
      }
    }

    // Uncle Mausa
    if (relationId == RelationshipEnum.UncleMausa.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.AuntMausi)) {
        showError(ForCase: 35);
        return false;
      }
    }

// NephewSistersSon
    if (relationId == RelationshipEnum.NephewSistersSon.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Sister)) {
        showError(ForCase: 36);
        return false;
      }
    }

// NieceSistersDaughter
    if (relationId == RelationshipEnum.NieceSistersDaughter.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Sister)) {
        showError(ForCase: 37);
        return false;
      }
    }
//   BrotherInLaw
    if (relationId == RelationshipEnum.BrotherInLaw.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Sister)) {
        showError(ForCase: 38);
        return false;
      }
    }

//CousinBrotherMaternal
    if (relationId == RelationshipEnum.CousinBrotherMaternal.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.MaternalUncle) &&
          addedRelationNotContains(relation: RelationshipEnum.MaternalAunt)) {
        showError(ForCase: 39);
        return false;
      }
    }
//CousinSisterMaternal
    if (relationId == RelationshipEnum.CousinSisterMaternal.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.MaternalUncle) &&
          addedRelationNotContains(relation: RelationshipEnum.MaternalAunt)) {
        showError(ForCase: 40);
        return false;
      }
    }
    //CousinBrotherBua
    if (relationId == RelationshipEnum.CousinBrotherBua.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.UncleFufa) &&
          addedRelationNotContains(relation: RelationshipEnum.AuntBua)) {
        showError(ForCase: 41);
        return false;
      }
    }
    //CousinSisterBua
    if (relationId == RelationshipEnum.CousinSisterBua.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.UncleFufa) &&
          addedRelationNotContains(relation: RelationshipEnum.AuntBua)) {
        showError(ForCase: 42);
        return false;
      }
    }

    //SisterInLaw
    if (relationId == RelationshipEnum.SisterInLaw.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Brother)) {
        showError(ForCase: 43);
        return false;
      }
    }
    // DaugherInLaw
    if (relationId == RelationshipEnum.DaughterInLaw.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Son)) {
        showError(ForCase: 44);
        return false;
      }
    }
    //SonInLaw
    if (relationId == RelationshipEnum.SonInLaw.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Daughter)) {
        showError(ForCase: 45);
        return false;
      }
    }
    //GrandDaughterInLaw
    if (relationId == RelationshipEnum.GrandDaughterInLaw.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Grandson)) {
        showError(ForCase: 46);
        return false;
      }
    }

    //GrandSonInLaw
    if (relationId == RelationshipEnum.GrandSonInLaw.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Granddaughter)) {
        showError(ForCase: 47);
        return false;
      }
    }
    // GreatGrandSon
    if (relationId == RelationshipEnum.GreatGrandSon.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Grandson) &&
          addedRelationNotContains(
              relation: RelationshipEnum.GrandDaughterInLaw)) {
        showError(ForCase: 48);
        return false;
      }
    }
    //GreatGrandDaughter
    if (relationId == RelationshipEnum.GreatGrandDaughter.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Grandson) &&
          addedRelationNotContains(
              relation: RelationshipEnum.GrandDaughterInLaw)) {
        showError(ForCase: 49);
        return false;
      }
    }

    //CousinBrotherMausi
    if (relationId == RelationshipEnum.CousinBrotherMausi.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.UncleMausa) &&
          addedRelationNotContains(relation: RelationshipEnum.AuntMausi)) {
        showError(ForCase: 50);
        return false;
      }
    }

//CousinSisterMausi
    if (relationId == RelationshipEnum.CousinSisterMausi.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.UncleMausa) &&
          addedRelationNotContains(relation: RelationshipEnum.AuntMausi)) {
        showError(ForCase: 51);
        return false;
      }
    }

    //Mother
    if (relationId == RelationshipEnum.Mother.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Father)) {
        showError(ForCase: 52);
        return false;
      }
    }
    //SonOfDaughter
    if (relationId == RelationshipEnum.SonOfDaughter.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Daughter)) {
        showError(ForCase: 55);
        return false;
      }
    }

    // Daughter of Daughter
    if (relationId == RelationshipEnum.DaughterOfDaughter.value) {
      if (addedRelationNotContains(relation: RelationshipEnum.Daughter)) {
        showError(ForCase: 56);
        return false;
      }
    }

    // Husband

    return true;
  }

  void showErrorForSecondRelation({required String selectedRelation}) {
    if (selectedRelation == RelationshipEnum.BrotherInLaw.value) {
      showError(ForCase: 38);
    } else if (selectedRelation == RelationshipEnum.SisterInLaw.value) {
      showError(ForCase: 43);
    } else if (selectedRelation == RelationshipEnum.DaughterInLaw.value) {
      showError(ForCase: 44);
    } else if (selectedRelation == RelationshipEnum.SonInLaw.value) {
      showError(ForCase: 45);
    } else if (selectedRelation == RelationshipEnum.Aunt.value) {
      showError(ForCase: 21);
    } else if (selectedRelation == RelationshipEnum.MaternalAunt.value) {
      showError(ForCase: 27);
    } else if (selectedRelation == RelationshipEnum.UncleFufa.value) {
      showError(ForCase: 33);
    } else if (selectedRelation == RelationshipEnum.GrandDaughterInLaw.value) {
      showError(ForCase: 46);
    } else if (selectedRelation == RelationshipEnum.GrandSonInLaw.value) {
      showError(ForCase: 47);
    } else if (selectedRelation == RelationshipEnum.UncleMausa.value) {
      showError(ForCase: 35);
    }
  }

  getError({required int ForCase}) {
    switch (ForCase) {
      case 0:
        return "You cannot add your husband.";
      case 1:
        return "You cannot add your wife.";
      case 2:
        return "Please add your wife before adding your son.";
      case 3:
        return "Please add your husband before adding your son.";
      case 4:
        return "Please add your wife before adding your daughter.";
      case 5:
        return "Please add your husband before adding your daughter.";
      case 6:
        return "Please add your father and mother before adding your brother.";
      case 7:
        return "Please add your father and mother before adding your sister.";
      case 8:
        return "Please add your father before adding your great grandfather.";
      case 9:
        return "Please add your father before adding your great grandmother.";
      case 10:
        return "Please add your father before adding your grand father.";
      case 11:
        return "Please add your father before adding your grand mother.";
      case 12:
        return "Please add your mother before adding your grandfather (nana).";
      case 13:
        return "Please add your mother before adding your grandmother (nani).";
      case 14:
        return "Please add your wife before adding your father in law.";
      case 15:
        return "Please add your husband before adding your father-in-law.";
      case 16:
        return "Please add your wife before adding your mother in law.";
      case 17:
        return "Please add your husband before adding your mother-in-law.";
      case 18:
        return "Please add your son before adding your grandson.";
      case 19:
        return "Please add your son before adding your granddaughter.";
      case 20:
        return "Please add your father before adding your uncle.";
      case 21:
        return "Please add your uncle before adding your aunt.";
      case 22:
        return "Please add your uncle/aunt before adding your cousin brother.";
      case 23:
        return "Please add your uncle/aunt before adding your cousin sister.";
      case 24:
        return "Please add your brother before adding your nephew.";
      case 25:
        return "Please add your brother before adding your niece.";
      case 26:
        return "Please add your mother before adding your maternal uncle.";
      case 27:
        return "Please add your maternal uncle before adding your maternal aunt.";
      case 28:
        return "Please add your mother before adding your stepfather.";
      case 29:
        return "Please add your father before adding your step mother.";
      case 30:
        return "Please add your step mother or step father before adding your stepbrother.";
      case 31:
        return "Please add your step mother or step father before adding your stepsister.";
      case 32:
        return "Please add your father before adding your aunt(bua).";
      case 33:
        return "Please add your aunt before adding your uncle (fufa).";
      case 34:
        return "Please add your mother before adding your aunt (mausi).";
      case 35:
        return "Please add your aunt before adding your uncle (mausa).";
      case 36:
        return "Please add your sister before adding your nephew(sister\'s son).";
      case 37:
        return "Please add your sister before adding your niece (sister\'s daughter).";
      case 38:
        return "Please add your sister before adding your brother-in-law.";
      case 39:
        return "Please add your maternal uncle and aunt before adding your cousin brother(son of maternal uncle).";
      case 40:
        return "Please add your maternal uncle and aunt before adding your cousin sister(daughter of maternal uncle).";
      case 41:
        return "Please add your aunt (bua) and uncle (fufa) before adding your cousin brother (bua\'s son).";
      case 42:
        return "Please add your aunt (bua) and uncle (fufa) before adding your cousin sister (bua\'s daughter)";
      case 43:
        return "Please add your brother before adding your sister-in-law.";
      case 44:
        return "Please add your son before adding your daughter-in-law.";
      case 45:
        return "Please add your daughter before adding your son-in-law.";
      case 46:
        return "Please add your grandson before adding granddaughter-in-law.";
      case 47:
        return "Please add your granddaughter before adding grandson-in-law.";
      case 48:
        return "Please add your grandson and granddaughter-in-law before adding great grandson.";
      case 49:
        return "Please add your grandson and granddaughter-in-law before adding great granddaughter.";
      case 51:
        return "Please add your uncle (mausa) and aunt (mausi) before adding your cousin sister (daughter of mausi).";
      case 50:
        return "Please add your uncle (mausa) and aunt (mausi) before adding your cousin brother (son of mausi).";
      case 52:
        return "Please add your father before adding your mother.";
      case 53:
        return "Please add your father and mother before adding your wife.";
      case 54:
        return "Please add your father and mother before adding your husband.";
      case 55:
        return "Please add your Daughter before adding your grand son.";
      case 56:
        return "Please add your Daughter before adding your grand daughter.";
    }
  }

  showError({required int ForCase}) {
    final snackBar = SnackBar(
      content: Text(getError(ForCase: ForCase)),
      backgroundColor: Color(0xFFe03600),
      behavior: SnackBarBehavior.fixed,
      action: SnackBarAction(
        label: 'Ok',
        disabledTextColor: Colors.white,
        textColor: Colors.white,
        onPressed: () {
          //Do whatever you want
        },
      ),
    );

    ScaffoldMessenger.of(appNavigator.navigationContext!).hideCurrentSnackBar();
    ScaffoldMessenger.of(appNavigator.navigationContext!)
        .showSnackBar(snackBar);
  }

  String getRelationGender({required String relationId}) {
    if (RelationshipEnum.Wife.value == relationId ||
        RelationshipEnum.Sister.value == relationId ||
        relationId == RelationshipEnum.Mother.value ||
        relationId == RelationshipEnum.MotherInLaw.value ||
        relationId == RelationshipEnum.AuntBua.value ||
        relationId == RelationshipEnum.Sister.value ||
        relationId == RelationshipEnum.AuntMausi.value ||
        relationId == RelationshipEnum.CousinSisterBua.value ||
        relationId == RelationshipEnum.CousinSisterMausi.value ||
        relationId == RelationshipEnum.GrandMotherNani.value ||
        RelationshipEnum.Daughter.value == relationId ||
        relationId == RelationshipEnum.GreatGrandMother.value ||
        relationId == RelationshipEnum.GrandMother.value ||
        relationId == RelationshipEnum.StepMother.value ||
        relationId == RelationshipEnum.NieceSistersDaughter.value ||
        relationId == RelationshipEnum.CousinSisterMaternal.value ||
        relationId == RelationshipEnum.Aunt.value ||
        relationId == RelationshipEnum.DaughterInLaw.value ||
        relationId == RelationshipEnum.GrandDaughterInLaw.value ||
        relationId == RelationshipEnum.MaternalAunt.value ||
        relationId == RelationshipEnum.SisterInLaw.value ||
        relationId == RelationshipEnum.NieceSistersDaughter.value ||
        relationId == RelationshipEnum.CousinSister.value ||
        relationId == RelationshipEnum.Granddaughter.value ||
        relationId == RelationshipEnum.Niece.value ||
        relationId == RelationshipEnum.GreatGrandDaughter.value ||
        relationId == RelationshipEnum.DaughterOfDaughter.value ||
        relationId == RelationshipEnum.CousinSisterBua.value) {
      return "Female";
    } else {
      return "Male";
    }
  }

  bool isSecondRelation({required String relationId}) {
    if (RelationshipEnum.Aunt.value == relationId ||
        RelationshipEnum.CousinBrother.value == relationId ||
        RelationshipEnum.CousinSister.value == relationId ||
        RelationshipEnum.Granddaughter.value == relationId ||
        RelationshipEnum.Grandson.value == relationId ||
        RelationshipEnum.Nephew.value == relationId ||
        RelationshipEnum.Niece.value == relationId ||
        RelationshipEnum.GreatGrandSon.value == relationId ||
        RelationshipEnum.GreatGrandDaughter.value == relationId ||
        RelationshipEnum.MaternalAunt.value == relationId ||
        RelationshipEnum.DaughterInLaw.value == relationId ||
        RelationshipEnum.SonInLaw.value == relationId ||
        RelationshipEnum.GrandDaughterInLaw.value == relationId ||
        RelationshipEnum.UncleFufa.value == relationId ||
        RelationshipEnum.CousinBrotherBua.value == relationId ||
        RelationshipEnum.CousinSisterBua.value == relationId ||
        RelationshipEnum.UncleMausa.value == relationId ||
        RelationshipEnum.CousinBrotherMausi.value == relationId ||
        RelationshipEnum.CousinSisterMausi.value == relationId ||
        RelationshipEnum.NephewSistersSon.value == relationId ||
        RelationshipEnum.NieceSistersDaughter.value == relationId ||
        RelationshipEnum.BrotherInLaw.value == relationId ||
        RelationshipEnum.SisterInLaw.value == relationId ||
        RelationshipEnum.CousinBrotherMaternal.value == relationId ||
        RelationshipEnum.CousinSisterMaternal.value == relationId ||
        RelationshipEnum.GrandSonInLaw.value == relationId ||
        RelationshipEnum.SonOfDaughter.value == relationId ||
        RelationshipEnum.DaughterOfDaughter.value == relationId) {
      return true;
    } else {
      return false;
    }
  }
}
