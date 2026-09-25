# 🕌 AyatunaHub

Application islamique complète pour Android.

## 📱 Fonctionnalités
- 📖 Coran (arabe + traduction + audio)
- 📚 Hadiths (688 livres)
- 🕌 Horaires de prière + Adhan
- 🕋 Qibla avec boussole
- 📡 Live Mecque / Médine / Al-Aqsa
- 📅 Calendrier hégirien
- ⭐ Favoris
- 👤 Profil (Admin / Premium / Gratuit)

## 🎬 Chaînes YouTube intégrées
- [Ammar TV](https://youtube.com/@ammartv) — Récitations indonésiennes
- [Ar Rahman](https://youtube.com/@arrahmanislamic) — Live Mecque/Médine
- [Al-Aqsa Live](https://youtube.com/@livebroadcastal-aqsa3717) — Al-Aqsa
- [AlQuran4K](https://youtube.com/@alquran4kofficial) — Coran 4K
- [Radiotélévision Al Bayane](https://youtube.com/@radiotvalbayane) — Télévision FR
- [Saifullah-Saleh](https://youtube.com/@saifullah-saleh) — Débats et sermons
- [Sheikh Abdul Hamid Yusuf](https://youtube.com/@sheikh-abdul-hamid-yusuf) — Enseignements
- [DUG TV1](https://youtube.com/@miskiyaroho) — Débats musulmans-chrétiens

## 🛠️ Stack technique
- **Framework** : Flutter (Dart)
- **Backend** : Firebase (Auth, Firestore, Crashlytics, Analytics)
- **API** : YouTube Data API v3
- **Gestion d'état** : Provider
- **Audio** : just_audio

## 🎯 Objectif
Lancement avant Ramadan 2027.

## 👨‍💻 Auteur
**FOKAS** — First Organization for Knowledge, Automation & Security

- 📍 Bukavu, RDC
- 🌐 [fokas-dav.netlify.app](https://fokas-dav.netlify.app)
- 📧 amissilwano5@gmail.com
- 📱 +243 902 068 175


# 🕌 AyatunaHub

Application islamique complète pour Android.

## 📱 Fonctionnalités
- 📖 Coran (arabe + traduction + audio)
- 📚 Hadiths (688 livres)
- 🕌 Horaires de prière + Adhan
- 🕋 Qibla avec boussole
- 📡 Live Mecque / Médine / Al-Aqsa
- 📅 Calendrier hégirien

## 🎬 Chaînes YouTube intégrées
- [Ammar TV](https://youtube.com/@ammartv) — Récitations indonésiennes
- [Ar Rahman](https://youtube.com/@arrahmanislamic) — Live Mecque/Médine
- [Al-Aqsa Live](https://youtube.com/@livebroadcastal-aqsa3717) — Al-Aqsa
- [... autres chaînes ...]

## 🛠️ Stack technique
Flutter • Firebase • YouTube API • Provider

## 👨‍💻 Auteur
**FOKAS** — First Organization for Knowledge, Automation & Security
📍 Bukavu, RDC
🌐 [fokas-dav.netlify.app](https://fokas-dav.netlify.app)




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