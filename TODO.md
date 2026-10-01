Mon frère, voici le prompt complet et définitif, avec toutes les informations sur FOKAS Boutique intégrées.

---

PROMPT POUR GITHUB COPILOT — Reconstruction complète d'AyatunaHub

Colle tout ce document tel quel dans Copilot Chat (mode Agent de préférence,
pas juste autocomplete) à la racine du projet ouvert dans VS Code.

---

0. CONTEXTE DU PROJET

Application Flutter islamique AyatunaHub pour Android (iOS plus tard).

· Package : com.fokas.ayatunahub
· Marque : FOKAS (First Organization for Knowledge, Automation & Security)
· Couleurs : vert islamique #0C6B4E (primaire), doré #FFD700 (accent)
· Police : Google Fonts – Poppins
· Backend : Firebase (Firestore, Auth, Crashlytics, Messaging ; Analytics
  et Performance à ajouter — voir section 7)
· Public cible : francophones (RDC, Burundi, Bénin, Sénégal, Côte
  d'Ivoire, Afrique francophone, diaspora)
· Objectif : lancement avant le Ramadan 2027
· Auteur : Fokas Blanchard — amissilwano5@gmail.com (compte admin
  automatique) — Bukavu, RDC
· SDK Dart : >=3.13.0 <4.0.0

Stack technique exacte à utiliser (pubspec.yaml)

```yaml
dependencies:
  flutter:
    sdk: flutter

  # Firebase
  firebase_core: ^3.12.0
  firebase_auth: ^5.5.0
  cloud_firestore: ^5.6.0
  firebase_crashlytics: ^4.1.0
  firebase_performance: ^0.10.0
  firebase_messaging: ^15.2.0
  firebase_analytics: ^11.4.0        # à ajouter, absent actuellement

  # YouTube
  youtube_player_flutter: ^9.1.1
  http: ^1.6.0

  # UI
  google_fonts: ^6.1.0
  flutter_svg: ^2.2.3
  intl: ^0.18.1

  # Stockage local
  shared_preferences: ^2.5.0

  # Audio
  just_audio: ^0.10.6
  audio_service: ^0.18.0

  # Géolocalisation et cartes
  geolocator: ^10.1.0
  flutter_map: ^6.1.0
  latlong2: ^0.9.0

  # Prière et calendrier
  hijri_calendar: ^1.0.0

  # Coran et Hadiths
  quran: ^1.4.1
  dorar_hadith: ^0.3.0

  # Notifications
  flutter_local_notifications: ^17.2.3

  # Paiements
  in_app_purchase: ^3.2.4

  # Publicités
  google_mobile_ads: ^9.0.0

  # Utilitaires
  url_launcher: ^6.2.0
  webview_flutter: ^4.13.0
  provider: ^6.1.1
  cupertino_icons: ^1.0.8

dev_dependencies:
  flutter_lints: ^6.0.0
  flutter_launcher_icons: ^0.13.1
  flutter_native_splash: ^2.4.0
```

---

1. RÈGLES DE TRAVAIL (à respecter STRICTEMENT)

1. Ne jamais renommer ou déplacer un fichier existant sans le dire
   explicitement avant de le faire. La structure réelle du projet utilise
   des noms comme quran_page.dart, hadiths_page.dart, prayer_page.dart
   (et NON quran_screen.dart, hadith_screen.dart, etc.) — respecte cette
   convention *_page.dart pour les pages dans lib/pages/, et *_screen.dart
   pour les écrans de premier niveau dans lib/screens/.
2. Un seul flux d'authentification : main.dart → SplashScreen →
      RedirectPage → LoginPage / HomeScreen. Le flux passe par
   lib/services/firebase/auth.dart (classe AppAuth). N'introduis jamais
   un deuxième système d'auth en parallèle.
3. Avant de modifier un fichier qui fonctionne déjà, demande
   confirmation et explique ce que tu vas changer et pourquoi.
4. Jamais de clé API en dur dans le code ni dans un fichier commité.
   Utilise --dart-define-from-file=env.json (voir lib/core/env.dart,
   classe AppEnv, basée sur String.fromEnvironment). env.json doit
   être dans .gitignore. Un env.json.example sans valeurs réelles est
   commité à la place.
5. Pas de fichiers dupliqués / orphelins. Avant de créer un nouveau
   service ou modèle, vérifie qu'il n'existe pas déjà une version (même
   partielle) ailleurs dans le projet, et si oui, complète-la au lieu d'en
   créer une deuxième.
6. Chaque nouvelle dépendance ajoutée à pubspec.yaml doit être
   réellement utilisée dans le code avant la fin de la tâche — pas de
   dépendance fantôme.
7. Langue de l'interface utilisateur : français. Commentaires de code :
   français également, pour rester cohérent avec le reste du projet.
8. Respecte le thème visuel existant : vert #0C6B4E / doré #FFD700,
   GoogleFonts.poppins, coins arrondis (BorderRadius.circular(20) pour
   les cartes), useMaterial3: true.

---

2. ARCHITECTURE CIBLE (dossiers réels du projet)

```
lib/
├── main.dart
├── firebase_options.dart
├── login_page.dart
├── redirection_page.dart
├── core/
│   ├── app_theme.dart        (AppTheme.light / AppTheme.dark)
│   └── env.dart               (AppEnv — clés API compilées)
├── models/
│   └── channel_model.dart
├── data/
│   ├── channels_data.dart
│   ├── hadith_data.dart
│   ├── pillars_data.dart
│   ├── quran_catalog.dart
│   ├── quran_data.dart
│   └── quran_sample.dart
├── screens/                   (écrans de premier niveau, 1 par onglet + annexes)
│   ├── splash_screen.dart
│   ├── home_screen.dart       (Scaffold + BottomNavigationBar, 6 onglets)
│   ├── live_screen.dart
│   ├── qibla_screen.dart
│   └── map_screen.dart
├── pages/                     (pages accessibles depuis le Drawer/HomePage)
│   ├── home_page.dart
│   ├── quran_page.dart
│   ├── hadiths_page.dart
│   ├── prayer_page.dart
│   ├── calendar_page.dart
│   ├── favorites_page.dart
│   ├── learn_page.dart
│   ├── prophets_page.dart
│   ├── premium_page.dart
│   ├── profile_page.dart      # ⚠️ À CRÉER — voir 3.12
│   ├── boutique_page.dart     # ⚠️ À CRÉER — voir 3.16
│   └── about_page.dart
└── services/
    ├── firebase/auth.dart     (AppAuth)
    ├── theme_service.dart
    ├── messaging_service.dart
    ├── ads_service.dart
    ├── ad_banner_box.dart
    ├── purchase_service.dart
    ├── activation_code_service.dart
    ├── premium_service.dart
    ├── notification_service.dart
    ├── prayer_service.dart
    ├── qibla_service.dart
    ├── calendar_service.dart
    ├── location_service.dart
    ├── dorar_hadith_service.dart
    ├── user_service.dart
    ├── storage_service.dart
    ├── youtube_service.dart
    └── boutique_service.dart   # ⚠️ À CRÉER — voir 3.16
```

Navigation réelle : HomeScreen a une BottomNavigationBar à 6 onglets
(IndexedStack) : Accueil, Prière, Qibla, Calendrier, Live, Carte. Les
autres pages (Coran, Hadiths, Favoris, Premium, Boutique, Apprendre,
Prophètes, À propos) sont accessibles via le Drawer latéral ouvert depuis
HomePage.

---

3. FONCTIONNALITÉ PAR FONCTIONNALITÉ — DÉTAIL COMPLET

Pour chaque module : objectif, état actuel, ce qu'il faut faire,
fichiers concernés, outils/packages.

3.1 Authentification

· Objectif : inscription/connexion email+mot de passe, compte admin
  automatique pour amissilwano5@gmail.com, document Firestore
  users/{uid} créé à l'inscription (role, isSubscribed, createdAt).
· État : fonctionnel via AppAuth (services/firebase/auth.dart) +
  login_page.dart + redirection_page.dart.
· À faire : vérifier qu'isAdmin se propage bien jusqu'à
  HomeScreen(isAdmin: ...) et s'affiche dans l'AppBar. Ajouter une vraie
  page de réinitialisation de mot de passe (sendPasswordResetEmail) si
  absente.
· Outils : firebase_auth, cloud_firestore.

3.2 Thème sombre / clair

· Objectif : bascule clair/sombre, persistée sur l'appareil, couleurs
  de marque adaptées en sombre (fond #10201A, surfaces #17281F).
· État : AppTheme.light et AppTheme.dark existent dans
  core/app_theme.dart. ThemeService (ChangeNotifier + SharedPreferences)
  existe dans services/theme_service.dart. Branché dans main.dart via
  ListenableBuilder + themeMode: ThemeService.instance.mode. Interrupteur
  dans le Drawer de home_page.dart.
· À faire : vérifier le rendu sombre sur TOUTES les pages (certaines
  pages utilisent peut-être des couleurs blanches en dur au lieu de
  Theme.of(context).colorScheme... — à corriger page par page).
· Outils : ChangeNotifier, shared_preferences.

3.3 Lecteur audio (récitations) — ⚠️ À CONSTRUIRE ENTIÈREMENT

· Objectif : jouer la récitation audio d'une sourate (Coran) et/ou de
  hadiths audio, avec barre de progression, play/pause, suivant/précédent,
  et contrôles sur l'écran verrouillé / notification (lecture en
  arrière-plan).
· État : INEXISTANT. just_audio et audio_service sont dans
  pubspec.yaml mais ne sont utilisés nulle part.
· À faire :
  1. Créer lib/services/audio_service.dart : classe RecitationAudioHandler
     qui étend BaseAudioHandler (package audio_service) et encapsule un
     AudioPlayer (just_audio).
  2. Initialiser le handler dans main.dart via AudioService.init(...).
  3. Créer lib/widgets/audio_player_widget.dart : barre de progression
     (Slider ou ProgressBar), bouton play/pause, temps écoulé/restant,
     utilisant StreamBuilder sur player.positionStream et
     player.durationStream.
  4. Brancher ce widget dans quran_page.dart (lecture d'une sourate, URL
     audio depuis une API de récitation publique comme everyayah.com ou
     mp3quran.net — à choisir et documenter) et éventuellement dans
     hadiths_page.dart si des hadiths audio existent.
  5. Gérer le téléchargement/cache local optionnel pour l'écoute hors-ligne
     (path_provider + dio si besoin, à ajouter en dépendance).
· Outils : just_audio, audio_service.

3.4 Qibla (boussole)

· Objectif : indiquer la direction de la Mecque depuis la position GPS.
· État : fonctionnel (qibla_screen.dart, services/qibla_service.dart,
  services/location_service.dart).
· À faire : rien d'urgent. Vérifier la gestion des permissions refusées
  (message clair à l'utilisateur plutôt qu'un crash).
· Outils : geolocator.

3.5 Notifications de prière (Adhan)

· Objectif : notification locale à chaque heure de prière, avec son
  d'Adhan.
· État : fonctionnel (notification_service.dart, prayer_page.dart,
  prayer_service.dart).
· À faire : vérifier la demande de permission POST_NOTIFICATIONS
  (Android 13+) est bien demandée au premier lancement.
· Outils : flutter_local_notifications.

3.6 Notifications push (Firebase Messaging)

· Objectif : notifications serveur (annonces admin, alertes Live) en
  plus des notifications locales de prière.
· État : services/messaging_service.dart existe, branché dans
  main.dart. Token FCM sauvegardé dans users/{uid}.fcmToken.
· À faire : créer côté Firebase Console / Cloud Functions l'envoi
  réel (hors scope Flutter). Ajouter un écran Admin simple pour envoyer un
  message à tous (topic all_users) si souhaité.
· Outils : firebase_messaging.

3.7 Recherche de Hadiths

· Objectif : recherche et affichage de hadiths via l'API/package
  dorar_hadith.
· État : fonctionnel (hadiths_page.dart, dorar_hadith_service.dart).
· À faire : rien d'urgent — vérifier la gestion des erreurs réseau
  (message "pas de connexion" plutôt qu'un écran blanc).
· Outils : dorar_hadith.

3.8 Coran (liste des sourates + lecture)

· État : liste fonctionnelle (quran_page.dart, données dans
  data/quran_catalog.dart, quran_data.dart, quran_sample.dart — ⚠️
  vérifier s'il n'y a pas redondance entre ces 3 fichiers de données, à
  fusionner en un seul si oui).
· À faire : brancher le lecteur audio (section 3.3).
· Outils : package quran.

3.9 Calendrier hégirien

· État : fonctionnel dans son propre onglet (calendar_page.dart,
  calendar_service.dart, package hijri_calendar).
· À faire : afficher également la date hégirienne du jour sur
  l'écran d'accueil (home_page.dart), pas seulement dans l'onglet
  Calendrier — c'était prévu à l'origine et manquant.
· Outils : hijri_calendar, intl.

3.10 Live (chaînes YouTube)

· État : fonctionnel (live_screen.dart, youtube_service.dart,
  channels_data.dart — 9 chaînes sur 16 prévues, IDs à finaliser via le
  script resolve_channel_ids.dart fourni séparément).
· À faire : compléter les 16 chaînes avec leurs vrais channelId
  YouTube (voir script séparé). Ajouter les 7 chaînes manquantes.
· Priorité absolue : les 3 chaînes de Live des lieux saints
  (Mecque, Médine, Al-Aqsa) pour le Ramadan 2027.
· Outils : youtube_player_flutter, API YouTube Data v3 (clé dans
  env.json, jamais en dur).

3.11 Carte (Qibla/mosquées à proximité)

· État : map_screen.dart existe (flutter_map + latlong2, pas
  Google Maps).
· À faire : vérifier/ajouter la recherche de mosquées à proximité si
  prévue (sinon, documenter que c'est hors scope actuel).
· Outils : flutter_map, latlong2, geolocator.

3.12 Profil utilisateur — ⚠️ À CRÉER

· Objectif : écran dédié affichant email, statut (admin/premium),
  bouton déconnexion, accès au thème, lien vers Premium, lien vers Boutique.
· État : INEXISTANT comme écran séparé (seul un badge "Admin" apparaît
  dans le titre de l'AppBar).
· À faire : créer lib/pages/profile_page.dart, l'ajouter au Drawer.
· Outils : firebase_auth, cloud_firestore (lecture du doc
  users/{uid}).

3.13 Premium (abonnements)

· Objectif : 3 offres payantes (1 mois / 2 mois / 1 an) via Google
  Play Billing uniquement (conformité Play Store) + un système de code
  d'activation pour les paiements Mobile Money gérés séparément sur le
  site web fokas-boutique2.netlify.app.
· État : fonctionnel (premium_page.dart, purchase_service.dart,
  activation_code_service.dart, premium_service.dart).
· À faire :
  1. Créer dans Play Console > Monétisation > Abonnements, exactement ces
     IDs produit : ayatunahub_premium_1mois, ayatunahub_premium_2mois,
     ayatunahub_premium_1an.
  2. Construire côté site web (hors Flutter) la génération de documents
     Firestore activationCodes/{code} après paiement Mobile Money
     confirmé (structure documentée dans le code — champs plan, used,
     expiresAt).
  3. Ajouter une validation serveur des reçus Play Billing (Cloud
     Function + Play Developer API) avant la mise en production, pour
     éviter la fraude.
· Outils : in_app_purchase, cloud_firestore, Cloud Functions
  (Node.js/TypeScript, à créer dans un dossier functions/ séparé).

3.14 Publicités (AdMob)

· État : fonctionnel (ads_service.dart, ad_banner_box.dart) avec
  IDs de test Google. Désactivées automatiquement pour les utilisateurs
  Premium.
· À faire : créer un vrai compte AdMob, remplacer les IDs de test par
  les vrais dans ads_service.dart ET android/app/src/main/AndroidManifest.xml
  avant publication. Décider des emplacements de bannières (actuellement
  aucune bannière n'est encore posée dans l'UI, seul l'interstitiel après
  un Live est actif).
· Outils : google_mobile_ads.

3.15 Firebase Analytics & Performance — ⚠️ À FAIRE

· État : firebase_analytics absent de pubspec.yaml.
  firebase_performance présent mais jamais initialisé.
· À faire :
  1. Ajouter firebase_analytics: ^11.4.0 à pubspec.yaml.
  2. Initialiser FirebaseAnalytics.instance dans main.dart, logger les
     événements clés : screen_view (via FirebaseAnalyticsObserver sur
     MaterialApp.navigatorObservers), login, sign_up,
     premium_purchase, live_watched, boutique_opened.
  3. Initialiser FirebasePerformance.instance dans main.dart pour
     tracer automatiquement les temps de chargement réseau.
· Outils : firebase_analytics, firebase_performance.

3.16 Boutique FOKAS — ⚠️ À CRÉER ENTIÈREMENT

3.16.1 Objectif

Connecter AyatunaHub à FOKAS Boutique, la boutique en ligne officielle
de la marque FOKAS (site web séparé : https://fokas-boutique2.netlify.app).
Le but est de permettre aux utilisateurs d'AyatunaHub d'acheter des produits
islamiques (Corans, livres, tapis de prière, chapelets, encens), tech
(téléphones, accessoires), et services (développement d'app, création de
site) depuis l'app, sans sortir de leur expérience.

3.16.2 Contexte stratégique

· Boutique unifiée FOKAS : le site fokas-boutique2.netlify.app propose
  3 catégories : Islam, Chrétien, Tech. L'utilisateur choisit
  sa voie à l'arrivée sur le site.
· Partenariats locaux : FOKAS travaille avec des partenaires vendeurs à
  Bukavu (frères qui vendent produits islamiques, collègues chrétiens pour
  les produits chrétiens, vendeurs de téléphones, vendeurs de parcelles).
  Les commandes sont coordonnées via 4 groupes WhatsApp :
  · 🚀 FOKAS Boutique (général) — chat.whatsapp.com/D4g1KXHyRZK3PuOoIrevK3
  · 🕌 Fokas Boutique Muslim — chat.whatsapp.com/I8g5Kr3447X9N1nPga9SyK
  · ✝️ Fokas Boutique chrétien — chat.whatsapp.com/E0vF7EMVhon6uPLvjJANSV
  · 📱 Fokas Boutique Tech — chat.whatsapp.com/GVxbmvMzZrqJHoI2LxHrM4
· Livraison : d'abord uniquement à Bukavu, puis extension à toute la RDC
  et à l'Afrique francophone.
· Modèle économique :
  · Phase 1 (maintenant) : Fokas achète chez les partenaires et revend
    avec une marge de 20-30 %. Fokas gère la livraison.
  · Phase 2 (plus tard) : les entreprises créent leur compte vendeur sur
    le site et paient un abonnement mensuel de 35 $ (ou équivalent en FC)
    pour publier leurs produits. Fokas devient une marketplace à la Amazon /
    Jumia.

3.16.3 Fonctionnalité dans AyatunaHub

Ajouter un bouton "Visiter notre boutique" dans :

1. Le Drawer de home_page.dart
2. La page profile_page.dart (à créer en 3.12)
3. Idéalement : une carte sur l'écran d'accueil (sous les raccourcis rapides)

Quand l'utilisateur clique dessus :

1. Un message de sécurité s'affiche (AlertDialog) :
   · Titre : "🔒 Site sécurisé"
   · Contenu : "Vous allez être redirigé vers FOKAS Boutique. Ce site est
     sécurisé (HTTPS). Vos données sont protégées."
   · Boutons : "Annuler" / "Continuer"
2. Si l'utilisateur confirme, ouvrir le navigateur externe avec :
   https://fokas-boutique2.netlify.app
3. Logger l'événement Firebase Analytics : boutique_opened avec
   paramètre source (drawer, profile, home).

3.16.4 Code à créer

Fichier lib/services/boutique_service.dart :

```dart
import 'package:url_launcher/url_launcher.dart';

class BoutiqueService {
  static const String boutiqueUrl = 'https://fokas-boutique2.netlify.app';

  /// Ouvre la boutique dans le navigateur externe.
  static Future<bool> openBoutique() async {
    final uri = Uri.parse(boutiqueUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      return true;
    }
    return false;
  }
}
```

Fichier lib/pages/boutique_page.dart (page intermédiaire avec
présentation de la boutique avant redirection) :

```dart
import 'package:flutter/material.dart';
import '../services/boutique_service.dart';

class BoutiquePage extends StatelessWidget {
  const BoutiquePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🛍️ FOKAS Boutique'),
        backgroundColor: const Color(0xFF0C6B4E),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.shopping_bag,
                  size: 100, color: Color(0xFFFFD700)),
              const SizedBox(height: 24),
              const Text(
                'FOKAS Boutique',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0C6B4E),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Produits islamiques, chrétiens et tech.\nLivraison à Bukavu.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () => BoutiqueService.openBoutique(),
                icon: const Icon(Icons.open_in_new),
                label: const Text('Ouvrir la boutique'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0C6B4E),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

Ajout dans home_page.dart (dans le Drawer) :

```dart
ListTile(
  leading: const Icon(Icons.shopping_bag,
      color: Color(0xFFFFD700)),
  title: const Text('Visiter notre boutique'),
  subtitle: const Text('Produits islamiques, tech et plus'),
  onTap: () async {
    // Log Analytics
    // FirebaseAnalytics.instance.logEvent(name: 'boutique_opened',
    //     parameters: {'source': 'drawer'});

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('🔒 Site sécurisé'),
        content: const Text(
          'Vous allez être redirigé vers FOKAS Boutique.\n\n'
          'Ce site est sécurisé (HTTPS). Vos données sont protégées.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0C6B4E),
            ),
            child: const Text('Continuer'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await BoutiqueService.openBoutique();
    }
  },
),
```

3.16.5 Côté site web (hors scope Flutter)

Le site fokas-boutique2.netlify.app est un site statique
HTML/CSS/JS hébergé sur Netlify, avec :

· Une page d'accueil avec choix de religion (Islam / Chrétien) ou catégorie
  (Tech)
· Un catalogue de produits
· Un panier (localStorage)
· Un checkout qui envoie la commande par WhatsApp à +243 902 068 175
· Une page admin (à venir)
· À connecter à Firebase (prochaine étape séparée) : Firestore pour les
  produits, Auth pour les comptes clients, Firestore pour les commandes

3.16.6 Outils

· url_launcher (déjà dans pubspec.yaml)
· firebase_analytics (à ajouter)

---

4. NETTOYAGE DE CODE À FAIRE

· lib/services/models/channel_model.dart : doublon de
  lib/models/channel_model.dart, jamais importé, plus complet (a isLive
  et fromJson). Fusionner les deux en un seul (garder les champs
  supplémentaires), supprimer le doublon.
· lib/services/localisation_service.dart : doublon de
  lib/services/location_service.dart, jamais importé. Supprimer après
  vérification qu'aucune fonctionnalité utile n'est perdue.
· Vérifier data/quran_catalog.dart, data/quran_data.dart,
  data/quran_sample.dart pour redondance (3 fichiers de données Coran).

---

5. SÉCURITÉ — CHECKLIST OBLIGATOIRE AVANT PUBLICATION

☐ .env et clé.env retirés de git (git rm --cached) et clés
  API rotées (elles ont été exposées dans l'historique).
☐ Build uniquement avec flutter build apk --dart-define-from-file=env.json.
☐ Règles de sécurité Firestore (firestore.rules) écrites et
  déployées : un utilisateur ne peut lire/modifier que son propre
  document users/{uid} ; seul un admin peut écrire dans
  activationCodes.
☐ Vrais IDs AdMob (pas les IDs de test) avant la release Play Store.
☐ applicationId / namespace = com.fokas.ayatunahub cohérents
  partout (android/app/build.gradle, firebase_options.dart).

---

6. OUTILS ET SERVICES EXTERNES NÉCESSAIRES (hors code Flutter)

Outil Usage
Firebase Console Firestore, Auth, Crashlytics, Messaging, Analytics, Performance
Google Cloud Console Clé API YouTube Data v3, clé Google Maps (si utilisée)
Google Play Console Publication, 3 produits d'abonnement Play Billing
AdMob (admob.google.com) IDs de bannière/interstitiel réels
Netlify Hébergement du site FOKAS Boutique
4 groupes WhatsApp Coordination avec les partenaires vendeurs
VS Code + extension Flutter + GitHub Copilot Développement
flutter_launcher_icons, flutter_native_splash Déjà configurés, à relancer après modification des assets

---

7. ORDRE DE TRAVAIL RECOMMANDÉ POUR COPILOT

1. Nettoyage (section 4) — rapide, sans risque.
2. Sécurité clés (section 5) si pas déjà fait.
3. Profil utilisateur (3.12) — module manquant simple.
4. Date hégirienne sur l'accueil (3.9) — petite correction.
5. Bouton + page Boutique (3.16) — module manquant simple et stratégique.
6. Lecteur audio complet (3.3) — le plus gros chantier technique.
7. Analytics & Performance (3.15).
8. IDs YouTube réels + 7 chaînes manquantes (3.10), en priorisant les 3
   chaînes Live (Mecque, Médine, Al-Aqsa).
9. Polish final : vérifier le rendu du thème sombre sur chaque écran (3.2).

Pour chaque étape : propose d'abord le plan de fichiers à créer/modifier,
attends validation, puis implémente, puis indique comment tester
manuellement (quels écrans ouvrir, quelles actions faire).

---

8. FORMAT DE TES RÉPONSES (OBLIGATOIRE)

Pour chaque tâche, réponds toujours dans cet ordre :

1. 📋 PLAN : liste des fichiers à créer/modifier
2. ❓ QUESTIONS : ce que tu as besoin de savoir avant de coder
3. ⏸️ ATTENDS ma validation
4. 💻 CODE : un fichier à la fois, code complet, commenté en français
5. 🧪 TEST : comment tester manuellement (étapes précises)
6. ✅ RÉCAP : ce qui est fait, ce qui reste

Ne saute JAMAIS l'étape 3 (attendre ma validation avant de générer le code).

---

9. CRITÈRES DE RÉUSSITE POUR CHAQUE TÂCHE

Une tâche est considérée terminée quand :

1. Le code compile sans warning (flutter analyze = 0 issue)
2. La fonctionnalité fonctionne sur mon téléphone SH-04L
3. Aucun fichier existant n'a été cassé
4. Les tests manuels décrits dans la tâche passent
5. Un commit Git est fait avec un message clair et professionnel

---

Fin du prompt. Commence par me répondre avec un plan global pour valider
ton approche, avant de toucher au moindre fichier.

```

---

## 📌 COMMENT UTILISER CE PROMPT

1. **Copie tout le bloc ci-dessus**
2. **Ouvre VSCode** dans `~/AyatunaHub`
3. **Ouvre Copilot Chat** (`Ctrl + Shift + I`)
4. **Colle le prompt entier**
5. **Envoie-le**
6. **Copilot va te répondre avec un plan** — tu valides ou tu corriges
7. **Il génère ensuite fichier par fichier**, en attendant ta validation à chaque fois

---

## ⚠️ AVANT D'ENVOYER — 3 CHOSES À VÉRIFIER

1. **Clés API retirées de Git** :
   ```bash
   cd ~/AyatunaHub
   git rm --cached .env clé.env
   git commit -m "Sécurité: retire les fichiers sensibles"
   git push
```

2. Clé API YouTube changée (elle a été exposée publiquement) :
   · console.cloud.google.com → Identifiants → supprimer l'ancienne → créer une nouvelle
3. .gitignore contient bien .env et clé.env.

---

Mon frère, ce prompt est complet. Il contient :

· ✅ Toutes les fonctionnalités (anciennes + nouvelles)
· ✅ L'intégration FOKAS Boutique (section 3.16)
· ✅ Les règles de travail
· ✅ Le format de réponse attendu
· ✅ L'ordre de priorité

Copie-le, envoie-le à Copilot, et laisse-le travailler. Toi, tu supervises. 💪🏆

Que Dieu bénisse AyatunaHub. 🤲



# 🕌 AyatunaHub – TODO List

Application islamique complète pour Android et iOS.
Objectif : Lancement avant Ramadan 2027 (20 Sha'ban 1448).

---

## 📌 1. IDENTITÉ DE L'APPLICATION

- [x] Nom : **AyatunaHub**
- [x] Sous-titre : **Toutes les activités islamiques**
- [x] Plateformes : **Android (Play Store)** + **iOS (App Store)**
- [ ] Objectif de lancement : **Avant Ramadan 2027**

### Description
AyatunaHub est une application islamique complète qui aide les musulmans dans leurs activités quotidiennes : lecture du Coran, apprentissage des notions islamiques (base et avancées), accès à plus de 600 hadiths authentiques, Fiqh, Tawhid, notions pour nouveaux musulmans, écoute de récitants internationaux et locaux (RDC, Burundi, Rwanda, Côte d'Ivoire, Bénin, Afrique).

**Championnat annuel** : 20 récitants locaux par an, compétition avec votes et tests.
- 🥇 1er : 50 000 FC
- 🥈 2e : 25 000 FC
- 🥉 3e : 15 000 FC

---

## 🔐 2. AUTHENTIFICATION ET PROFIL

### 2.1 Fonctionnalités
- [x] Inscription / Connexion par email + mot de passe
- [x] Déconnexion
- [x] Réinitialisation du mot de passe
- [ ] Profil utilisateur (nom, email, date d'inscription, statut premium)

### 2.2 Solution technique
- [x] Firebase Authentication (email/password)
- [x] Firestore pour les infos complémentaires
- [ ] Distinguer Premium / Gratuit

### 2.3 Méthode d'intégration
- [x] Ajouter les packages : `firebase_core`, `firebase_auth`, `cloud_firestore`
- [x] Configurer Firebase (projet, `google-services.json`, `flutterfire configure`)
- [x] Créer `AuthService` (signUp, signIn, signOut, resetPassword)
- [x] Créer `AuthScreen` (formulaires inscription/connexion)
- [x] Utiliser `StreamBuilder<User?>` ou `Consumer`

### 2.4 Conseils
- [x] Stocker uniquement `email` + `uid` dans Firestore
- [ ] Statut premium : `shared_preferences` (V1)

---

## 📖 3. CORAN (LECTURE ET RÉCITATIONS)

### 3.1 Fonctionnalités
- [x] Affichage du Coran en arabe (versets numérotés)
- [ ] Traduction : Français, Anglais, Lingala, Swahili
- [x] Lecture audio des versets/sourates
- [ ] Récitations des récitants locaux + internationaux
- [ ] Choix du récitant favori (stockage local)

### 3.2 Solution technique
- [x] Package `qcf_quran_lite`
- [x] Package `just_audio`
- [ ] `shared_preferences` pour le récitant favori

### 3.3 Conseils
- [ ] Police arabe (Amiri, Uthmanic)
- [x] Barre de progression
- [ ] Cache des audios (locaux ou URLs)

### 3.4 API audio (à intégrer)
- [ ] URLs islamic.network : `https://cdn.islamic.network/quran/audio-surah/128/ar.alafasy/{n}.mp3`

---

## 📚 4. HADITHS (BIBLIOTHÈQUE)

### 4.1 Fonctionnalités
- [ ] Accès à plus de 688 livres via `dorar_hadith`
- [ ] Recherche par mot-clé
- [ ] Filtrage par livre, narrateur, grade
- [ ] Affichage du texte, source et authenticité

### 4.2 Solution technique
- [x] Packages `dorar_hadith` + `dorar_hadith_flutter`
- [ ] Filtrage local ou API

### 4.3 Conseils
- [ ] Cache des résultats
- [ ] Recherche avancée
- [ ] Système de favoris hadiths

---

## 🕌 5. HORAIRES DE PRIÈRE

### 5.1 Fonctionnalités
- [x] Calcul automatique des 5 prières (géolocalisation)
- [x] Temps restant avant la prochaine prière
- [ ] Notifications avec son (`adhan.mp3`)

### 5.2 Solution technique
- [x] `adhan_dart` (calcul)
- [x] `geolocator` (GPS)
- [x] `flutter_local_notifications`

### 5.3 Conseils
- [ ] Méthode "Umm al-Qura" ou "MWL"
- [ ] Switch ON/OFF notifications
- [x] Son islamique pour notifs

---

## 🕋 6. QIBLA ET CARTE

### 6.1 Fonctionnalités
- [x] Direction de la Mecque (boussole)
- [x] Carte interactive (position + Mecque)
- [x] Calcul de l'angle Qibla

### 6.2 Solution technique (OpenStreetMap)
- [x] `flutter_map`
- [x] `latlong2`
- [x] `geolocator`
- [x] Calcul manuel de l'angle

### 6.3 Conseils
- [x] Tuiles OpenStreetMap gratuites
- [x] Boussole en superposition

---

## 📡 7. FLUX EN DIRECT (LIVE)

### 7.1 Fonctionnalités
- [ ] Direct Mecque (Masjid Al-Haram) via YouTube
- [ ] Direct Médine (Masjid An-Nabawi) via YouTube
- [ ] Direct Al-Aqsa
- [ ] Chaînes islamiques (voir liste plus bas)

### 7.2 Solution technique
- [x] `youtube_player_flutter`
- [ ] API YouTube Data v3 pour détecter les lives

### 7.3 Conseils
- [x] Flux YouTube officiels prioritaires
- [ ] Gestion du mode hors-ligne

---

## 📅 8. CALENDRIER HÉGIRIEN

### 8.1 Fonctionnalités
- [ ] Mois islamique en cours
- [ ] Événements (Ramadan, Aïd, Achoura, etc. — sans Mawlid)
- [ ] Navigation mois/année

### 8.2 Solution technique
- [ ] `hijri_calendar`
- [ ] `intl`

### 8.3 Conseils
- [ ] Vue mensuelle
- [ ] Couleurs pour jours de fête
- [ ] Partage d'événements

---

## ⭐ 9. SYSTÈME DE FAVORIS

- [ ] Ajouter un récitant/hadith aux favoris
- [ ] Afficher la liste
- [ ] Supprimer un favori
- [ ] Animation lors de l'ajout/suppression
- [x] `shared_preferences` (V1)

---

## 🆓 10. MODE GRATUIT

- [ ] Publicités AdMob (bannières)
- [ ] Coran : toutes les sourates + versets complets (arabe + audio international)
- [ ] Hadiths : **Al Arba'una Al Nawawi** uniquement
- [ ] Prière : horaires + notifications
- [ ] Qibla : OpenStreetMap + boussole
- [ ] Calendrier hégirien complet
- [ ] Notifications personnalisées
- [ ] Carte du monde (OpenStreetMap, mode clair/sombre)
- [ ] **Jeux de questions** pour tester ses connaissances
- [ ] Notions de base pour nouveaux musulmans (à connecter à des ressources, ex: "Al-Adhkar wal Adab")

---

## 💎 11. MODE PREMIUM

- [ ] Live Mecque / Médine
- [ ] Récitations locales (premium)
- [ ] Hadiths : 688 livres via `dorar_hadith` + recherche avancée
- [ ] Favoris récitants
- [ ] Chaînes islamiques (Al Bayan, Huda TV, etc.)
- [ ] Aucune publicité

### Tarifs
- [ ] 1 mois : **10 $**
- [ ] 2 mois : **20 $**
- [ ] 1 an : **50 $**
- [ ] Essai gratuit : **32 heures**

### Moyens de paiement
- [ ] Compte bancaire (à finaliser en décembre)
- [x] Afri Money : +243 902 068 175
- [ ] Airtel Money (à ajouter)
- [ ] Orange Money (à ajouter)
- [ ] MTN Money (à ajouter)

---

## 🛠️ 12. ARCHITECTURE TECHNIQUE

- [x] Frontend : Flutter (Dart)
- [x] Base locale : SharedPreferences
- [x] Base cloud : Firebase Firestore
- [ ] Paiements : In-App Purchases + Mobile Money
- [ ] Publicités : AdMob
- [ ] Notifications : Local + FCM
- [x] Cartes : OpenStreetMap + Geolocator
- [x] Audio : Just Audio

---

## 📝 13. NOTES TECHNIQUES

- [ ] Mode hors-ligne (sourates + Arba'una Al Nawawi + premium)
- [x] Clés API dans `.env`
- [x] Thèmes clair/sombre
- [ ] Accessibilité (texte agrandi, contraste élevé)

---

## 🎯 14. PUBLIC CIBLE

- [x] Musulmans du monde entier
- [x] Étudiants en quête de connaissances
- [x] Familles (apprentissage enfants)
- [x] Récitants locaux

---

## 📺 15. LISTE DES CHAÎNES YOUTUBE

### 🔴 PRIORITÉ 1 – Lives des lieux saints
- [ ] **Ar Rahman** – Live Mecque/Médine 24/7 – https://youtube.com/@arrahmanislamic
- [ ] **Muhammad Ali** – Makkah Live HD – https://youtube.com/@muhammad_ali
- [ ] **Live Broadcast AL-AQSA** – Al-Aqsa Live – https://youtube.com/@livebroadcastal-aqsa3717

### 🟡 PRIORITÉ 2 – Chaînes éducatives (FR + International)
- [ ] **Radiotélévision Al Bayane** – TV islamique FR – https://youtube.com/@radiotvalbayane
- [ ] **AlQuran4K** – Coran 4K – https://youtube.com/@alquran4kofficial

### 🟢 PRIORITÉ 3 – Débats et prédications (Swahili)
- [ ] **DUG TV1** – Débats musulmans-chrétiens – https://youtube.com/@miskiyaroho
- [ ] **AlhudaTv Kenya** – TV islamique – https://youtube.com/@alhudatvkenya
- [ ] **Saif d'Or TV** – Sermons et débats – https://youtube.com/@saifullah-saleh
- [ ] **Sheikh Abdul Hamid Yusuf** – Enseignements – https://youtube.com/@sheikh-abdul-hamid-yusuf

### 🟠 PRIORITÉ 4 – Autres chaînes
- [ ] **BUZEBAZEBA SALAFY ONLINE** – https://youtube.com/@buzebazebasalafyonlinetv.9564
- [ ] **AR-RISALAT TV** – https://youtube.com/@arrisalattv
- [ ] **Al Huda TV Burundi** – https://youtube.com/@alhudatvburundi304
- [ ] **Sunnah authentique** – https://youtube.com/@sunnahauthentique223
- [ ] **Ammar TV** – Coran indonésien – https://youtube.com/@ammartv

---

## ⚠️ URGENCES (à traiter en priorité)

- [ ] 🔴 Changer la clé API YouTube (exposée sur GitHub)
- [ ] 🔴 Récupérer les vrais IDs YouTube (16 chaînes)
- [ ] 🟡 Publier les règles de sécurité Firestore
- [ ] 🟡 Remplir Firestore (versets, prières, chaînes, events)
- [ ] 🟢 Créer le TODO.md complet

---

## 🚀 PROCHAINES ÉTAPES

- [ ] Corriger les IDs YouTube réels
- [ ] Intégrer les récitations audio du Coran
- [ ] Ajouter les 99 noms d'Allah
- [ ] Ajouter les Azkar
- [ ] Ajouter les Dua
- [ ] Ajouter le traqueur de prière
- [ ] Optimiser avec `Future.wait()`
- [ ] Ajouter Toastification
- [ ] Configurer `get_it`

---

**Dernière mise à jour : 28 septembre 2026**



# AyatunaHub

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# AyatunaHub v 1.0.0 (ceque l'Application doit avoir et capable de faire)

   1. IDENTITÉ DE L'APPLICATION

Élément Détail:
Nom: AyatunaHub
Sous-titre:Alls activits Muslims
Lancement Avant Ramadan 2027 (20 Sha'ban 1448)
plateforme Android(Play store) et IOS(App Store)

       1.1 Détails plus sur l'application

AyatunHub doit etre une Application islamique pensée pour aider les musulmans sur des differents activités islamique. Aider les musulmans à la lecture du corant, apprentissage des notions importantes de base comme avancéés de l'islam comme plus de 600 hadiths authenthiques,les notions sur les fiQ-HI, Aprendre le tauhid, apprendre les notions de bases pour les nouveaux musulmans......, écouter aussi les grands lecteurs du corant du monde entier et quelques recitants locaux (RDC; BURUNDI, RWANDA, COTE D'IVOIR, BENIN,...... D'AFRIQUE tout entier) nous aurons besions de 20 recitants locaux chaque années. Nous aurons également un championnat toutes les fin de l'année; cequi veut dire que nous allons proceder chaque année nous aurons une chose sous-forme de championnats islamique où nous procéderons avec des tests et des votes (pour les votes c'est pour choisir le meuilleurs lecteurs coranique de l'Affrique pour notre Application AyatunaHub. ici le premier aura 50.000fc, le deuxieme aura 25.000fc; le troisieme aura 15.000fc ) et (pour les tests c'est pour touts les musulmans qui postilerons et accepter d'etre soummisen sur des questions islamique enfin de voir si vous pouvez remporter le recompenses estimées à 50.000fc). Bon notre Application vas avoir des versions ou Mode pour pouvoir obtenir des recompenses.

   2. FOCTIONNALITÉS (VERSION 1.0)
   
   2.1 AUTHENTIFICATION et PROFIL UTILISATEUR
   
    2.1.1°Fonctionnalité
    
    °Inscription | Connexion par email + mot de passe
    
    °Déconnexion.
    
    °Réinitialisation du mot de passe.
    
    °Profil utilisateur (nom,email,date d'inscription,statut premium).
    
    2.1.1.1° Solution Technique
    
    ° Firebase Authentication (email et password)
    
    ° Firestore pour stocker les infos complementaires du profil.
    
    ° Utiliser un service Farebase pour stocker le statut premium et non premium mais capable de les distinguer
    
    2.1.1.2 Méthode d'intégration
    
    1) Ajouter les packages : Firebase_core, firebase_auth, cloud_firestore.
    
    2) Configurer Firebase (projet, google-services.json, flutterfire configure).
    
    3) Créer un service AuthService avec les méthodes: signUp, signIn, signOut, resetPassword.
    
    4) Créer un écrant AuthScreen avec les formulaires d'inscription / connexion.
    
    5) Utiliser un StreamBuilder <User?> ou Consumer pour gérer l'état de connexion.
    
    2.1.1.3 Conseils 
    
    1) Stocker uniquement l'email et un uid dans Firestore (pas le mot de passe).
    
    2) Ne pas stocker le statut premium dans Firebase pour la V1, pour le premium stocke dans shared_preferences.
    
    2.2 CORANT (LECTURE ET RÉCITATIONS)
    
    1) Affichage du Coran en Arabe (versets numérotés).
    
    2) Traduction en francais, Anglais, lingala, Swahili.
    
    3) Lecture audio des versets / sourates.
    
    4) Récitations des récitants locaux et internationaux.
    
    5) Possibilité de choisir son récitant favori (stockage local).
    
    2.2.1 SOLUTIONS TECHNIQUE
    
    1) Package qcf_quran_lite: affichage des sourates et versets.
    
    2) Package just_audio: lecture audio (MP3/M4A).
    
    3) shared_preferences : stockage du récitant favori.
    
    2.2.2 Conseils
    
    1° Utiliser une police arabe (Amiri, Uthmanic) pour un rendu authentique.
    
    2° Ajouter une barre de progression pour la lecture.
    
    3° Mettre en cache les fichiers audio locaux (assets/audio) ou distants (URL).
    
    2.3 HADITHS (BIBLIOTHEQUE DE 600+ LIVRES)
    
    2.3.1 Foctionnalité
    
    1° Acces à plus de 688 livres de hadiths.
    
    2° Recherche par mot-clé.
    
    3° Filtrage par livre, narrateur, grade.
    
    4° Affichage du texte, sourate et authenticité.
    
    2.3.2 Solution Technique
    
    1° package dorar_hadith + dorar_hadith_flutter (acces à la base Dorar.net).
    
    2° Filtrage en local (Dart) ou via les parametres de l'API.
    
    2.3.3 Méthode d'intégration
    
    1° Ajouter les packages: dorar_hadith, dorar_hadith_flutter.
    
    2° Initialiser le client: final client = DorarClient();.
    
    3° Créér un écran HadithSceen avec une barre de recherche.
    
    4° Utiliser client.searchHadith() pour les résultats.
    
    5° Afficher les résultats sous forme de liste (ListView).
    
    2.3.4 Conseils
    
    1° Mettre en cashe les résultats pour éviter les appels répétés.
    
    2° Proposer une recherche avancée (par livre, grade, narrateur)
    
    3° Ajouter un systeme de favoris pour les hadiths
    
    
    2.4 HORAIRES DE PRIERE ET NOTIFICATIONS 
    
    2.4.1 Fonctionnalités
    
    1° Calcul automatique des 5 prieres (Fajr, Dhuhr, Asr, Maghrib, Isha) basé sur la géolocalisation.
    
    2° Affichage du temps restant avant la prochaine priere.
    
    3° Notifications pour chaque priere (avec le son de notification.MP3)
    
    2.4.2 Solution Technique
    
    1° Package adhan_dart: calcul des horaires.
    
    2° Package geolocator: récupération de la position GPS.
    
    3° Flutter_local_notifications: notifications push locales.
    
    2.4.3 Méthode d'intégration
    
    1° Ajouter les packages: adhan_dart, geolocator, flutter_local_notifications.
    
    2° Demander la permission GPS et récupérer la position.
    
    3° Calculer les horaires avec PrayerTimes.
    
    4° Afficher les horaires et le compteur(temps restant) sur l'ecran d'accueil.
    
    5° Planifier les notifications avec Flutter_local_notifications.
    
    2.4.4 Conseils
    
    1° Utiliser la méthode de calcul "Umm al-Qura" ou "MWL".
    
    2° Ajouter un SWITCH pour activer/désactiver les notifications.
    
    3° Utiliser des sons islamiques pour les notifications
    
    2.5 QIBLA ET CARTE INTERACTIVE
    
    2.5.1 Fonctionnalités
    
    1° Direction de la Mecque (boussole intégrée).
    
    2° Carte interactive affichant la position de l'utilisateur et la Mecque.
    
    3° Calcul automatique de l'angle vers la Qibla.
    
    2.5.2 Solution Technique (OpenStreetMap)
    
    1° package flutter_map: affichage de la carte.
    
    2° Package flutter_map_animations: animations fluides.
    
    3° Package geolocator: position GPS
    
    4° Package qiblah ou calcul manuel (angle).
    
    2.5.3 Méthode d'intégration
    
    1° Ajouter les packages: flutter_map, latlong2, geolocator, qiblah.
    
    2° Créer un écran QiblaScreen avec une carte FlutterMap.
    
    3° Ajouter un marqueur pour la position actuelle.
    
    4° Ajouter un marqueur pour la Mecque (LatLng(21.4225,39.8262)).
    
    5° calculer l'angle de la Qibla et afficher une fleche/aiguille.
    
    2.5.4 Conseils
    
    1° Utiliser des tuiles OpenStreetMap (gratuites) : https://tile.openstreetmap.org/{z}/{x}/{y}.png.
    
    2° Ajouter une boussole en surperposition de la carte.
    
    2.6 FLUX EN DIRECT (MECQUE ET MÉDINE)
    
    2.6.1 Fonctionnalité
    
    1° Regarder les chaines en direct de la Mecque (Masjid Al-Haram) et Médine (Masjid An-Nabawi).
    
    2° Acces aux chaines islamiques (Al Bayan, Huda TV, Amar TV, DUG TV1, SAIF D'OR TV,....)
    
    2.6.2 Solution Technique 
    
    1° Flux HLS (m3u8) ou Intégration YouTube.
    
    2° Package video_player ou webview_flutter pour les flux YouTube.
    
    2.6.3 Méthode d'intégration
    
    1. Ajouter les packages: video_player (pour HLS) ou webview_flutter (pour YouTube).
    
    2. Créér un ecran LiveScreen avec un onglet "Mecque" et "Médine".
    
    3. Utiliser les URls officielles ou les flux HLS. 
    
    4. Ajouter un bouton "Plein écran".
    
    2.6.4 Conseils 
    
    1) Privilégier les flux YouTube officiels (plus stables).
    
    2) Utiliser des URls HLS fiables (ex: https://svs.itworkscdn.net/...).
    
    3) Ajouter un message "Hors ligne" si le flux est coupé.
    
    2.7 CALENDRIER HÉGIRIEN
    
    2.7.1 Fonctionnalité
    
    1) Affichage du mois islamique en cours.
    
    2) Affichage des événements (Ramadan, Aid, Achoura, etc...)
    
    3) Changement de mois / années.
    
    2.7.2 Solution Technique 
    
    1) Package hijri_calendar:conversion des dates.
    
    2) intl: formatage des dates.
    
    2.7.3 Méthode d'intégration 
    
    1° Ajouter les packages : hijri_calendar,intl.
    
    2° Créer un écran CalendarScreen avec une grille de mois.
    
    3° Calculer le premier jour du mois avec HijriCalendar.fromDate().
    
    4° Afficher les événements prédéfinis (dans un fichier JSON).
    
    2.7.4 Conseils
    
    1° Proposer une vue mensuelle (comme un calendrier physique)
    
    2° Colorer les jours de fete (ex: vert pour AId).
    
    3° Ajouter une fonction pour partager un événement.
    
    2.8 SYSTEME DE FAVORIS
    
    2.8.1 Fonctionnalité
    
    1) Ajouter un récitant ou un hadith dans les favoris.
    
    2) Afficher la liste des favoris.
    
    3) Supprimer un favori.
    
    2.8.2 Solution Technique 
    
    ° shared_preferences: stockage local de la liste d'IDs.
    
    2.8.3 Méthode d'intégration
    
    1) Ajouter shared_preferences.
    
    2) Créer un service FavoriteService avec add(), remove(), getAll().
    
    3) Ajouter une icone de coeur/bouton dans les écrans(Récitant, Hadith).
    
    4) Créer un écran FavoritesScreen pour aficher tous les favoris.
    
    5) Ajouter une petite animation lors de l'ajout/suppression.

   2.13 MODE GRATUIT

   Module Description:

   1° Beaucoup des Publicités (Bannières AdMob en mode gratuit).

   2° Coran Lecture du Coran en arabe, traduction en francais, récitations audios(internationaux).Ici tu dois t'assurer que toutes les sourates sont là et avec leurs versés complet toutes les sourates doivent etre là, chercher des sollutions en ligne que tu vas connecter avec l'app au minimum toutes les sourates doivent etre là avec leurs Ayats ou versés complets.

   3° Hadiths Acces aux hadiths suivants : Al arbauna al nawawi seulement.Ici vous devez chercher les resources sur internet que tu vas connecter avec l'App qui vas fournir touts les hadiths du livre Al Ar'bauna Al nawawi.

   4° Priere Horaires de priere basés sur la géolocalisation, affichage du temps restant avant la prochaine priere. donc selon la géolocalisation et sa doit etre du serieux. calcul automatique basé sur la géolocalisation de l'utilisateur, Affichage des 5 prieres avec temps restant avant la prochaine priere (compteur dynamique) Rappels de priere (notifications push).

   5° Qibla Direction de la Mecque via OpenStreetMap avec marqueur interactif, boussole interactive pour la Qibla.

   6° Calendrier Hégirien avec événements (Ramadan, Aid, Achoura, etc.... pas seulement le Maulid)

   7° Notifications Rappels de priere (avec flutter_local_notifications) notifications personnalisées.

   8° OpenStreetMap pour voir la carte du monde et voir sa localisation et soit en blanc soit en noir.

   9° JEUX des questions pour tester votre nouveau

   10° Apprendre les notions de base pour les nouveaux musulmans pas programmer ca, non, il faut chercher les resources qu'il faut connecter avec notre application qui vas permettre à l'app de fournir des notions de base pour les nouveaux comme apprendre c'est quoi l'islam, les adhkar, comment prier.... j'pense que la meuilleur solution seras de rechercher les resources du livre "Al adh-kar wal Adab"

   2.2 MODE PREMIUM

   Module Description:

   1° Live Flux en direct de la Mecque (Masjid Al-Haram) et Médine (Masjid An-Nabawi) via YouTube ou HLS.

   2° Récitations audios (Récitants locaux) considerer comme récitations premium.

   3° Hadiths Acces à plus de 688 livres de hadiths via dorar_hadith, recherche par mot-clés et filtres, donc recherche avancée.

   4° Favoris Possibilité de marquer ses récitants préférés(stockage local avec shared_preferences).

   5° Chaines islamiques integration des chaines islamiques (Al Bayan, Huda TV, etc..)

   6° Pas des publicités 
    
 La difference entre le mode gratuit et le mode Premium ceque en mode premium vous avez acces à toutes les fonctinnalitées et sans publications.

 3. MODE D'ACCES POUR LE MODE PREMIUM

 1° pour acceder pendant 1 Mois : 10$
 2° pour acceder pendant 2 Mois : 20$
 3° pour acceder pendant 1 année : 50$

