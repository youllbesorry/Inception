# Makefile

# Nom du fichier Docker Compose
COMPOSE_FILE=srcs/docker-compose.yml

# Démarrer les services
up:
	mkdir -p /home/ben/data
	mkdir -p /home/ben/data/wordpress
	mkdir -p /home/ben/data/mariadb
	docker compose -f $(COMPOSE_FILE) up --build -d

# Arrêter les services
down:
	docker compose -f $(COMPOSE_FILE) down

# Redémarrer les services
restart:
	make clean && make up

# Afficher les logs
logs:
	docker compose -f $(COMPOSE_FILE) logs -f

# Construire ou reconstruire les services
build:
	docker compose -f $(COMPOSE_FILE) build

# Exécuter une commande dans un service
exec:
	docker compose -f $(COMPOSE_FILE) exec $(service) $(cmd)

# Nettoyer les conteneurs, réseaux et volumes non utilisés
prune:
	down clean
	docker system prune -f --all --volumes

clean:
	rm -rf /home/ben/data
	docker compose -f $(COMPOSE_FILE) down --volumes --rmi all