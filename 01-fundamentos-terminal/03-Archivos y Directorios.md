# Archivos y Directorios
Saber navegar es la mitad del trabajo. La otra mitad es poder crear, copiar, mover y eliminar archivos y carpetas. Estos son los comandos que usarás decenas de veces al día.

## Crear directorios y archivos

### `mkdir` Crear directorios

```bash
$ mkdir proyectos                    # Crea la carpeta "proyectos"
$ mkdir proyectos/web                # Crea subcarpeta (proyectos debe existir)
$ mkdir -p proyectos/web/css         # Crea toda la ruta aunque no exista (-p)
$ mkdir carpeta1 carpeta2 carpeta3   # Crea varias carpetas a la vez
```
### `touch` Crear archivos vacíos (o actualizar fecha)

```bash
$ touch notas.txt                    # Crea un archivo vacío
$ touch archivo1.txt archivo2.txt    # Crea varios archivos
$ touch -t 202501011200 archivo.txt  # Cambia la fecha de modificación
```

> 💡 `touch` se usa principalmente para crear archivos vacíos rápidamente. Si el archivo ya existe, solo actualiza su fecha de modificación.

---
## Ver el contenido de archivos

### `cat` Ver el contenido completo

```bash
$ cat notas.txt                # Muestra todo el archivo
$ cat -n notas.txt             # Con números de línea
$ cat archivo1 archivo2        # Concatena y muestra dos archivos
```

Ideal para archivos cortos. Para archivos largos, usar `less`.
### `less` Ver archivos largos (paginado)

```bash
$ less archivo_largo.txt
```

Navegación dentro de `less`:

- `↑` / `↓` → moverse línea a línea
- `PgUp` / `PgDn` → página a página
- `/texto` → buscar "texto"
- `n` → siguiente resultado de búsqueda
- `q` → salir
### `head` y `tail` — Ver el principio o el final

```bash
$ head archivo.txt           # Primeras 10 líneas (por defecto)
$ head -n 5 archivo.txt      # Primeras 5 líneas
$ tail archivo.txt           # Últimas 10 líneas
$ tail -n 20 archivo.txt     # Últimas 20 líneas
$ tail -f log.txt            # Seguir el archivo en tiempo real (para logs)
```

---
## Copiar, mover y renombrar

### `cp` Copiar

```bash
$ cp origen.txt destino.txt         # Copia archivo
$ cp archivo.txt carpeta/           # Copia a una carpeta
$ cp -r carpeta/ nueva_carpeta/     # Copia carpeta completa (-r = recursivo)
$ cp -i archivo.txt destino.txt     # Pide confirmación si ya existe (-i)
$ cp -v archivo.txt carpeta/        # Muestra lo que va copiando (-v = verbose)
```
### `mv` Mover o renombrar

```bash
$ mv archivo.txt carpeta/           # Mover a otra carpeta
$ mv viejo_nombre.txt nuevo.txt     # Renombrar (en el mismo directorio)
$ mv archivo.txt carpeta/nuevo.txt  # Mover y renombrar al mismo tiempo
$ mv -i archivo.txt destino/        # Pide confirmación si ya existe
```

> 📝 `mv` hace dos cosas: mover y renombrar. Si el destino es la misma carpeta pero diferente nombre, renombra.

---
## Eliminar archivos y directorios

> ⚠️ **CUIDADO:** En Linux no hay papelera de reciclaje desde la terminal. Lo que borras con `rm` se va para siempre (a menos que tengas backups).
### `rm` Eliminar archivos

```bash
$ rm archivo.txt                    # Borra un archivo
$ rm -i archivo.txt                 # Pide confirmación antes de borrar
$ rm archivo1.txt archivo2.txt      # Borra varios archivos
$ rm *.log                          # Borra todos los archivos .log
```

### `rmdir` Eliminar directorios vacíos

```bash
$ rmdir carpeta_vacia               # Solo funciona si la carpeta está vacía
```

### `rm -r`Eliminar directorios con contenido

```bash
$ rm -r carpeta/              # Borra la carpeta y todo su contenido
$ rm -ri carpeta/             # Lo mismo, pero pide confirmación por cada archivo
```

> ⚠️ **Nunca ejecutes `rm -rf /` ni `rm -rf *` sin estar 100% seguro de lo que estás borrando.** El `-f` fuerza el borrado sin preguntar. Son comandos destructivos.

---
## Escribir contenido en archivos

### Redirección de salida

```bash
$ echo "Hola mundo" > archivo.txt     # Crea/sobreescribe el archivo
$ echo "Segunda línea" >> archivo.txt # Agrega al final (no sobreescribe)
```
### `nano` Editor de texto simple en la terminal

```bash
$ nano notas.txt
```

---
## Buscar archivos

### `find` Buscar archivos y directorios

```bash
$ find . -name "notas.txt"           # Busca por nombre en el directorio actual
$ find /home -name "*.txt"           # Busca todos los .txt en /home
$ find . -type d                     # Busca solo directorios
$ find . -type f -name "*.sh"        # Busca archivos .sh
$ find . -newer archivo.txt          # Archivos más nuevos que archivo.txt
```
### `grep` Buscar texto dentro de archivos

```bash
$ grep "error" log.txt               # Busca "error" en log.txt
$ grep -i "error" log.txt            # Búsqueda sin distinción mayúsculas/minúsculas
$ grep -r "TODO" proyectos/          # Busca "TODO" en todos los archivos de proyectos/
$ grep -n "función" script.sh        # Muestra número de línea de cada coincidencia
$ grep -l "error" *.log              # Solo muestra los nombres de archivos que contienen "error"
```

---
## Comodines (wildcards)

Los comodines permiten operar sobre múltiples archivos a la vez:

|Comodín|Significado|Ejemplo|
|---|---|---|
|`*`|Cualquier cantidad de cualquier carácter|`*.txt` → todos los .txt|
|`?`|Exactamente un carácter|`archivo?.txt` → archivo1.txt, archivoa.txt|
|`[abc]`|Cualquiera de los caracteres indicados|`[abc]*.txt` → archivos que empiezan con a, b o c|

```bash
$ ls *.txt               # Lista todos los archivos .txt
$ rm foto?.jpg           # Borra foto1.jpg, foto2.jpg... pero no foto12.jpg
$ cp *.sh scripts/       # Copia todos los archivos .sh a la carpeta scripts/
```

---
## Práctica completa

Ejecuta esto en tu terminal para practicar:

```bash
# Crear estructura de práctica
mkdir -p practica/docs practica/scripts
cd practica

# Crear archivos
touch docs/notas.txt docs/ideas.txt scripts/hola.sh

# Ver la estructura
ls -la
ls -la docs/

# Añadir contenido
echo "Esta es mi primera nota" > docs/notas.txt
echo "Hola desde la línea de comandos" >> docs/notas.txt

# Ver el contenido
cat docs/notas.txt

# Copiar un archivo
cp docs/notas.txt docs/notas_backup.txt

# Renombrar
mv docs/ideas.txt docs/ideas_lluvia.txt

# Buscar
find . -name "*.txt"
grep "primera" docs/notas.txt

# Limpiar (con cuidado)
cd ..
rm -ri practica/
```


