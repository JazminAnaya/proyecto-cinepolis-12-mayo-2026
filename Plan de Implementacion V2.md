# Promt:

actua como un creador de software quiero crear una aplicacion multiplataforma en flutter dart. (Utilizando firebase, vs code o Antigravity) que herramientas se requieren, ui, ux, dependencias, login autenticacion usuario password, base de datos, firestore, privider, dependencias en pubspec.yaml . Quiero crear un plan de implementacion en formato mark.down, para desarrollar la aplicacion "Cinepolis Valtierra" con colores azules, blancos y amarillos, tambien dame los archivos organizados necesarios para cada tabla utilizando CRUD (crear,actualizar,ver y borrar). OJO: no codigo, procedimiento paso a paso detallado para el desarrollo


# Resultado: 
¡Excelente proyecto! Como arquitecto de software, te guiaré en la creación de **Cinepolis Valtierra**. Vamos a estructurar un plan de implementación completo y detallado en Markdown, justo como lo solicitaste, sin escribir el código fuente directamente, sino definiendo el paso a paso, las herramientas y la organización.

Aquí tienes tu plan de desarrollo:

---

# Plan de Implementación: Cinepolis Valtierra (Markdown)

**Versión:** 1.0
**Fecha:** 13 de Mayo de 2026
**Autor:** Arquitecto de Software Senior

## 1. Fase de Conceptualización y Diseño

### 1.1. Definición de la Paleta de Colores (UI/UX)
*   **Azul Primario:** `#0D47A1` (Azul oscuro, transmite confianza y profesionalismo). Usar en AppBar, botones principales.
*   **Azul Secundario:** `#1976D2` (Azul medio, para elementos interactivos, iconos, fondos de tarjetas).
*   **Amarillo Acento:** `#FFC107` (Amarillo mostaza, para botones de acción flotante, precios, insignias de puntos, "comprar ahora").
*   **Blanco:** `#FFFFFF` (Fondo principal, textos sobre fondos oscuros, áreas de contenido).
*   **Blanco Roto:** `#F5F5F5` (Fondo de `Scaffold`, separadores sutiles).
*   **Tipografía:** Roboto (por defecto en Material Design), con pesos Bold para títulos y Regular para cuerpo.

### 1.2. Mapa de Navegación (UX) y Pantallas Principales
1.  **`SplashScreen`**: Logo de Cinepolis Valtierra animado, verificación de autenticación.
2.  **`LoginScreen` / `RegisterScreen`**: Autenticación con email/password.
3.  **`HomeScreen` (Shell)**: `BottomNavigationBar` con 4 pestañas:
    *   **Cartelera**: `ListView` de películas en cartelera (póster, título, clasificación).
    *   **Próximamente**: `GridView` de estrenos futuros.
    *   **Mis Boletos**: Historial de compras del cliente.
    *   **Perfil**: Datos del cliente, puntos de lealtad, cerrar sesión.
4.  **Pantallas de Detalle:**
    *   **`MovieDetailScreen`**: Información completa de la película (sinopsis, director, duración, géneros). Botón "Seleccionar Función".
    *   **`SelectFunctionScreen`**: Permite elegir complejo, fecha y sala. Muestra una lista de horarios (`FUNCION`).
    *   **`SeatSelectionScreen`**: Mapa interactivo de asientos (`ASIENTO`), diferenciando disponibles y ocupados.
    *   **`CheckoutScreen`**: Resumen de compra (película, horario, asientos, precio).
    *   **`BoletoScreen`**: Vista final del boleto con código QR simulado.
5.  **Panel de Administración (Protegido por rol):**
    *   **`AdminDashboardScreen`**: Gestión CRUD para `PELICULA`, `FUNCION`, `SALA`, `COMPLEJO`.

