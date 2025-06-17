# Project2 - Recherche d’Artistes Algériens

## Objectif

Développer une application Python permettant de rechercher des informations sur des artistes musicaux algériens et leurs albums à partir d’un fichier XML prédéfini (`ArtistAlgerian.xml`).  
Deux modes d’exécution sont possibles :
- Interface en ligne de commande (CLI)
- Application web avec Flask

L’application permet de :
- Rechercher un artiste par nom
- Afficher les informations détaillées : nom, ville d’origine, biographie, site web (si disponible)
- Lister les albums de l’artiste avec leur année de sortie et leur tracklist

---

## Prérequis

- Python 3.x
- Bibliothèques nécessaires :
  - numpy
  - pandas
  - scikit-learn
  - matplotlib
  - flask (si vous choisissez le mode web)

Installez les dépendances avec :
```bash
pip install -r requirements.txt
```

---

## Utilisation

1. Cloner le dépôt :
   ```bash
   git clone https://github.com/djeddiouael/Mini-Project-Demi-Semi-Structure.git
   ```
2. Aller dans le dossier du projet :
   ```bash
   cd Mini-Project-Demi-Semi-Structure/Project2
   ```
3. Placer le fichier `ArtistAlgerian.xml` dans le dossier `data/`
4. Exécuter le script principal selon le mode choisi :

   **Pour le mode CLI :**
   ```bash
   python main.py
   ```

   **Pour le mode Web (Flask) :**
   ```bash
   cd webapp
   python app.py
   ```
   Puis ouvrir [http://localhost:5000](http://localhost:5000) dans votre navigateur.

---
