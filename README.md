\# FutbolWebApp



Práctica Data Control: aplicación web móvil de gestión de fútbol desarrollada con DataFlex y MySQL.



\## Estado del proyecto



En el entorno local de desarrollo se ha comprobado:



\- La apertura de la aplicación.

\- El acceso desde las cinco tarjetas del Dashboard a sus listados.

\- La apertura de las vistas de detalle de Entrenadores, Jugadores, Posiciones, Equipos y Ligas.



El código y la configuración de tablas están publicados en la rama `develop`.



La instalación desde cero en otro equipo todavía está pendiente de validación. Las comprobaciones locales descritas no constituyen una validación completa de todas las operaciones de la aplicación.



\## Funcionalidades implementadas



\- Dashboard con accesos a Entrenadores, Jugadores, Posiciones, Equipos y Ligas.

\- Cinco vistas de selección `Select…`.

\- Cinco vistas de detalle `Zoom…`.

\- Menú de navegación hacia los cinco listados.

\- Diccionarios de datos para las seis tablas de fútbol.



\## Tecnologías



\- DataFlex 2025.

\- MySQL 8.0.

\- Acceso a MySQL mediante el controlador ODBC de DataFlex.

\- Identificador de conexión administrada: `FutbolMySQL`.



\## Estructura del repositorio



\- `AppSrc/`: código fuente de la aplicación y vistas.

\- `AppHtml/`: recursos de la interfaz web.

\- `DDSrc/`: diccionarios de datos y definiciones de campos.

\- `Data/`: catálogo de tablas `Filelist.cfg` y archivos de configuración `.int`.

\- `Programs/`: configuración del workspace.

\- `sql/`: scripts de base de datos.

\- `FutbolWebApp.sws`: archivo del workspace de DataFlex.



\## Base de datos



El archivo `sql/futbol\_estructura.sql` contiene la estructura de doce tablas.



\### Tablas de fútbol



\- `entrenador`

\- `equipo`

\- `jugador`

\- `jugadorposicion`

\- `liga`

\- `posicion`



\### Tablas auxiliares



\- `codemast`

\- `codetype`

\- `dflastid`

\- `webappserverprops`

\- `webappsession`

\- `webappuser`



El script crea y selecciona el esquema `futbol`.



ATENCIÓN: incluye instrucciones `DROP TABLE IF EXISTS`. Elimina y recrea las tablas indicadas, por lo que no debe ejecutarse sobre una base de datos con información que se quiera conservar.



La exportación contiene únicamente la estructura. No incluye registros de usuarios, sesiones ni datos de demostración.



La creación de las tablas no garantiza por sí sola que la aplicación quede lista para utilizarse: siguen pendientes de comprobar los datos iniciales y la configuración local necesarios.



\## Configuración para otro equipo



La puesta en marcha requiere preparar un entorno compatible con DataFlex 2025, MySQL 8.0 y el acceso ODBC utilizado por el proyecto.



Los archivos `.int` hacen referencia al identificador de conexión `FutbolMySQL`. Cada equipo debe configurar localmente esa conexión hacia su propia base de datos, sin publicar sus credenciales.



El workspace se abre desde `FutbolWebApp.sws` y el proyecto principal es `AppSrc/WebApp.src`.



Estas indicaciones no constituyen todavía un procedimiento de instalación validado desde cero.



\## Archivos locales no publicados



El repositorio excluye, entre otros:



\- `Data/DFConnId.ini`.

\- `AppSrc/LoginEncryptionKey.inc`.

\- `AppSrc/WebAppLocalSecrets.inc`.

\- Datos locales de tablas, registros y cachés.

\- Metadatos locales de DataFlex Studio.

\- Ejecutables y archivos generados por el compilador.



Los archivos de conexión y secretos deben configurarse localmente. No se deben subir contraseñas ni claves al repositorio.



\## Pendiente de validación



\- Probar la instalación en un entorno limpio.

\- Documentar la configuración local de conexión y secretos.

\- Verificar cómo se crea el primer usuario de acceso.

\- Verificar la inicialización de `DFLastID`.

\- Preparar datos de demostración sin información sensible.

