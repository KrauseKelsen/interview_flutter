# interview_flutter

# Dev
1. Copiar el .env.template y renombrarlo como .env
2. Cambiar las variables de entorno (AccuWeather API KEY)

NOTA: En el main.dart en la linea de codigo 21 (theme: AppTheme(selectedColor: 3).getTheme())
puede ser cambiado el valor de selectedColor para variar el tema de la aplicacion

Informacion respecto al proyecto:
1. Librerias utilizadas
    a. Intl (conversion)
    b. Provider Riverpod (gestor de estado)
    c. Go Router (enrutamiento y paginado)
    d. Flutter SVG (lectura de SVG)
    e. dotenv (variables de entorno)
    f. animation_do (animaciones)
    g. Dio (peticiones)

2. Estructura del proyecto
    a. Domain (Reglas del juego)
        i. datasources (origen de los datos)
        ii. entities (datos apegados a la logica de negocio)
        iii. repositories (se realizan llamados al repositorio para acceder al datasources)
    b. Infrastructure
        i. datasource (implementacion)
        ii. mappers (convierte respuestas en entidades de la aplicacion)
        iii. models (tipados del API)
        iv. repositories (implementacion)
    c. Presentation
        i. delegates (search delegate)
        ii. providers (implementacion del provider)
        iii. screens (vistas de la aplicacion)
        iv. widgets (fragmentos reutilizables de la interfaz)
    d. Config
        i. constans (variables de entorno del app)
        ii. router (enrutamiento del paginado)
        iii. theme (temas personalizados del app)
        