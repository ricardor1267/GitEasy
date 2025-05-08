# GitEasy

GitEasy es un script de shell que simplifica las operaciones comunes de Git para trabajar con repositorios de GitHub. Diseñado para hacer que el flujo de trabajo con Git sea más rápido y sencillo, especialmente para desarrolladores que prefieren evitar la complejidad de los comandos Git nativos.

## Características Principales

- 🔄 **Configuración Rápida**: Inicializa repositorios y los configura con GitHub en segundos
- 💾 **Guardado Simplificado**: Combina add, commit y push en un solo comando
- 🌿 **Gestión de Ramas**: Crea y cambia entre ramas fácilmente
- 📋 **Plantillas de .gitignore**: Crea archivos .gitignore optimizados para diferentes tipos de proyectos
- 🔒 **Soporte para Repositorios Privados**: Opción para crear repositorios privados o públicos
- 📊 **Estado e Historial**: Visualiza el estado actual e historial de cambios

## Requisitos Previos

- Git instalado en tu sistema
- Cuenta de GitHub activa
- Token de acceso personal de GitHub con permisos para crear repositorios

## Instalación

1. Descarga el script `gitEasy.sh`
2. Haz el script ejecutable:
   ```bash
   chmod +x gitEasy.sh
   ```
3. [Opcional] Agrega el script a tu PATH para ejecutarlo desde cualquier ubicación:
   ```bash
   # Agrega al final de tu archivo .bashrc o .zshrc
   export PATH=$PATH:/ruta/a/gitEasy
   ```
4. [Opcional] Crea un alias para facilitar su uso:
   ```bash
   # Agrega al final de tu archivo .bashrc o .zshrc
   alias ge='/ruta/a/gitEasy.sh'
   ```

## Configuración Inicial

Antes de usar el script, configura tus datos de GitHub en el archivo:

1. Abre el script en un editor de texto
2. Modifica las variables `DEFAULT_USER` y `TOKEN` con tu nombre de usuario y token personal de GitHub:
   ```bash
   DEFAULT_USER="tu-usuario-github"
   TOKEN="tu-token-personal-github"
   ```

## Comandos Disponibles

| Comando | Descripción |
|---------|-------------|
| `gitEasy.sh setup [repo]` | Configura un repositorio nuevo o existente (inicializa Git, crea repo en GitHub, añade remote) |
| `gitEasy.sh save [mensaje]` | Guarda todos los cambios (add, commit, push) con el mensaje especificado |
| `gitEasy.sh update` | Actualiza el repositorio local con los cambios del remoto (pull) |
| `gitEasy.sh branch [nombre]` | Crea una nueva rama y cambia a ella |
| `gitEasy.sh status` | Muestra el estado actual del repositorio |
| `gitEasy.sh log` | Muestra el historial de commits recientes |
| `gitEasy.sh help` | Muestra ayuda con todos los comandos disponibles |

## Seguridad

⚠️ **Importante**: El token de GitHub se almacena en texto plano dentro del script, lo que representa un riesgo de seguridad. Para mitigar este riesgo:

- **NUNCA compartas** este script con tu token incluido
- Establece permisos restrictivos para el archivo: `chmod 700 gitEasy.sh`
- No subas este script a repositorios públicos sin primero eliminar tu token
- Considera usar variables de entorno como alternativa más segura:
  ```bash
  # En lugar de codificar el token en el script, modíficalo así:
  TOKEN="${GITHUB_TOKEN}"
  # Y luego exporta la variable en tu archivo .bashrc o .zshrc:
  export GITHUB_TOKEN="tu-token-de-github"
  ```

## Obtener un Token de GitHub

Para usar GitEasy, necesitas un token de acceso personal de GitHub:

1. Inicia sesión en GitHub: https://github.com
2. Ve a tu foto de perfil → **Settings** → **Developer settings** → **Personal access tokens** → **Tokens (classic)**
3. Haz clic en **Generate new token** → **Generate new token (classic)**
4. Configura el token:
   - **Note**: "GitEasy Script"
   - **Expiration**: Selecciona la duración (recomendado: 90 días)
   - **Scopes**: Marca todas las casillas bajo `repo` y la casilla `delete_repo`
5. Haz clic en **Generate token**
6. **¡IMPORTANTE!** Copia inmediatamente el token generado. GitHub no te lo mostrará nuevamente.

Para instrucciones detalladas con imágenes, consulta el archivo TUTORIAL.md.

## Contribuciones

Las contribuciones son bienvenidas. Puedes mejorar este script añadiendo nuevas funcionalidades, mejorando la documentación o corrigiendo errores.

## Licencia

Este script es de código abierto y está disponible para su uso personal y comercial.
