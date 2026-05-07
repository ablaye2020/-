#!/bin/bash

# ============================================
# JOY-MD-V2 - Script de démarrage pour panel
# ============================================

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}"
echo "╔════════════════════════════════════════════╗"
echo "║     ☀️ JOY-MD-V2 - PANEL START ☀️          ║"
echo "║     Le bot Gear 5 de Joyboy                ║"
echo "╚════════════════════════════════════════════╝"
echo -e "${NC}"

# Variables
PROJECT_DIR="joy-md-v2"
MAIN_FILE="Joy.js"

# Vérifier Node.js
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js n'est pas installé${NC}"
    exit 1
fi

# Créer le dossier si inexistant
mkdir -p $PROJECT_DIR
cd $PROJECT_DIR

# Installer si besoin
if [ ! -d "node_modules" ]; then
    echo -e "${YELLOW}📦 Installation des dépendances...${NC}"
    npm install
fi

# Démarrer le bot
echo -e "${GREEN}☀️ Lancement de JOY-MD-V2...${NC}"
echo -e "${YELLOW}😁 Le rire de Joyboy résonne !${NC}"

# Utiliser node directement ou pm2 si disponible
if command -v pm2 &> /dev/null; then
    pm2 start $MAIN_FILE --name "joy-md" --restart-delay=5000
    pm2 logs joy-md
else
    node $MAIN_FILE
fi
