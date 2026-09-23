# PROMPT POUR GITHUB COPILOT – AYATUNAHUB

## CONTEXTE DU PROJET

Application Flutter islamique "AyatunaHub" pour Android.
- Package : com.fokas.ayatunahub
- Marque : FOKAS (First Organization for Knowledge, Automation & Security)
- Thème : vert islamique #0C6B4E + doré #FFD700
- Backend : Firebase (Firestore, Auth, Crashlytics, Analytics, Performance)
- Public : Francophones (RDC, Burundi, Afrique, diaspora)
- Objectif : Finir la V1 avant Ramadan 2027.

---

## PARTIE 1 – MODULES DÉJÀ FONCTIONNELS (NE PAS TOUCHER)

✅ Splash animé FOKAS
✅ Authentification Email/Mot de passe
✅ Admin auto amissilwano5@gmail.com
✅ Thème sombre/clair
✅ Écran d'accueil avec date hégirienne
✅ Navigation 6 onglets
✅ Lecteur audio avec barre de progression
✅ Qibla avec boussole
✅ Notifications de prière avec son Adhan
✅ Recherche Hadiths via dorar_hadith
✅ Coran - liste des sourates
✅ Profil avec badge Admin
✅ Firebase configuré

---

## PARTIE 2 – TÂCHES À RÉALISER

### TÂCHE 1 – IDs YouTube réels
Fichier : lib/data/channels_data.dart
- Remplacer les placeholders par les vrais IDs
- 16 chaînes islamiques à intégrer

### TÂCHE 2 – Récitations audio du Coran
Fichier : lib/screens/quran_screen.dart
- URL : https://cdn.islamic.network/quran/audio-surah/128/ar.alafasy/{n}.mp3
- {n} = numéro de la sourate (1 à 114)
- Ouvrir PlayerScreen au clic

### TÂCHE 3 – Contenu Firestore dynamique
Fichiers : content_service.dart, verse_service.dart
Collections : verses, prayers, channels, events
Fonctions : getVerses, streamTodayVerse, getPrayers, getChannels, getEvents

### TÂCHE 4 – Règles de sécurité Firestore
Créer firestore.rules avec :
- isAdmin() : amissilwano5@gmail.com
- isPremium() : isSubscribed == true
- Users : chacun lit/modifie son profil
- Interdiction de modifier role et isSubscribed
- verses, prayers, channels, events : lecture publique, écriture admin

### TÂCHE 5 – Cloud Functions Stripe
- functions/index.js : createCheckoutSession, stripeWebhook
- Événements : checkout.session.completed, subscription.updated, deleted, trial_will_end, invoice.payment_failed
- Structure Firestore : users/{uid}, stripeEvents/{eventId}

### TÂCHE 6 – Traqueur de prière
Créer lib/screens/prayer_tracker_screen.dart :
- 5 prières du jour avec cases à cocher
- Sauvegarde dans Firestore : users/{uid}/prayerTracking/{date}
- Pourcentage accompli

### TÂCHE 7 – Les 99 noms d'Allah
Créer :
- lib/data/asma_alhusna.dart
- lib/screens/asma_screen.dart (grille de cartes)

### TÂCHE 8 – Azkar
Créer :
- lib/data/azkar_data.dart
- lib/screens/azkar_screen.dart

### TÂCHE 9 – Dua
Créer :
- lib/data/dua_data.dart
- lib/screens/dua_screen.dart

### TÂCHE 10 – Vérification des rappels
Créer lib/screens/notification_check_screen.dart :
- Vérifier notification Adhan
- Vérifier horaires chargés
- Vérifier autorisations
- Vérifier volume
- Vérifier optimisation batterie
- Boutons "Réparer maintenant"

### TÂCHE 11 – Optimisations
- TÂCHE 12 : Future.wait() dans home_screen et content_service
- TÂCHE 13 : Toastification (pubspec.yaml : toastification: ^3.0.3)
- TÂCHE 14 : get_it (pubspec.yaml : get_it: ^8.0.0)
- TÂCHE 15 : Isolates (lib/services/isolate_service.dart)

---

## PARTIE 3 – VÉRIFICATIONS DE SÉCURITÉ (20 POINTS)

☑ 1. Clés API dans .env
☑ 2. .env dans .gitignore
☑ 3. Rate limiting sur login (V2)
☑ 4. Règles de sécurité Firestore publiées (PRIORITÉ)
☑ 5. Mots de passe hashés (Firebase le fait)
☑ 6. Droits vérifiés côté serveur
☑ 7. Clé publique côté client
☑ 8. HTTPS partout
☑ 9. Sessions qui expirent
☑ 10. Inputs validés
☑ 11. Taille max des uploads (V2)
☑ 12. Type de fichier vérifié (V2)
☑ 13. CORS configuré
☑ 14. Retirer tous les print() en production
☑ 15. Nettoyer les console.log
☑ 16. Message d'erreur unique
☑ 17. Webhooks signés (Stripe V2)
☑ 18. Dépendances à jour
☑ 19. Email confirmé (V2)
☑ 20. Backup auto (Firebase)

Actions urgentes :
1. Publier les règles Firestore
2. Retirer les print() en production
3. Vérifier .gitignore

---

## PARTIE 4 – QUALITÉ UI (ÉVITER LE "VIBECODED")

À ÉVITER :
❌ Dégradés violet/noir
❌ Fond blanc pur
❌ Cartes génériques
❌ Checks verts partout
❌ Témoignages inventés
❌ Emojis dans les titres
❌ Zéro démo produit

À FAIRE :
✅ Vert islamique #0C6B4E + doré #FFD700
✅ Fond noir profond ou clair
✅ Contenu réel et vérifiable
✅ Interface épurée
✅ Typographie cohérente

---

## PARTIE 5 – INSTRUCTIONS POUR COPILOT

RÈGLES ABSOLUES :
- Code commenté en FRANÇAIS
- Architecture : /lib/models, /lib/screens, /lib/services, /lib/data, /lib/widgets
- Gestion d'état : Provider
- try/catch pour les erreurs
- Thème vert #0C6B4E partout
- flutter run doit fonctionner
- NE PAS casser les modules existants
- NE PAS inventer de données
- DEMANDER avant de générer

ORDRE DE GÉNÉRATION :
1. channels_data.dart
2. quran_screen.dart
3. content_service.dart + verse_service.dart
4. firestore.rules
5. prayer_tracker_screen.dart
6. asma_alhusna.dart + asma_screen.dart
7. azkar_data.dart + azkar_screen.dart
8. dua_data.dart + dua_screen.dart
9. notification_check_screen.dart
10. Optimisations (Future.wait, Toastification, get_it)
11. functions/index.js

---

## PARTIE 6 – FIN DE FICHIER

À CHAQUE FICHIER GÉNÉRÉ :
- Indiquer le chemin exact
- Expliquer en 2 lignes
- Signaler ce qui doit être remplacé par le dev
- Vérifier qu'il n'y a pas de conflit

Commence par TÂCHE 1. À chaque fin de tâche, demande : "On passe à la suivante ?"
