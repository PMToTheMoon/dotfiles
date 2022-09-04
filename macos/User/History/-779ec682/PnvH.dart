import 'app_localizations.dart';

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get app_name => 'Zanalys';

  @override
  String get home_app_bar_subtitle => 'bonjour';

  @override
  String home_app_bar_title(String firstName) {
    return 'Docteur $firstName 👋';
  }

  @override
  String get status_done_label => 'Cloturé';

  @override
  String get empty_list_indicator => 'Il n\'y a rien à afficher';

  @override
  String get search => 'Rechercher';

  @override
  String get required_chip => 'Requis';

  @override
  String get add => 'Ajouter';

  @override
  String get request_tele_expertise => 'télé-expertise';

  @override
  String get request_consultation => 'consultation';

  @override
  String request_card_request_type(String type) {
    return 'Demande de $type du ';
  }

  @override
  String request_card_sender(String lastName) {
    return 'Docteur $lastName';
  }

  @override
  String get error_session_expired =>
      'Votre session a expiré, veuillez vous reconnecter';

  @override
  String get error_undefined =>
      'Une erreur est survenue. Merci de vérifier votre connexion et de réessayer';

  @override
  String get error_email_invalid => 'L\'identifié renseigné est invalide';

  @override
  String get error_password_invalid => 'Le mot de passe renseigné est invalide';

  @override
  String get required_error => 'Ce champ ne peut pas être vide.';

  @override
  String get sign_in_title => 'Connexion';

  @override
  String get sign_in_description =>
      'Bienvenue sur zanalys pour vous connecter veuillez récupérer l’identifiant qui vous a été transmis par mail';

  @override
  String get sign_in_hint_id => 'Identifiant zanalys';

  @override
  String get sign_in_hint_password => 'Mot de passe';

  @override
  String get sign_in_button => 'Se connecter';

  @override
  String get sign_in_keep_save_id => 'Se souvenir de moi';

  @override
  String get home_title => 'Bonjour Docteur';

  @override
  String get home_button_take_photo => 'Prendre une Photo';

  @override
  String get home_action_create_patient => 'Creer un patient';

  @override
  String get home_action_create_journey => 'Creer un parcours';

  @override
  String get home_tab_in_progress => 'En cours';

  @override
  String get home_tab_high_priority => 'Prioritaire';

  @override
  String get home_tab_draft => 'Brouillon';

  @override
  String get patient_list_page_title => 'Séléctionner un patient';

  @override
  String get patient_list_page_subtitle => 'Mes patients';

  @override
  String get patient_view_page_subtitle => 'Patient';

  @override
  String get patient_view_record_list_tab => 'Parcours';

  @override
  String get patient_view_infos_tab => 'Informations';

  @override
  String get image_picker_gallery => 'Galerie';

  @override
  String get image_picker_camera => 'Appareil photo';

  @override
  String get otp_title => 'Double authentification';

  @override
  String get otp_description =>
      'Un code vous a été envoyé par mail. Veuillez entrer \nce dernier pour vous connecter';

  @override
  String get otp_button => 'Valider';

  @override
  String get upload_document_title => 'Ajout de photo au dossier';

  @override
  String get upload_document_hint_access_code => 'Code d\'accès';

  @override
  String get upload_document_button => 'Envoyer photo';

  @override
  String get upload_document_success => 'Votre fichier a été ajouté';

  @override
  String get upload_document_confirmation_title => 'Ajouter photo au dossier';

  @override
  String get upload_document_confirmation_label => 'Votre fichier a été ajouté';

  @override
  String get initial_observation_page_title => 'Formulaire';

  @override
  String get validate_initial_observation => 'Partager';

  @override
  String get record_title => 'Titre du parcours';

  @override
  String get record_title_hint => 'Titre';

  @override
  String get general_initial_observation_page_subtitle => 'Général';

  @override
  String get hub_complete_button => 'Compléter';

  @override
  String get hub_bottom_sheet_title => 'Compléter le parcours';

  @override
  String get hub_bottom_sheet_consultation_rapport =>
      'Compte rendu de consultation';

  @override
  String get hub_bottom_sheet_exam_rapport => 'Compte rendu d’examen';

  @override
  String get hub_bottom_sheet_followup => 'Suivi parcours';

  @override
  String get hub_bottom_sheet_close_record => 'Clôture';

  @override
  String get hidden_observation_title => 'Motif';

  @override
  String get hidden_observation_subtitle => '(non visible par le patient)';

  @override
  String get hidden_observation_hint => 'Ecrire un motif ici';

  @override
  String get hidden_observation_error =>
      'Vous devez remplir le motif ou l’observation';

  @override
  String get patient_observation_title => 'Observation';

  @override
  String get patient_observation_subtitle => '(partagé avec le patient)';

  @override
  String get patient_observation_hint => 'Ecrire un motif ici';

  @override
  String get patient_observation_error =>
      'Vous devez remplir le motif ou l’observation';

  @override
  String get clinical_exam_title => 'Examen clinique';

  @override
  String get weight_hint => 'Poids (Kg)';

  @override
  String get height_hint => 'Taille (cm)';

  @override
  String get pas_hint => 'PAS';

  @override
  String get pad_hint => 'PAD';

  @override
  String get temperature_hint => 'Température';

  @override
  String get heart_rate_hint => 'Freq. cardiaque';

  @override
  String get medical_history_title => 'Antécédents';

  @override
  String get medical_history_subtitle => 'personnels et familiaux';

  @override
  String get medical_history_hint => 'Ajouter un antécédent';

  @override
  String get symptoms_title => 'Symptômes';

  @override
  String get symptoms_hint => 'Ajouter un symptôme';

  @override
  String get treatment_title => 'Traitements en cours';

  @override
  String get treatment_hint => 'Ajouter un traitement';

  @override
  String get additional_observation_title => 'Examens complémentaires';

  @override
  String get additional_observation_hint => 'Ecrire un motif ici';

  @override
  String get obs_rapport_title => 'Compte rendu';

  @override
  String get obs_rapport_subtitle => '(partagé avec le patient)';

  @override
  String get obs_appointment_title => 'Rendez-vous programmé';

  @override
  String get obs_form_new_consultation_title =>
      'Programmer un autre rendez vous patient';

  @override
  String get obs_form_new_consultation_label =>
      'Souhaitez-vous compléter la prise en charge du patient par un rendez vous en:';

  @override
  String get obs_consultation_in_person => 'Présentiel';

  @override
  String get obs_consultation_distance => 'Téléconsultation';

  @override
  String get obs_no_consultation => 'Pas de rendez vous supplémentaire';

  @override
  String get obs_share_button => 'Partager';
}
