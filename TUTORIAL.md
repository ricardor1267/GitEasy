# Tutorial: GitEasy

Este tutorial te guiará paso a paso en el uso del script GitEasy para simplificar tu flujo de trabajo con Git y GitHub.

## Tabla de Contenidos

1. [Preparación Inicial](#preparación-inicial)
2. [Configurando tu Primer Repositorio](#configurando-tu-primer-repositorio)
3. [Trabajando con tu Repositorio](#trabajando-con-tu-repositorio)
4. [Gestión de Ramas](#gestión-de-ramas)
5. [Casos de Uso Comunes](#casos-de-uso-comunes)
6. [Consejos y Trucos](#consejos-y-trucos)
7. [Solución de Problemas](#solución-de-problemas)

## Preparación Inicial

### Obtener un Token de GitHub

Antes de empezar a usar GitEasy, necesitas crear un token de acceso personal de GitHub (PAT). Sigue estos pasos detallados:

1. Inicia sesión en tu cuenta de GitHub (https://github.com)

2. Haz clic en tu foto de perfil en la esquina superior derecha y selecciona **Settings** (Configuración)

3. Desplázate hacia abajo en el menú lateral izquierdo y haz clic en **Developer settings** (Configuración de desarrollador)

4. En el nuevo menú lateral, selecciona **Personal access tokens** (Tokens de acceso personal) y luego **Tokens (classic)**

5. Haz clic en el botón **Generate new token** (Generar nuevo token) y selecciona **Generate new token (classic)**

6. Se te pedirá que ingreses tu contraseña de GitHub para confirmar

7. En la página "New personal access token":
   - En el campo **Note** (Nota), escribe un nombre descriptivo como "GitEasy Script"
   - En **Expiration** (Vencimiento), selecciona cuánto tiempo quieres que sea válido el token (puedes elegir "No expiration" si no quieres que caduque, aunque por seguridad es mejor establecer una fecha)
   - En **Select scopes** (Seleccionar ámbitos), marca las siguientes casillas:
     - Toda la sección `repo` (para acceso completo a repositorios)
     - `workflow` (si planeas usar GitHub Actions)
     - `delete_repo` (si quieres poder eliminar repositorios)

8. Desplázate hacia abajo y haz clic en el botón verde **Generate token** (Generar token)

9. **¡IMPORTANTE!** Verás tu nuevo token personal. **Cópialo inmediatamente** y guárdalo en un lugar seguro (como un gestor de contraseñas). GitHub no te mostrará este token nuevamente.

   ![Ejemplo de token generado](https://docs.github.com/assets/cb-49935/mw-1000/images/help/settings/personal_access_tokens.webp)

Este token funciona como una contraseña, así que manténlo seguro y no lo compartas con nadie.

### Configurar el Script

1. Abre el archivo `gitEasy.sh` en un editor de texto
2. Edita las siguientes líneas con tu información:
   ```bash
   DEFAULT_USER="tu-usuario-github"
   TOKEN="tu-token-de-github"
   ```
3. Guarda el archivo

### Hacer el Script Accesible desde Cualquier Carpeta

Hay varias formas de hacer que el script GitEasy sea accesible desde cualquier ubicación en tu sistema. A continuación se detallan los métodos más comunes:

#### Método 1: Mover el script a una carpeta en el PATH

1. Primero, haz el script ejecutable:
   ```bash
   chmod +x /Users/mimac/mining/githubEasy/gitEasy.sh
   ```

2. Crea una carpeta para tus scripts personales (si no existe):
   ```bash
   mkdir -p ~/bin
   ```

3. Copia o mueve el script a esa carpeta:
   ```bash
   cp /Users/mimac/mining/githubEasy/gitEasy.sh ~/bin/gitEasy
   # O para moverlo:
   # mv /Users/mimac/mining/githubEasy/gitEasy.sh ~/bin/gitEasy
   ```
   Nota: Le quitamos la extensión `.sh` para que sea más limpio de usar.

4. Asegúrate de que esta carpeta esté en tu PATH. Agrega esta línea al final de tu archivo `~/.bashrc`, `~/.bash_profile`, o `~/.zshrc` (dependiendo de tu shell):
   ```bash
   export PATH="$HOME/bin:$PATH"
   ```

5. Aplica los cambios en tu terminal actual:
   ```bash
   source ~/.bashrc  # o ~/.bash_profile o ~/.zshrc según corresponda
   ```

6. Ahora puedes usar el comando `gitEasy` desde cualquier ubicación:
   ```bash
   gitEasy help
   ```

#### Método 2: Crear un enlace simbólico

1. Haz el script ejecutable (si aún no lo has hecho):
   ```bash
   chmod +x /Users/mimac/mining/githubEasy/gitEasy.sh
   ```

2. Crea un enlace simbólico en una carpeta que ya esté en tu PATH:
   ```bash
   ln -s /Users/mimac/mining/githubEasy/gitEasy.sh /usr/local/bin/gitEasy
   ```
   Nota: Es posible que necesites usar `sudo` para este comando.

3. Ahora puedes usar el comando `gitEasy` desde cualquier ubicación.

#### Método 3: Crear un alias

Si prefieres un alias más corto (como `ge`):

1. Abre tu archivo de configuración de shell:
   ```bash
   # Para bash:
   nano ~/.bashrc  # o ~/.bash_profile
   
   # Para zsh:
   nano ~/.zshrc
   ```

2. Agrega esta línea al final del archivo:
   ```bash
   alias ge='/Users/mimac/mining/githubEasy/gitEasy.sh'
   ```

3. Guarda el archivo (Ctrl+O, luego Enter, luego Ctrl+X en nano)

4. Aplica los cambios en tu terminal actual:
   ```bash
   source ~/.bashrc  # o ~/.bash_profile o ~/.zshrc según corresponda
   ```

5. Ahora puedes usar el alias `ge` desde cualquier ubicación:
   ```bash
   ge help
   ```

#### Verificación

Para verificar que la instalación fue exitosa, abre una nueva terminal, navega a cualquier carpeta y ejecuta:

```bash
ge help  # Si usaste un alias
# o
gitEasy help  # Si usaste los otros métodos
```

Deberías ver el menú de ayuda del script GitEasy.

## Configurando tu Primer Repositorio

### Iniciar un Nuevo Proyecto

1. Crea una carpeta para tu proyecto:
   ```bash
   mkdir mi-proyecto
   cd mi-proyecto
   ```

2. Configura el repositorio:
   ```bash
   /Users/mimac/mining/githubEasy/gitEasy.sh setup
   ```
   O si has configurado el alias:
   ```bash
   ge setup
   ```

3. Sigue las instrucciones en pantalla:
   - Ingresa el nombre del repositorio
   - Decide si será privado o público
   - Selecciona el tipo de proyecto para generar el `.gitignore` adecuado
   - Confirma si deseas hacer el push inicial

### Usar un Proyecto Existente

Si ya tienes un proyecto en tu máquina que quieres conectar a GitHub:

1. Navega a la carpeta del proyecto:
   ```bash
   cd mi-proyecto-existente
   ```

2. Configura el repositorio:
   ```bash
   ge setup nombre-del-repo
   ```

3. Sigue las instrucciones, seleccionando el tipo de `.gitignore` adecuado.

## Trabajando con tu Repositorio

### Guardar Cambios

Después de modificar archivos, guarda tus cambios con:

```bash
ge save "Mensaje descriptivo de los cambios"
```

El script:
1. Mostrará los archivos modificados
2. Pedirá confirmación
3. Ejecutará `git add .`, `git commit` y opcionalmente `git push`

Si no proporcionas un mensaje, se usará uno genérico con la fecha actual.

### Actualizar tu Repositorio

Para obtener los últimos cambios del repositorio remoto:

```bash
ge update
```

El script verificará si tienes cambios locales antes de hacer pull y te dará opciones para manejarlos.

### Verificar el Estado

Para ver el estado actual del repositorio:

```bash
ge status
```

Esto muestra una vista mejorada del estado, incluyendo información sobre ramas y remotes.

### Ver el Historial

Para ver los commits recientes:

```bash
ge log
```

## Gestión de Ramas

### Crear una Nueva Rama

```bash
ge branch nueva-caracteristica
```

O si quieres que el script te pida el nombre:

```bash
ge branch
```

El script creará la rama, cambiará a ella y opcionalmente la publicará en GitHub.

### Trabajar con Ramas

Una vez en tu rama, usa `ge save` normalmente para guardar cambios. 

Para volver a la rama principal:
```bash
git checkout main
```

## Casos de Uso Comunes

### Iniciar un Nuevo Proyecto

```bash
mkdir nuevo-proyecto
cd nuevo-proyecto
ge setup
# Sigue las instrucciones para nombrar el repo y configurarlo
touch app.js
ge save "Primer archivo de código"
```

### Colaborar en un Proyecto Existente

```bash
# Clonar el repositorio (usar git clone normal)
git clone https://github.com/usuario/repo.git
cd repo

# Crear una rama para tu característica
ge branch mi-caracteristica

# Hacer cambios
echo "// Nuevo código" >> archivo.js
ge save "Añadida nueva funcionalidad"

# Actualizar con cambios de otros
ge update
```

## Consejos y Trucos

### Personalización del Script

Puedes personalizar GitEasy editando el archivo para:
- Añadir nuevos comandos
- Modificar mensajes o colores
- Cambiar comportamientos predeterminados

### Combinación con Git Estándar

GitEasy puede usarse junto con comandos Git estándar. Por ejemplo:

```bash
# Usar GitEasy para configuración inicial
ge setup mi-proyecto

# Usar git estándar para operaciones específicas
git diff archivo.js
git checkout -- archivo.js

# Usar GitEasy para guardar y actualizar
ge save "Arreglado bug crítico"
```

## Solución de Problemas

### Error de Autenticación

Si recibes "Bad credentials" o errores de autenticación:
1. Verifica que el token en el script sea correcto
2. Asegúrate de que el token tenga los permisos necesarios
3. Confirma que el token no haya expirado

### Conflictos en Merge

Si encuentras conflictos durante `ge update`:
1. Resuelve los conflictos manualmente
2. Usa `git add` para marcar los archivos como resueltos
3. Completa el merge con `git commit`
4. Continúa usando GitEasy normalmente

### Otros Problemas

Si el script falla con un error no descriptivo:
1. Intenta ejecutar el comando Git equivalente manualmente
2. Revisa los mensajes de error detallados
3. Asegúrate de que estás en un directorio que es un repositorio Git (para comandos que lo requieren)

---

Con este tutorial deberías estar listo para utilizar GitEasy para simplificar tu flujo de trabajo con Git y GitHub. ¡Feliz codificación!