### 1.3. Estructura de Archivos del Proyecto Flutter
La organización será modular y por funcionalidad (`feature-first`).
```
lib/
├── main.dart
├── app.dart
├── core/
│   ├── constants/
│   │   ├── app_colors.dart
│   │   ├── app_strings.dart
│   │   └── firebase_collections.dart
│   ├── models/              # Clases de datos puras
│   │   ├── complejo.dart
│   │   ├── pelicula.dart
│   │   ├── cliente.dart
│   │   ├── ... (uno por entidad)
│   ├── services/            # Lógica de negocio y acceso a datos
│   │   ├── auth_service.dart
│   │   ├── database_service.dart
│   │   ├── complejo_service.dart
│   │   ├── pelicula_service.dart
│   │   └── ... (uno por entidad con operaciones CRUD)
│   └── providers/           # Estado de la aplicación con Provider
│       ├── auth_provider.dart
│       ├── pelicula_provider.dart
│       └── boleto_provider.dart
├── features/                # Módulos de la aplicación
│   ├── auth/
│   │   └── screens/
│   │       ├── login_screen.dart
│   │       └── register_screen.dart
│   ├── customer/
│   │   └── screens/
│   │       ├── home_screen.dart
│   │       ├── movie_detail_screen.dart
│   │       ├── seat_selection_screen.dart
│   │       └── checkout_screen.dart
│   └── admin/
│       └── screens/
│           └── manage_peliculas_screen.dart
└── shared/
    └── widgets/             # Componentes reutilizables
        ├── movie_card.dart
        ├── seat_widget.dart
        └── loading_indicator.dart
```

## 2. Herramientas y Configuración del Entorno

### 2.1. Herramientas Requeridas
1.  **IDE Principal:**
    *   **Visual Studio Code (VS Code)**: Extensión oficial de Flutter, Atajos `stful`, `stless`.
    *   *Alternativa Visual:* **Antigravity (Antigravity IDE)**: Si se busca una interfaz más visual y gestión simplificada de paquetes.
2.  **Firebase:**
    *   **Firebase Console (Web):** Crear el proyecto `cinepolis-valtierra`.
    *   **Firebase Auth:** Habilitar el método de acceso "Correo electrónico/contraseña".
    *   **Cloud Firestore:** Crear la base de datos en modo producción.
3.  **Herramientas de Diseño UI/UX (Opcional pero recomendado):**
    *   **Figma o Adobe XD:** Para prototipar las pantallas de selección de asientos y checkout.

