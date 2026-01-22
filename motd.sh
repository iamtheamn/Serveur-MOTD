#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
NC='\033[0m'

echo -e "${CYAN}"
cat << "EOF"
    ___ __  ____  __ _____ _   __    ____  _____
   /   |\ \/ /  |/  | ____/ | / /   / __ \/ ___/
  / /| | \  / /|_/ / __/ /  |/ /   / / / /\__ \ 
 / ___ | / / /  / / /___/ /|  /   / /_/ /___/ / 
/_/  |_|/_/_/  /_/_____/_/ |_/    \____//____/  
EOF
echo -e "${NC}"

UPTIME=$(uptime -p | sed 's/up //')
LOAD=$(cat /proc/loadavg | awk '{print $1}')
MEMORY=$(free -m | awk 'NR==2{printf "%s/%sMB (%.1f%%)", $3,$2,$3*100/$2 }')
DISK=$(df -h / | awk '$NF=="/"{printf "%d/%dGB (%s)", $3,$2,$5}')
IP_LOCAL=$(hostname -I | cut -d' ' -f1)
TEMP=$(vcgencmd measure_temp | cut -c "6-9")

echo -e "${YELLOW}===============================================${NC}"
echo -e "  💻 ${PURPLE}Système :${NC} Serveur 1"
echo -e "  🌡️  ${PURPLE}Temp    :${NC} ${TEMP}°C"
echo -e "  🧠 ${PURPLE}Mémoire :${NC} $MEMORY"
echo -e "  💾 ${PURPLE}Disque  :${NC} $DISK"
echo -e "  🌐 ${PURPLE}IP      :${NC} $IP_LOCAL"
echo -e "${YELLOW}===============================================${NC}"

citations=(
"🚀 Le meilleur moyen de prévoir le futur, c'est de le créer."
"🐛 Ce n'est pas un bug, c'est une fonctionnalité non documentée."
"💻 Talk is cheap. Show me the code."
"🛡️ La sécurité est un processus, pas un produit."
"🧠 Stay hungry, stay foolish."
"🔥 Un jour sans apprendre est un jour perdu."
"🐧 In a world without fences and walls, who needs Windows and Gates?"
"⚡ Fais-le bien ou ne le fais pas."
)

rand=$((RANDOM % ${#citations[@]}))
echo -e "${GREEN}❝ ${citations[$rand]} ❞${NC}"
echo ""
