# Gestionnaire de tâches avec Angular + Symfony API + MySQL

<div id="" align="center">
  <img src="screenshot.png" width="100%"/>
</div>

<br>
créer, visualiser, mettre à jour et supprimer des listes de tâches et des tâches individuelles, protégées par l'authentification utilisateur. Le projet utilise une API Symfony pour gérer les données et Angular pour le front-end.

## Prérequis
- Symfony (REST API)
- Angular 
- MySQL (Base de données)
- bootstrap 
- jwt token & refresh
- Docker

# Installation
# API Symfony (Backend)

Clonez le référentiel depuis GitHub :``` git clone https://github.com/matthCorvo/Task-Manager.git```
Accédez au répertoire de l'interface utilisateur Symfony : ```cd .docker```
Installez les dépendances Symfony/mysql/phpadmin en utilisant Docker : ```docker compose up -d --build```
Acceder au fichier  : ```docker exec -it symfony_webapp_docker-php-1 bash```               
Setup   : ```composer install```               
Configurez votre base de données MySQL dans le fichier .env de Symfony.
Créez la base de données en utilisant Doctrine : ```php bin/console doctrine:database:create```
Effectuez les migrations pour créer les tables : ```php bin/console doctrine:migrations:migrate```

Lancez l'api : ```http://localhost/apip```

# Interface Utilisateur Angular (Frontend)
Accédez au répertoire de l'interface utilisateur Angular :  ```cd client ```
Installez les dépendances Angular : ``` npm install```
Lancez l'interface utilisateur Angular : ``` npm start```
