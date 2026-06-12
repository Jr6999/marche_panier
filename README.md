# 🛒 Moteur de Panier d'Achat en Dart

## 📖 Description

Ce projet a été réalisé dans le cadre du **Sprint 03 : Structures de Contrôle & Collections Dart** de la formation **Programmation Mobile - Méthode FORGE**.

L'objectif est de concevoir un moteur de panier d'achat interactif en console permettant de manipuler des collections Dart (`List`, `Map`, `Set`) tout en appliquant des structures de contrôle et des algorithmes de traitement de données.

Le programme permet à l'utilisateur de gérer un panier d'achat directement depuis le terminal grâce à un menu interactif.

---

## 🎯 Objectifs Pédagogiques

* Maîtriser les structures conditionnelles (`if`, `else`, `switch`)
* Utiliser les boucles (`while`, `for-in`)
* Manipuler les collections Dart

  * `List`
  * `Map`
  * `Set`
* Calculer dynamiquement des montants
* Éviter les doublons dans les données
* Concevoir une application console robuste

---

## 🚀 Fonctionnalités

### ✅ Ajouter un article

L'utilisateur peut ajouter un produit en renseignant :

* Nom du produit
* Quantité
* Prix unitaire

### ✅ Gestion intelligente des doublons

Si un produit existe déjà dans le panier :

* La quantité est automatiquement mise à jour
* Aucun doublon n'est créé

### ✅ Supprimer un article

Suppression d'un produit à partir de son nom.

### ✅ Afficher le panier

Affichage détaillé :

* Nom du produit
* Quantité
* Prix unitaire
* Prix total par produit

Calcul automatique du montant total du panier.

### ✅ Vider le panier

Suppression complète de tous les produits enregistrés.

### ✅ Quitter l'application

Fermeture propre du programme.

---

## 🏗️ Architecture des Données

### Liste du panier

```dart
List<Map<String, dynamic>> panierAchat = [];
```

Cette structure stocke l'ensemble des produits du panier.

---

### Représentation d'un produit

```dart
{
  'nom': 'Téléphone',
  'quantite': 2,
  'prixUnitaire': 150000,
  'prixTotal': 300000
}
```

Chaque produit est représenté par une `Map<String, dynamic>`.

---

### Gestion des doublons

```dart
Set<String> nomsProduitsUniques = {};
```

Le `Set` garantit qu'un même produit ne soit pas ajouté plusieurs fois.

---

## 🔄 Algorithmes Principaux

### Ajout d'un produit

1. Vérification dans le Set
2. Si le produit existe :

   * Mise à jour de la quantité
3. Sinon :

   * Création d'une nouvelle Map
   * Ajout dans la List
   * Enregistrement dans le Set

---

### Suppression

Utilisation de :

```dart
removeWhere()
```

Cette méthode permet de supprimer un produit sans provoquer d'erreur de modification concurrente.

---

### Calcul du montant total

Parcours dynamique du panier :

```dart
for (var produit in panierAchat)
```

Accumulation du prix total de chaque article.

---

## 📚 Concepts Dart Utilisés

### Structures de Contrôle

* if / else
* switch
* while

### Collections

* List
* Map
* Set

### Méthodes Utilisées

* add()
* removeWhere()
* contains()
* clear()
* firstWhere()

### Bibliothèque Standard

```dart
import 'dart:io';
```

Pour les interactions utilisateur via le terminal.

---

## 🖥️ Exemple d'Exécution

```text
--- MENU PRINCIPAL ---

1. Ajouter un article
2. Supprimer un article
3. Afficher le panier
4. Vider le panier
5. Quitter

Votre choix : 1

Entrer le nom du produit : Téléphone
Entrer la quantité du produit : 2
Entrer le prix du produit : 150000

Article ajouté au panier.
```

Ajout du même produit :

```text
Entrer le nom du produit : Téléphone

Ce produit était déjà dans le panier.
Quantité mise à jour.
```

---

## 📈 Résultats Obtenus

Ce projet démontre :

* La maîtrise des collections Dart
* L'utilisation appropriée des structures de contrôle
* La gestion des données en mémoire
* La prévention des doublons
* La création d'un programme interactif en console

---

## 🔮 Perspectives d'Amélioration

* Gestion des codes promotionnels
* Calcul automatique des taxes
* Gestion des remises
* Modification des quantités
* Validation avancée des saisies utilisateur
* Sauvegarde des données
* Migration vers Flutter avec interface graphique

---

## 👨‍💻 Auteur

**Jérémie HOUANKAN**

Formation : Programmation Mobile

Méthode pédagogique : FORGE

Sprint 03 — Structures de Contrôle & Collections Dart

IMEN BENIN

---

## 📜 Licence

Projet réalisé dans un cadre pédagogique et académique.
