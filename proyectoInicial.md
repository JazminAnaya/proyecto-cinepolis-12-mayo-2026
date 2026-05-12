actua como un administrador de base de datos, proyecto Cinepolis, que entidades se necesitan para su gestion

Como DBA del proyecto Cinépolis, aquí están las entidades clave que necesitaría para gestionar una cadena de cines:Aquí el resumen por módulo funcional:

<img width="632" height="657" alt="image" src="https://github.com/user-attachments/assets/a1c531c6-69c1-463c-99cd-897acb9eac61" />

**Núcleo operativo**

- `COMPLEJO` — cada sucursal física de Cinépolis (ciudad, dirección, capacidad de salas)
- `SALA` — cada sala dentro de un complejo, con tipo (IMAX, 4DX, VIP, regular) y capacidad
- `ASIENTO` — numeración exacta por sala, tipo de asiento y disponibilidad en tiempo real
- `PELICULA` — catálogo de títulos con clasificación, duración, formato e idioma
- `FUNCION` — la combinación de sala + película + fecha/hora + precio + formato (doblada, subtitulada, etc.)

**Ventas y ticketing**

- `CLIENTE` — registro del usuario, incluyendo puntos de lealtad (programa Cinépolis Club)
- `BOLETO` — cada ticket emitido, vinculado a función, asiento y cliente específico
- `TRANSACCION` — el pago en sí (puede cubrir varios boletos, incluye método de pago)

**Operaciones internas**

- `EMPLEADO` — personal por complejo con puesto y turno asignado
- `TURNO` — registro de horarios de trabajo por área (taquilla, dulcería, proyección)

**Catálogos auxiliares**

- `GENERO` y `PELICULA_GENERO` — relación muchos a muchos para clasificación por géneros

Entidades adicionales que podría añadir dependiendo del alcance del proyecto: `DULCERIA` (inventario de alimentos), `PROMOCION` (descuentos y combos), `DISTRIBUIDOR` (proveedores de películas), `RESEÑA` (calificaciones de usuarios) y `REPORTE_CAJA` (corte de caja por turno). ¿Quieres que profundice en algún módulo específico o que diseñe las relaciones con mayor detalle?
