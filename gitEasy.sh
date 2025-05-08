#!/bin/bash
# GitEasy - Script simplificado para Git
# Autor: 2R


# CONFIGURA AQUÍ TUS DATOS
DEFAULT_USER="usuarioGit"
TOKEN="TOKEN"

# Colores para mensajes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Función para mostrar ayuda
show_help() {
  echo -e "${YELLOW}GitEasy - Comandos simplificados de Git${NC}"
  echo "Uso: gitEasy [comando]"
  echo ""
  echo "Comandos disponibles:"
  echo "  setup [repo]  - Configura el repositorio por primera vez (ej: miproyecto)"
  echo "                  Si no se especifica, te pedirá un nombre"
  echo "  save [mensaje]- Guarda cambios (add, commit y push)"
  echo "  update        - Actualiza el repositorio local (pull)"
  echo "  branch [nombre]- Crea una nueva rama y cambia a ella"
  echo "  status        - Muestra el estado actual"
  echo "  log           - Muestra historial de commits recientes"
  echo "  help          - Muestra esta ayuda"
}

# Crear archivo .gitignore según tipo de proyecto
create_gitignore() {
  echo -e "${YELLOW}¿Qué tipo de proyecto es este?${NC}"
  echo "1) Node.js/JavaScript"
  echo "2) Python"
  echo "3) Java"
  echo "4) PHP"
  echo "5) General (básico)"
  echo "6) No crear .gitignore"
  read -p "Selecciona una opción (1-6): " OPTION

  # Si ya existe un .gitignore, preguntar si quiere sobrescribirlo
  if [ -f ".gitignore" ]; then
    echo -e "${YELLOW}Ya existe un archivo .gitignore. ¿Deseas sobrescribirlo? (s/n)${NC}"
    read OVERRIDE
    if [[ $OVERRIDE != "s" && $OVERRIDE != "S" && $OVERRIDE != "si" && $OVERRIDE != "SI" && $OVERRIDE != "sí" && $OVERRIDE != "SÍ" ]]; then
      echo -e "${YELLOW}Conservando .gitignore existente.${NC}"
      return 0
    fi
  fi

  case $OPTION in
    1) # Node.js/JavaScript
      cat > .gitignore << 'EOL'
# Dependencias
node_modules/
npm-debug.log
yarn-debug.log
yarn-error.log
package-lock.json
yarn.lock

# Ambiente
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# Archivos de compilación/distribución
/dist
/build
/out

# Archivos de caché
.cache
.next
.nuxt
.vuepress/dist
.serverless
.docz
.netlify

# Testing
/coverage

# Logs
logs
*.log