### 2.2. Dependencias (pubspec.yaml)
El archivo `pubspec.yaml` debe contener las siguientes dependencias en su sección correspondiente:

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # Firebase Core y Servicios
  firebase_core: ^2.25.0        # Inicializador de Firebase
  firebase_auth: ^4.18.0        # Autenticación
  cloud_firestore: ^4.15.0      # Base de datos NoSQL

  # Gestión de Estado
  provider: ^6.1.1              # State Management (recomendado por ti)

  # Utilidades y UI
  google_fonts: ^6.1.0          # Tipografía
  intl: ^0.19.0                 # Formato de fechas y moneda
  flutter_svg: ^2.0.9           # Iconos vectoriales
  shimmer: ^3.0.0               # Efecto de carga
  cupertino_icons: ^1.0.6       # Iconos

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.1
```

## 3. Fase de Implementación del Backend (Firebase)

### 3.1. Adaptación de la Base de Datos a Firestore
Tu script SQL usa un modelo relacional. En Firestore (NoSQL), trabajaremos con **Documentos** y **Colecciones**. Aquí tienes la equivalencia para cada una de tus tablas. **Nota:** Usaremos el nombre de la tabla como `ID` del documento, en minúsculas y plural.

1. Clientes
Documentos identificados por el UID único generado por Firebase Authentication.

Campos: email (String), fecha_registro (String), nombre (String), puntos_cinepolis (Number), telefono (String).

2. Complejos
Sedes físicas del cine que proveen infraestructura para las salas.

Campos: ciudad (String), direccion (String), estado (String), nombre (String), telefono (String).

3. Empleados
Personal que labora en el complejo cinematográfico.

Campos: RFC (String), email (String), id_complejo (Reference -> /Complejos/{id}), nombre (String), puesto (String), salario (Number), telefono (String).

4. Funciones
Horarios específicos en los que se proyecta una película en una sala determinada.

Campos: estado (String), fecha_hora (String), formato (String), id_pelicula (Reference -> /Peliculas/{id}), id_sala (Reference -> /Salas/{id}), precio_base (Number).

5. Inventario_Alimentos
Control del stock de productos consumibles de la dulcería del cine.

Campos: categoria (String), estado (String), nombre (String), precio (Number), stock_disponible (Number).

6. Peliculas
Catálogo de producciones cinematográficas disponibles en el sistema.

Campos: clasificacion (String), director (String), duracion_min (Number), fecha_estreno (String), genero (String), idioma (String), nombre (String), sinopsis (String).

7. Salas
Espacios físicos dentro de un complejo donde ocurren las proyecciones.

Campos: capacidad (Number), id_complejos (Reference -> /Complejos/{id}), nombre (String), tipo (String).

## 4. Procedimiento Paso a Paso para el Desarrollo

### 4.1. Paso 1: Inicialización y Autenticación
1.  Ejecuta `flutter create cinepolis_valtierra`.
2.  Configura Firebase CLI (`firebase init`, `flutterfire configure`).
3.  En `main.dart`, inicializa `Firebase` y envuelve la app en `MultiProvider` con `AuthProvider`.
4.  Crea `auth_provider.dart` con `ChangeNotifier`. Debe tener:
    *   `login(email, password)`: Llama a `FirebaseAuth`.
    *   `register(email, password, nombre)`: Crea usuario en Auth y guarda datos extra en la colección `clientes`.
    *   `logout()`.
5.  Construye `LoginScreen.dart` y `RegisterScreen.dart` con los colores corporativos (fondo blanco, cajas de texto con borde azul, botón amarillo). Usa `context.read<AuthProvider>().login()`.

### 4.2. Paso 2: Módulo de Cartelera (Cliente)
1.  **Modelo:** Crea `pelicula.dart` con un factory constructor `fromFirestore`.
2.  **Servicio:** En `pelicula_service.dart`, implementa `Stream<List<Pelicula>> getPeliculas()`. Debe devolver un `Stream` para actualizaciones en tiempo real.
3.  **Provider:** `PeliculaProvider` llamará a `getPeliculas` en su constructor y expondrá la lista.
4.  **UI:** En `HomeScreen`, en la pestaña "Cartelera", usa un `StreamBuilder` o `Consumer<PeliculaProvider>` dentro de un `ListView.builder`. El `movie_card.dart` tendrá la imagen del póster, título en azul y clasificación.

### 4.3. Paso 3: Flujo de Compra de Boletos (CRUD para Cliente)
Este es el flujo más complejo. La creación del boleto implica varias lecturas previas.
1.  **Seleccionar Película (`MovieDetailScreen`)**: Al tocar "Comprar", navega a `SelectFunctionScreen` pasando `id_pelicula`.
2.  **Seleccionar Función (`SelectFunctionScreen`)**:
    *   Lee la colección `funciones` filtrando por `id_pelicula` y fecha actual.
    *   Muestra una lista de complejos y horarios. Al seleccionar uno, navega a `SeatSelectionScreen` pasando `id_funcion` y `id_sala`.
3.  **Seleccionar Asientos (`SeatSelectionScreen`)**:
    *   **Leer (Read):** Obtén todos los documentos de `salas/{id_sala}/asientos`. Conviértelos en una matriz (fila/columna) de `AsientoWidget`.
    *   **Lógica de Estado:** Al tocar un asiento `disponible == true`, cambia su color a amarillo (seleccionado).
    *   **Validación Cruzada:** Antes de mostrar un asiento como "vendido" o "ocupado", debes consultar la colección `boletos` para la función actual (`id_funcion`). Si ya existe un boleto con ese `id_asiento`, el asiento debe pintarse de rojo y no ser seleccionable.
4.  **Checkout (`CheckoutScreen`)**:
    *   Muestra el resumen: Película, Hora, Asientos (A1, A2) y Precio Total (suma de precios).
    *   Botón "Pagar" (Amarillo).
    *   **Crear (Create) Transacción y Boleto (Operación Batch):**
        *   Al presionar "Pagar", ejecuta una `WriteBatch` de Firestore.
        *   **Paso 1:** Crea un documento en `transacciones` (con estado "Completado").
        *   **Paso 2:** Por cada asiento seleccionado, crea un documento en `boletos` (`id_funcion`, `id_cliente`, `id_asiento`, `precio_final`).
        *   **Paso 3 (Navegación):** Al completar, navega a `BoletoScreen` con los IDs generados.

### 4.4. Paso 4: Módulo de Administración (CRUD para Empleado)
1.  **Autenticación de Admin:** Crea un guardián de ruta. Si el `cliente.rol != 'admin'`, redirige al Home.
2.  **Interfaz `ManagePeliculasScreen`**:
    *   **Ver (Read):** `ListView` con todas las películas. Botón flotante `+` (amarillo).
    *   **Crear (Create):** Al tocar `+`, `showModalBottomSheet` o `push` a `PeliculaFormScreen`. Campos: Título, Género (lista de chips), Sinopsis. Botón "Guardar" llama a `PeliculaService.createPelicula()`.
    *   **Actualizar (Update):** Al tocar un elemento de la lista, abre `PeliculaFormScreen` con los datos pre-cargados. Llama a `PeliculaService.updatePelicula()`.
    *   **Borrar (Delete):** En el `ListTile`, un `IconButton` de papelera. Muestra `showDialog` de confirmación. Llama a `PeliculaService.deletePelicula()`.
3.  **Repite este patrón CRUD para las entidades:** `COMPLEJO`, `SALA` (recuerda que al crear una sala, debes generar su subcolección `asientos`), y `FUNCION`.

## 5. Plan de Implementación Detallado de CRUD por Entidad

Aquí tienes la organización de archivos y métodos para cada tabla, usando **Provider** como gestor de estado.

### 5.1. Para `PELICULA` (Ejemplo Principal)
*   **Modelo:** `lib/core/models/pelicula.dart`
*   **Servicio:** `lib/core/services/pelicula_service.dart`
    *   `Future<void> addPelicula(Pelicula p)`
    *   `Stream<List<Pelicula>> getPeliculas()`
    *   `Future<void> updatePelicula(Pelicula p)`
    *   `Future<void> deletePelicula(String id)`
*   **Provider:** `lib/core/providers/pelicula_provider.dart`
    *   Expone la lista y llama a los métodos del servicio.
*   **Pantallas UI Admin:**
    *   `lib/features/admin/screens/admin_peliculas_screen.dart` (Lista y botón eliminar).
    *   `lib/features/admin/screens/pelicula_form_screen.dart` (Formulario crear/editar).

### 5.2. Para `FUNCION`
*   **Modelo:** `funcion.dart`
*   **Servicio:** `funcion_service.dart` (Recuerda que al crear una función, debes validar que la sala y película existan).
*   **Pantalla Admin:** `admin_funciones_screen.dart` y `funcion_form_screen.dart` (con dropdowns para seleccionar sala y película).

## 6. Diseño UI/UX Específico con Paleta de Colores

*   **`Scaffold` global:** `backgroundColor: Colors.white`.
*   **`AppBar`:**
    *   `backgroundColor: Color(0xFF0D47A1)` (Azul Oscuro).
    *   `title: Text('Cinepolis Valtierra', style: TextStyle(color: Colors.white))`.
    *   `iconTheme: IconThemeData(color: Color(0xFFFFC107))` (Íconos de retroceso en Amarillo).
*   **Tarjetas de Películas (`MovieCard`):**
    *   `Card` con `elevation: 5`, fondo blanco, borde sutil azul.
    *   Título: Azul oscuro, peso negrita.
    *   Chip de Clasificación: Fondo amarillo, texto azul oscuro.
*   **Botones de Acción:**
    *   `ElevatedButton` Principal: `backgroundColor: Color(0xFFFFC107)`, `foregroundColor: Color(0xFF0D47A1)`, texto en negrita.
*   **Mapa de Asientos:**
    *   Disponible: `Icon` gris con borde azul.
    *   Seleccionado: `Icon` con color de acento `Color(0xFFFFC107)` y sombra.
    *   Ocupado: `Icon` rojo oscuro opaco.

## 7. Flujo Final de Pruebas

1.  **Prueba Unitaria:** Verificar que los `fromFirestore` y `toMap` de cada modelo funcionan.
2.  **Prueba de Integración:** Usar `flutter drive` para probar el flujo completo: Login -> Seleccionar Película -> Elegir Función -> Seleccionar Asiento -> Comprar -> Verificar que el asiento ahora aparece ocupado en una segunda cuenta.
3.  **Prueba de Reglas de Seguridad:** Intentar modificar un boleto desde un cliente no autorizado debe fallar.
