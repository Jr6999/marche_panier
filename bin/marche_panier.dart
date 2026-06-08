import 'dart:io';

void main(List<String> arguments) {
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
}