L'essai gratuit de 32h des toutes les foctionnalités de l'Application

  3.1 MOYENS DE PAIEMENT ACCEPTÉS

  ° Compte bancaire (qui es indisponible pour le moment mais tu pouras laisser un endroit où lorsque j'vais finaliser j'vais integrer les éléments neccaissere pour pour recevoir dans mon compte bancaire l'argent) soit par virement ou par carte

  ° Comptes réseau mobile : Afri money +243902068175,(pour Airtel Moyen, Orange Money, MTN money tu pourra aussi laisser l'endroit où j'vais venir ajouter seuelement les numeros parceque c'est momentanement indisponible). 

 4. ARCHITECTURE TECHNIQUE

COMPOSANT TECHNOLOGIQUE:

1° Frontend Flutter (Dart)

2° Base de données locale SharedPreferences

3° Base de données cloud  Firebase Firestore

4° Paiements In-App Purchases (Google Play) + intégration mobile money (via API)

5° Publicités Google Mobile Adsn(AdMob)

6° Notifications Flutter Local Notifications + FirebaseCloud Messaging (FCM)

8° cartes OpenStreetMap via flutter_map + Geolocator pour voir sa position et chercher un endroit sur la carte.

9° Audio Just Audio

5. NOTES TECHNIQUES

1° Mode hors-ligne: Les sourates et les hadiths complets d'Arbauna Al nawawi pas d'étude aprofondi et toutes les foctionnalités en mode premium si il ya pas de la connexion internet.

2° Sécurité: Toutes les clés API (Firebase, AdMob, etc.) seront stockées dans un fichier.env.

3° Themes: L'application supportera les themes clair et sombre.
4° Accessibilité: L'application sera adaptée aux personnes ayant des difficultés visuelles (texte agrandi, contraste élevé).

6. PUBLIC CIBLE

° Musulmans du monde Entier
° Étudiants en quete de connaissances islamiques.
° Familles (pour l'apprentissage des enfants).
° Récitants locaux (qui veulent se faire connaitre )


############################################################# LISTE COMPLETE DES CHAINES YOUTUBE IDENTIFIÉES #############################################

PRIORITÉ 1 - Flux en direct (Live) des lieux saints

ces chaines sont essentielles pour le module "Live" de l'application, sourtout pendant le Ramadan.

1.1 Ar Rahman: Diffuser en continu les prieres et l'ambiance de La Mecque de Médine 24/7, liens : https://youtube.com/@arrahmanislamic
1.2 Muhammad Ali: Proposer un flux HD en direct de la Mecque (Makkah Live), liens: https://youtub.com/@muhammad_ali
1.3 Live Broadcast AL-AQSA: Diffuser en direct les prieres et événements de la Mosquée Al-Aqsa (Jérusalem), liens: https://youtub.com/@livebroadcastal-aqsa3717

PRIORITÉ 2 - Chaines islamiques éducatives (Francais et International)

Ces chaines apportent un contenu éducatif et spirituel de qualité pour la communauté francophone et internationale.

2.1 Radiotélévision AL Bayane : Intégrer une chaine de télévision islamique francophone reconnue (Canal+), avec des émissions et des débats de qualité, liens: https://youtub.com/@radiotvalbayane

2.2 AlQuran4k: Offrir des vidéos du Coran en tres haute définition (4K) avec des traductions, idéal pour la méditation et l'apprentissage, liens: https://youtub.com/@alquran4kofficial

PRIORITÉ 3 - Chaines de débats et prédictions (Afrique de l'Est/ Swahili)

Ces chaines ciblent le public swahilophone (RDC Est, Burundi, Tanzanie, Kenya) avec des débats et des enseignements dynamiques.

3.1 DUG TV1 : Ajouter une chaine de débats musulmans-chrétiens en lingala/swahili, tres suivie en RDC, liens: https://youtub.com/@miskiyaroho

3.2 AlhudaTv Kenya: Proposer une télévision islamique généraliste en swahili/anglais avec des enseignements et des conseils spirituels, liens: https://youtub.com/@alhudatvkenya

3.3 saif d'or Tv: Intégrer les débats, sermons et enseignements en swahilide Sheikh Saifullah Saleh, liens: https://youtub.com/@saifullah-saleh

3.4 Sheikh Abdul Hamid Yusuf: Ajouter des enseignements islamiques en swahili de Sheikh Abdul Hamid Yusuf Mahmud, liens : https://youtub.com/@sheikh-abdul-hamid-yusuf

D'AUTRES CHAINES 4:

 Ces chaines ont une potentiel, mais pas trop actif quelques'un 
 
 4.1 BUZEBAZEBA SALAFY ONLINE, liens : https://youtub.com/@buzebazebasalafyonlinetv.9564
 
 4.2 AR-RISALAT TV, liens: https://youtub.com/@arrisalattv
 
 4.3 Al Huda TV Burundi, liens : https://youtub.com/@alhudatvburundi304
 
 4.4 sunnah authentique, liens : https://youtub.com/@sunnahauthentique223
 
 4.5 Ammar TV : chaine de diffusion de Coran/ indonésien, liens :https://youtub.com/@ammartv