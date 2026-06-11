import 'dart:io';

void main(List<String> arguments) {
  // Liste pour stocker les articles (uniques grâce à la gestion du Set)
  List<Map<String, dynamic>> panierAchat = [];
  
  // Set pour suivre et bloquer/fusionner les doublons par nom de produit
  Set<String> nomsProduitsUniques = {};
  
  String reponse = "";

  stdout.write("Bienvenue dans le programme de gestion de votre panier d'achat.\n");

  while (true) {
    stdout.write("\n--- MENU PRINCIPAL ---\n");
    stdout.write("Appuyer '1' pour ajouter un article.\n");
    stdout.write("Appuyer '2' pour supprimer un article\n");
    stdout.write("Appuyer '3' pour afficher le contenu et le total\n");
    stdout.write("Appuyer '4' pour vider votre panier\n");
    stdout.write("Appuyer '5' pour quitter\n");
    stdout.write("Votre choix : ");
    
    int? choix = int.tryParse(stdin.readLineSync() ?? "");

    switch (choix) {
      case 1:
        stdout.write("\nAjout d'un article.\n");
        do {
          stdout.write("Entrer le nom du produit : ");
          String nomSaisi = stdin.readLineSync()!.trim();
          String nomMinuscule = nomSaisi.toLowerCase();
          
          stdout.write("Entrer la quantité du produit : ");
          int quantiteSaisie = int.parse(stdin.readLineSync()!);
          
          stdout.write("Entrer le prix du produit : ");
          double prixUnitaireSaisi = double.parse(stdin.readLineSync()!);

          // Utilisation du Set pour vérifier si le produit existe déjà
          if (nomsProduitsUniques.contains(nomMinuscule)) {
            // Le produit est un doublon : on le trouve et on met à jour ses valeurs
            var produitExistant = panierAchat.firstWhere(
              (element) => element['nom'].toString().toLowerCase() == nomMinuscule
            );
            
            produitExistant['quantite'] += quantiteSaisie;
            produitExistant['prixTotal'] = produitExistant['quantite'] * produitExistant['prixUnitaire'];
            stdout.write("Ce produit était déjà dans le panier. Quantité mise à jour.\n");
          } else {
            // Nouveau produit : on l'ajoute au panier ET son nom dans le Set
            Map<String, dynamic> nouveauProduit = {};
            nouveauProduit['nom'] = nomSaisi;
            nouveauProduit['quantite'] = quantiteSaisie;
            nouveauProduit['prixUnitaire'] = prixUnitaireSaisi;
            nouveauProduit['prixTotal'] = quantiteSaisie * prixUnitaireSaisi;
            
            panierAchat.add(nouveauProduit);
            nomsProduitsUniques.add(nomMinuscule); // Enregistrement dans le Set
            stdout.write("Article ajouté au panier.\n");
          }
          
          stdout.write("Souhaitez-vous ajouter un autre article ? (oui/non) : ");
          reponse = stdin.readLineSync()!.toLowerCase();
        } while (reponse == "oui");
        
        stdout.write("\n${panierAchat.length} article(s) unique(s) dans le panier.\n");
        break;

      case 2:
        stdout.write("\nSuppression d'un article.\n");
        if (panierAchat.isNotEmpty) {
          stdout.write("Entrez le nom du produit à supprimer : ");
          String nomProduit = stdin.readLineSync()!.trim();
          
          int tailleInitiale = panierAchat.length;
          
          // Nettoyage de la liste et du Set de doublons
          panierAchat.removeWhere((element) => element['nom'].toString().toLowerCase() == nomProduit.toLowerCase());
          nomsProduitsUniques.remove(nomProduit.toLowerCase());
          
          if (panierAchat.length < tailleInitiale) {
            stdout.write("Article supprimé du panier.\n");
          } else {
            stdout.write("Aucun article trouvé avec ce nom.\n");
          }
        } else {
          stdout.write("Le panier est vide.\n");
        }
        break;

      case 3:
        stdout.write("\nAffichage du contenu du panier.\n");
        if (panierAchat.isEmpty) {
          stdout.write("Votre panier est vide.\n");
        } else {
          double montantTotalPanier = 0.0;
          
          // Parcours des produits et calcul automatique du montant global
          for (var produit in panierAchat) {
            stdout.write("Nom: ${produit['nom']}, Quantité: ${produit['quantite']}, Prix unitaire: ${produit['prixUnitaire']} \$, Prix total: ${produit['prixTotal']} \$\n");
            montantTotalPanier += produit['prixTotal']; // Accumulation du prix
          }
          
          stdout.write("----------------------------------------\n");
          stdout.write("MONTANT TOTAL DU PANIER : $montantTotalPanier \$\n");
          stdout.write("----------------------------------------\n");
        }
        break;

      case 4:
        stdout.write("\nVidage du panier.\n");
        panierAchat.clear();
        nomsProduitsUniques.clear(); // Ne pas oublier de vider le Set aussi !
        stdout.write("Le panier a été vidé.\n");
        break;

      case 5:
        stdout.write("Merci d'avoir utilisé le programme. Au revoir !\n");
        return;

      default:
        stdout.write("Choix invalide. Veuillez réessayer.\n");
    }
  }


  /*stdout.write("Souhaiter vous Ajoutez un produit au panier ?");
  String accep= stdin.readLineSync()!.toLowerCase();
  if(accep=="oui"|| accep=="yes"){
    while (accep!="q") {
      stdout.write("Entrer le nom du produit");
      produits['nom']=stdin.readLineSync()!;
      
      stdout.write("Entrer la quantité du produit");
      produits['quantite']=int.parse(stdin.readLineSync()!);
      stdout.write("Entrer le prix du produit");
      produits['prixUnitaire']=stdin.readLineSync()!;

      produits['prixTotal']=produits['quantite']*double.parse(produits['prixUnitaire']);
      panierAchat.add(produits);

      stdout.write("Si vous souhaiter passer Appuyer sur 'q'");
      accep=stdin.readLineSync()!.toLowerCase();

    } 
  }

  print("${panierAchat[0]['nom']}");

  */
/*
  List<String> panier = [];
  while (true) {
    print('Entrez un produit à ajouter au panier (ou "q" pour quitter) :');
    String? input = stdin.readLineSync();

    if (input == null || input.toLowerCase() == 'q') {
      break;
    }

    panier.add(input);
    print('Produit ajouté : $input');
  }
  print('Votre panier contient :');
  for (var produit in panier) {
    print('- $produit');
  }
  
  print('souhaiter vous retrouvez un produit dans le panier ?');
  final repons = stdin.readLineSync()!.toLowerCase();
  if (repons == 'oui') {
    print('Entrez le nom du produit à rechercher :');
     String? searchInput = stdin.readLineSync();
    if (searchInput != null) {
      if (panier.contains(searchInput)) {
        print('Le produit "$searchInput" est dans le panier.');
      } else {
        print('Le produit "$searchInput" n\'est pas dans le panier.');
      }
    }
  }
  print('Souhaitez vous supprimez un produit dans le panier ?');
  final accept = stdin.readLineSync()!.toLowerCase();
  if (accept == 'oui') {
    print('Entrez le nom du produit à supprimer :');
     String? searchInput = stdin.readLineSync();
    if (searchInput != null) {
      if (panier.contains(searchInput)) {
        panier.remove(searchInput);
        print('Le produit "$searchInput" a été supprimé du panier.');
      } else {
        print('Le produit "$searchInput" n\'est pas dans le panier.');
      }
    }
  }
  print('Souhaitez vous augmentez des produits dans le panier ?');
  final accept2 = stdin.readLineSync()!.toLowerCase();
  if (accept2 == 'oui') {
    print('Entrez le nom du produit à ajouter :');
     String? searchInput = stdin.readLineSync();
    if (searchInput != null) {
      panier.add(searchInput);
      print('Le produit "$searchInput" a été ajouté au panier.');
    }
  }
  int totalProduits = panier.length;
  if (panier.isEmpty) {
    print('Votre panier est vide.');
  } else {
    print('Votre panier contient : ${totalProduits} produit');
    print("$panier");
  }

*/
}
