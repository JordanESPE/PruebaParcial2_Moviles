# Tema Personalizado - Documentacion

## Descripcion General

Este archivo contiene el tema personalizado para la aplicacion. El tema define todos los estilos visuales de manera centralizada, asegurando consistencia en toda la interfaz.

## Paleta de Colores

### Colores Principales
- **primaryColor** (#2C3E50): Color azul oscuro usado para elementos principales
  - AppBar
  - Elementos destacados
  
- **secondaryColor** (#3498DB): Color azul claro para acciones secundarias
  - Botones
  - Enlaces activos
  - Elementos interactivos

- **accentColor** (#E74C3C): Color rojo para llamadas de atencion
  - Alertas
  - Precios especiales

### Colores de Fondo
- **backgroundColor** (#F5F5F5): Fondo general de la aplicacion
  - Scaffold background
  - Areas de contenido principal

- **cardColor** (#FFFFFF): Color blanco para tarjetas
  - Cards
  - Elementos elevados

### Colores de Texto
- **textPrimaryColor** (#2C3E50): Texto principal oscuro
  - Titulos
  - Texto importante

- **textSecondaryColor** (#7F8C8D): Texto secundario gris
  - Descripciones
  - Texto de apoyo

## Componentes Estilizados

### AppBar
- Fondo: primaryColor
- Texto: Blanco
- Elevacion: 2
- Titulo centrado
- Tamano de fuente: 20
- Peso de fuente: Bold

### Cards
- Fondo: cardColor
- Elevacion: 4
- Sombra: Negro con 26% de opacidad
- Bordes redondeados: 12px

### Botones Elevados
- Fondo: secondaryColor
- Texto: Blanco
- Padding: 24px horizontal, 12px vertical
- Bordes redondeados: 8px
- Elevacion: 2

### Campos de Texto
- Fondo: Blanco
- Borde normal: Gris
- Borde enfocado: secondaryColor con grosor 2
- Padding interno: 16px horizontal, 12px vertical
- Bordes redondeados: 8px

### Chips (Filtros)
- Fondo: backgroundColor
- Fondo seleccionado: secondaryColor
- Texto: textPrimaryColor
- Padding: 12px horizontal, 8px vertical
- Bordes redondeados: 8px

## Tipografia

### Display (Titulos grandes)
- **displayLarge**: 32px, Bold
- **displayMedium**: 28px, Bold
- **displaySmall**: 24px, Bold

### Headings (Encabezados)
- **headlineMedium**: 20px, Semi-Bold (600)

### Titles (Titulos)
- **titleLarge**: 18px, Semi-Bold (600)
- **titleMedium**: 16px, Medium (500)

### Body (Cuerpo)
- **bodyLarge**: 16px, Normal
- **bodyMedium**: 14px, Color secundario

### Labels (Etiquetas)
- **labelLarge**: 14px, Semi-Bold (600), Blanco

## Uso del Tema

### En main.dart
```dart
MaterialApp(
  theme: AppTheme.lightTheme,
  ...
)
```

### Acceder a colores del tema
```dart
// En cualquier widget con BuildContext
Theme.of(context).colorScheme.primary
Theme.of(context).colorScheme.secondary
```

### Acceder a estilos de texto
```dart
Text(
  'Titulo',
  style: Theme.of(context).textTheme.titleLarge,
)
```

## Caracteristicas del Diseno

### Sin Elementos Decorativos
- No usa emojis en el texto
- No incluye caracteres especiales decorativos
- Mantiene un estilo profesional y limpio

### Consistencia
- Todos los componentes usan el mismo esquema de colores
- Espaciado uniforme entre elementos
- Bordes redondeados consistentes

### Accesibilidad
- Contraste adecuado entre texto y fondo
- Tamanos de texto legibles
- Elementos interactivos con tamano minimo recomendado

## Extensibilidad

Para agregar nuevos estilos:

1. Define colores adicionales en la seccion de constantes
2. Crea o modifica ThemeData components
3. Mantiene coherencia con los estilos existentes

## Notas de Diseno

- El tema usa Material 3 (useMaterial3: true)
- Los colores se definen con valores hexadecimales
- La paleta busca un balance profesional y moderno
- Los espaciados siguen multiplos de 4px para consistencia