# Sistema operativo
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# IDE y editores
/.idea
.project
.classpath
.c9/
*.launch
.settings/
*.sublime-workspace
.vscode/*
!.vscode/settings.json
!.vscode/tasks.json
!.vscode/launch.json
!.vscode/extensions.json
EOL
      echo -e "${GREEN}✓ Archivo .gitignore para Node.js/JavaScript creado${NC}"
      ;;
    2) # Python
      cat > .gitignore << 'EOL'
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg

# Ambientes virtuales
venv/
ENV/
env/
.env
.venv
env.bak/
venv.bak/
.python-version

# Testing
.coverage
htmlcov/
.tox/
.nox/
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
.hypothesis/
.pytest_cache/

# Jupyter Notebook
.ipynb_checkpoints

# Logs
*.log

# Sistema operativo
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# IDE y editores
.idea/
.vscode/
*.swp
*.swo
EOL
      echo -e "${GREEN}✓ Archivo .gitignore para Python creado${NC}"
      ;;
    3) # Java
      cat > .gitignore << 'EOL'
# Compiled class file
*.class

# Log file
*.log

# BlueJ files
*.ctxt

# Mobile Tools for Java (J2ME)
.mtj.tmp/

# Package Files
*.jar
*.war
*.nar
*.ear
*.zip
*.tar.gz
*.rar

# virtual machine crash logs
hs_err_pid*

# Build folders
/target/
/build/
/out/
/bin/

# Maven
.mvn/
mvnw
mvnw.cmd
pom.xml.tag
pom.xml.releaseBackup
pom.xml.versionsBackup
pom.xml.next
release.properties
dependency-reduced-pom.xml

# Gradle
.gradle/
gradle/
gradlew
gradlew.bat
settings.gradle
build.gradle

# IntelliJ IDEA
.idea/
*.iws
*.iml
*.ipr

# Eclipse
.settings/
.classpath
.project
.factorypath

# Spring Boot
.springBeans

# Ambiente
.env
application-local.properties
application-local.yml

# Sistema operativo
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db
EOL
      echo -e "${GREEN}✓ Archivo .gitignore para Java creado${NC}"
      ;;
    4) # PHP
      cat > .gitignore << 'EOL'
# Archivos de composer
/vendor/
/composer.phar
composer.lock

# Archivos de configuración
.env
.env.backup
phpunit.xml
.phpunit.result.cache

# Directorios de aplicaciones
/node_modules/
/public/hot
/public/storage
/storage/*.key
/storage/logs/*
/storage/framework/cache/*
/storage/framework/sessions/*
/storage/framework/views/*

# Laravel Mix
/public/css/
/public/js/
/public/mix-manifest.json

# Logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Cache
.cache

# System files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# IDE y editores
/.idea
/.vscode
*.swp
*.swo
EOL
      echo -e "${GREEN}✓ Archivo .gitignore para PHP creado${NC}"
      ;;
    5) # General
      cat > .gitignore << 'EOL'
# Archivos de configuración y entorno
.env
.env.*
config.local.js
*.local.conf

# Directorios de dependencias
node_modules/
vendor/
bower_components/

# Directorios de compilación
/dist/
/build/
/out/
/target/

# Archivos de caché
.cache/
.temp/
tmp/
temp/

# Logs
*.log
logs/
log/

# Archivos del sistema operativo
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# IDE y editores
.idea/
.vscode/
*.sublime-project
*.sublime-workspace
*.swp
*.swo

# Archivos temporales y de backup
*~
*.bak
*.tmp
EOL
      echo -e "${GREEN}✓ Archivo .gitignore general básico creado${NC}"
      ;;
    6) # No crear
      echo -e "${YELLOW}No se creará archivo .gitignore${NC}"
      ;;
    *)
      echo -e "${RED}Opción no válida. No se creará archivo .gitignore${NC}"
      ;;
  esac
}

# Configuración inicial
setup_repo() {
  REPO_NAME="$1"

  # Si no se proporciona nombre, pedirlo
  if [ -z "$REPO_NAME" ]; then
    echo -e "${YELLOW}Ingresa el nombre para el repositorio:${NC}"
    read REPO_NAME

    if [ -z "$REPO_NAME" ]; then
      echo -e "${RED}Error: Debes especificar un nombre para el repositorio${NC}"
      exit 1
    fi
  fi

  # Preguntar si el repositorio debe ser privado
  echo -e "${YELLOW}¿Deseas que el repositorio sea privado? (s/n)${NC}"
  read ES_PRIVADO
  PRIVATE_OPTION=""
  if [[ $ES_PRIVADO == "s" || $ES_PRIVADO == "S" || $ES_PRIVADO == "si" || $ES_PRIVADO == "SI" || $ES_PRIVADO == "sí" || $ES_PRIVADO == "SÍ" ]]; then
    PRIVATE_OPTION='"private":true'
    echo -e "${YELLOW}El repositorio se creará como privado${NC}"
  else
    PRIVATE_OPTION='"private":false'
    echo -e "${YELLOW}El repositorio se creará como público${NC}"
  fi

  # Construir la ruta completa del repositorio
  FULL_REPO="$DEFAULT_USER/$REPO_NAME"

  echo -e "${YELLOW}Configurando repositorio $FULL_REPO...${NC}"

  # Verificar si es un repositorio git
  if [ ! -d ".git" ]; then
    echo -e "${YELLOW}Inicializando repositorio...${NC}"
    git init
    echo -e "${GREEN}✓ Repositorio Git inicializado${NC}"
  fi

  # Crear archivo .gitignore
  create_gitignore

  # Elimina origen actual si existe
  git remote remove origin 2>/dev/null

  # Intentar crear el repositorio en GitHub primero
  echo -e "${YELLOW}Creando el repositorio en GitHub...${NC}"

  # Crear el repositorio en GitHub usando curl
  RESPONSE=$(curl -s -X POST -H "Authorization: token $TOKEN" \
    -d "{\"name\":\"$REPO_NAME\", $PRIVATE_OPTION}" \
    "https://api.github.com/user/repos" || echo "ERROR")

  if [[ "$RESPONSE" == *"ERROR"* || "$RESPONSE" == *"message"*"Bad credentials"* ]]; then
    echo -e "${RED}⚠️ Error al crear el repositorio en GitHub. Revisa tu token.${NC}"
  elif [[ "$RESPONSE" == *"message"*"already exists"* ]]; then
    echo -e "${YELLOW}El repositorio ya existe en GitHub. Continuando...${NC}"
  elif [[ "$RESPONSE" == *"\"name\":\"$REPO_NAME\""* ]]; then
    echo -e "${GREEN}✓ Repositorio creado exitosamente en GitHub${NC}"
  else
    echo -e "${RED}⚠️ Respuesta inesperada al crear el repositorio:${NC}"
    echo "$RESPONSE" | head -n 10
  fi

  # Añade origen con token
  git remote add origin https://$TOKEN@github.com/$FULL_REPO.git
  echo -e "${GREEN}✓ Origen remoto configurado${NC}"

  # Configura la rama principal
  git branch -M main 2>/dev/null || echo -e "${YELLOW}Nota: No hay commits aún, la rama principal se creará en el primer commit${NC}"

  # Si no hay archivos o commits, crear un README básico solo si no existe
  if [ -z "$(git rev-parse --verify HEAD 2>/dev/null)" ]; then
    # Solo crear README.md si no existe
    if [ ! -f "README.md" ]; then
      echo -e "${YELLOW}Creando README.md inicial...${NC}"
      echo "# $REPO_NAME" > README.md
      echo "Repositorio creado con GitEasy" >> README.md
      echo -e "${GREEN}✓ README.md básico creado${NC}"
    else
      echo -e "${YELLOW}Usando README.md existente${NC}"
    fi

    # Añadir README y .gitignore (si existe)
    git add README.md
    if [ -f ".gitignore" ]; then
      git add .gitignore
    fi

    git commit -m "Commit inicial: README.md y .gitignore"
    echo -e "${GREEN}✓ Commit inicial creado${NC}"
  fi

  echo -e "${GREEN}✓ Repositorio configurado correctamente${NC}"

  # Preguntar si desea hacer push inicial
  echo -e "${YELLOW}¿Deseas hacer push inicial ahora? (s/n)${NC}"
  read RESPUESTA
  if [[ $RESPUESTA == "s" || $RESPUESTA == "S" || $RESPUESTA == "si" || $RESPUESTA == "SI" || $RESPUESTA == "sí" || $RESPUESTA == "SÍ" ]]; then
    git push -u origin main
    PUSH_EXIT_CODE=$?
    if [ $PUSH_EXIT_CODE -eq 0 ]; then
      echo -e "${GREEN}✓ Push inicial completado exitosamente${NC}"
    else
      echo -e "${RED}⚠️ Hubo un problema con el push inicial (código: $PUSH_EXIT_CODE)${NC}"
      echo -e "${YELLOW}Verifica que el repositorio existe en GitHub y que tienes permisos${NC}"
    fi
  else
    echo -e "${YELLOW}Puedes hacer push más tarde con: gitEasy save${NC}"
  fi
}


# Crear una nueva rama
create_branch() {
  BRANCH_NAME="$1"

  # Si no se proporciona nombre, pedirlo
  if [ -z "$BRANCH_NAME" ]; then
    echo -e "${YELLOW}Ingresa el nombre para la nueva rama:${NC}"
    read BRANCH_NAME

    if [ -z "$BRANCH_NAME" ]; then
      echo -e "${RED}Error: Debes especificar un nombre para la rama${NC}"
      exit 1
    fi
  fi

  echo -e "${YELLOW}Creando la rama '$BRANCH_NAME'...${NC}"

  # Verificar si la rama ya existe localmente
  if git show-ref --verify --quiet refs/heads/$BRANCH_NAME; then
    echo -e "${RED}La rama '$BRANCH_NAME' ya existe localmente.${NC}"
    echo -e "${YELLOW}¿Deseas cambiar a esa rama? (s/n)${NC}"
    read RESPUESTA
    if [[ $RESPUESTA == "s" || $RESPUESTA == "S" || $RESPUESTA == "si" || $RESPUESTA == "SI" || $RESPUESTA == "sí" || $RESPUESTA == "SÍ" ]]; then
      git checkout $BRANCH_NAME
      if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ Cambiado a la rama '$BRANCH_NAME'${NC}"
      else
        echo -e "${RED}⚠️ Error al cambiar a la rama${NC}"
      fi
    fi
    return 0
  fi

  # Verificar si hay cambios no guardados
  if [ -n "$(git status --porcelain)" ]; then
    echo -e "${RED}⚠️ Tienes cambios locales no guardados.${NC}"
    echo -e "${YELLOW}¿Quieres guardar tus cambios antes de crear la rama? (s/n)${NC}"
    read RESPUESTA
    if [[ $RESPUESTA == "s" || $RESPUESTA == "S" || $RESPUESTA == "si" || $RESPUESTA == "SI" || $RESPUESTA == "sí" || $RESPUESTA == "SÍ" ]]; then
      save_changes "Guardar cambios antes de crear rama $BRANCH_NAME"
    else
      echo -e "${YELLOW}Tus cambios se llevarán a la nueva rama.${NC}"
    fi
  fi

  # Crear la rama y cambiar a ella
  git checkout -b $BRANCH_NAME

  if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Rama '$BRANCH_NAME' creada y ahora estás en ella${NC}"

    # Preguntar si hacer push de la rama
    echo -e "${YELLOW}¿Deseas publicar esta rama en GitHub ahora? (s/n)${NC}"
    read RESPUESTA
    if [[ $RESPUESTA == "s" || $RESPUESTA == "S" || $RESPUESTA == "si" || $RESPUESTA == "SI" || $RESPUESTA == "sí" || $RESPUESTA == "SÍ" ]]; then
      git push -u origin $BRANCH_NAME
      if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ Rama publicada en GitHub${NC}"
      else
        echo -e "${RED}⚠️ Error al publicar la rama${NC}"
        echo -e "${YELLOW}La rama fue creada localmente. Puedes publicarla más tarde con:${NC}"
        echo -e "  git push -u origin $BRANCH_NAME"
      fi
    else
      echo -e "${YELLOW}La rama sólo existe localmente. Puedes publicarla más tarde con:${NC}"
      echo -e "  git push -u origin $BRANCH_NAME"
    fi
  else
    echo -e "${RED}⚠️ Error al crear la rama${NC}"
  fi
}

# Guardar cambios
save_changes() {
  MESSAGE="$*"
  if [ -z "$MESSAGE" ]; then
    # Si no se proporciona mensaje, usar uno por defecto con fecha
    MESSAGE="Actualización $(date '+%Y-%m-%d %H:%M')"
  fi

  # Verificar si hay cambios para guardar
  if [ -z "$(git status --porcelain)" ]; then
    echo -e "${YELLOW}No hay cambios para guardar.${NC}"

    # Verificar si hay commits que no se han enviado
    if [ -n "$(git log origin/main..main 2>/dev/null)" ]; then
      echo -e "${YELLOW}Pero hay commits locales que no se han enviado a GitHub.${NC}"
      echo -e "${YELLOW}¿Quieres enviarlos ahora? (s/n)${NC}"
      read RESPUESTA
      if [[ $RESPUESTA == "s" || $RESPUESTA == "S" || $RESPUESTA == "si" || $RESPUESTA == "SI" || $RESPUESTA == "sí" || $RESPUESTA == "SÍ" ]]; then
        git push -u origin main
        if [ $? -eq 0 ]; then
          echo -e "${GREEN}✓ Cambios enviados a GitHub${NC}"
        else
          echo -e "${RED}⚠️ Error al enviar cambios a GitHub${NC}"
        fi
      fi
    fi
    return 0
  fi

  echo -e "${YELLOW}Guardando cambios...${NC}"

  # Mostrar qué archivos se van a guardar
  echo -e "${YELLOW}Archivos a guardar:${NC}"
  git status --short

  # Preguntar confirmación
  echo -e "${YELLOW}¿Confirmar guardar estos cambios? (s/n)${NC}"
  read RESPUESTA
  if [[ $RESPUESTA != "s" && $RESPUESTA != "S" && $RESPUESTA != "si" && $RESPUESTA != "SI" && $RESPUESTA != "sí" && $RESPUESTA != "SÍ" ]]; then
    echo -e "${YELLOW}Operación cancelada.${NC}"
    return 0
  fi

  # Añadir todos los cambios
  git add .

  # Hacer commit con mensaje
  git commit -m "$MESSAGE"

  # Preguntar si enviar cambios
  echo -e "${YELLOW}¿Enviar cambios a GitHub ahora? (s/n)${NC}"
  read RESPUESTA
  if [[ $RESPUESTA == "s" || $RESPUESTA == "S" || $RESPUESTA == "si" || $RESPUESTA == "SI" || $RESPUESTA == "sí" || $RESPUESTA == "SÍ" ]]; then
    git push -u origin main
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}✓ Cambios guardados y enviados correctamente${NC}"
    else
      echo -e "${RED}⚠️ Error al enviar cambios a GitHub${NC}"
      echo -e "${GREEN}✓ Cambios guardados localmente${NC}"
    fi
  else
    echo -e "${GREEN}✓ Cambios guardados localmente${NC}"
    echo -e "${YELLOW}Puedes enviarlos más tarde con: gitEasy save${NC}"
  fi
}

# Actualizar repositorio
update_repo() {
  echo -e "${YELLOW}Actualizando repositorio...${NC}"

  # Verificar si hay cambios locales que podrían tener conflictos
  if [ -n "$(git status --porcelain)" ]; then
    echo -e "${RED}⚠️ Tienes cambios locales no guardados que podrían tener conflictos.${NC}"
    echo -e "${YELLOW}¿Quieres guardar tus cambios primero? (s/n)${NC}"
    read RESPUESTA
    if [[ $RESPUESTA == "s" || $RESPUESTA == "S" || $RESPUESTA == "si" || $RESPUESTA == "SI" || $RESPUESTA == "sí" || $RESPUESTA == "SÍ" ]]; then
      save_changes "Guardar cambios antes de actualizar"
    else
      echo -e "${YELLOW}Tus cambios locales se mantendrán, pero podría haber conflictos.${NC}"
    fi
  fi

  git pull origin main
  if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Repositorio actualizado${NC}"
  else
    echo -e "${RED}⚠️ Hubo un problema al actualizar. Verifica los conflictos.${NC}"
  fi
}

# Mostrar estado
show_status() {
  echo -e "${YELLOW}Estado del repositorio:${NC}"
  git status

  # Mostrar información adicional útil
  echo -e "\n${YELLOW}Ramas:${NC}"
  git branch -v

  echo -e "\n${YELLOW}Remoto:${NC}"
  git remote -v
}

# Mostrar log
show_log() {
  echo -e "${YELLOW}Historial reciente:${NC}"
  git log --oneline --graph --decorate -n 10
}

# Manejo de comandos
case "$1" in
  setup)
    shift
    setup_repo "$1"
    ;;
  save)
    shift
    # Verificar si estamos en un repositorio Git
    if [ ! -d ".git" ]; then
      echo -e "${RED}Error: No estás en un repositorio Git${NC}"
      echo "Primero ejecuta 'gitEasy setup [nombre-repo]' para configurar"
      exit 1
    fi
    save_changes "$@"
    ;;
  update)
    # Verificar si estamos en un repositorio Git
    if [ ! -d ".git" ]; then
      echo -e "${RED}Error: No estás en un repositorio Git${NC}"
      echo "Primero ejecuta 'gitEasy setup [nombre-repo]' para configurar"
      exit 1
    fi
    update_repo
    ;;
  branch)
    # Verificar si estamos en un repositorio Git
    if [ ! -d ".git" ]; then
      echo -e "${RED}Error: No estás en un repositorio Git${NC}"
      echo "Primero ejecuta 'gitEasy setup [nombre-repo]' para configurar"
      exit 1
    fi
    shift
    create_branch "$1"
    ;;
  status)
    # Verificar si estamos en un repositorio Git
    if [ ! -d ".git" ]; then
      echo -e "${RED}Error: No estás en un repositorio Git${NC}"
      echo "Primero ejecuta 'gitEasy setup [nombre-repo]' para configurar"
      exit 1
    fi
    show_status
    ;;
  log)
    # Verificar si estamos en un repositorio Git
    if [ ! -d ".git" ]; then
      echo -e "${RED}Error: No estás en un repositorio Git${NC}"
      echo "Primero ejecuta 'gitEasy setup [nombre-repo]' para configurar"
      exit 1
    fi
    show_log
    ;;
  help|*)
    show_help
    ;;
esac
