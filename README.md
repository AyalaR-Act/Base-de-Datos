## Base de Datos Surectro SA de CV

Surectro es una sociedad anónima dedicada a la venta de productos electrónicos para el hogar y oficinas.

Surectro SA de CV ***es una empresa ficticia para objeto de implementación de sistema de base de datos***.

Se hará uso del _gestor de base de datos MySQL._
# Sistema de Ventas
1. Se elaborará una base de datos para apoyar a la gestión de un sistema de ventas
2. Identificar las entidades y atributos
3. Construcción del diagrama entidad relación
4. Insertar Registros
5. Consultas 

# Entidades y atributos
La empresa necesita llevar un control de proveedores, clientes, productos y ventas.
Se presentan extractos de ejemplo de las entidades de la empesa

###Tabla de Proveedores
| id_proveedor | Nombre      | Dirección          | Teléfono    | Página web        |
|--------------|-------------|--------------------|-------------|-------------------|
| 1            | Sandin | Panamá, 12, Monterrey, NL        | 123-4567890 | [www.SandinMx.com](http://www.proveedor1.com) |
| 2            | Radio Shark | Polanco, 41, CdMex       | 456-1234567 | [www.Radiosharkmx.com](http://www.proveedor2.com) |

###Tabla de Clientes
| id_cliente | nombre      | dirección          | teléfono    |
|------------|-------------|--------------------|-------------|
| 1548        | Jaime   | 5 de Mayo, Ensenada, México      | 123-4567890 |
| 1549        | Katherine   | Lilias, Mixconcuac, Sonora        | 456-1234567 |

###Tabla de Productos
| id_producto | nombre           | precio  | stock |
|-------------|------------------|---------|-------|
| 778564515          | Televisión Smart 32 LG       | 5800.00  | 12   |
| 778964521          | Ventiador shoter      | 1500.50  | 20    |
| 756681231         | Tostador Hamilton       | 2700.80  | 4    |

### Tabla de Categoria de Productos
| id  | nombre      | Descripción          |
|-----|-------------|----------------------|
| 2214   | Cocina |  Descripción 1    |
| 2215   | Jardín | Descripción 2        |
| 2216   | Entretenimiento | Descripción 3        |

### Tabla de Ventas
| id  | Fecha       | Cliente     | Descuento |
|-----|-------------|-------------|-----------|
| 1114   | 2024-03-22  | Damian  | 10%       |
| 1115   | 2024-03-23  | Rodrigo   |       |
| 1116   | 2024-03-24  | Esteban   | 5%        |

# Construcción del Diagrama Entidad Relación
**Requerimientos**
La empresa necesita llevar un control de proveedores, clientes, productos y ventas.
- Un proveedor tiene un id único, nombre, dirección, teléfono y página web.
- Un cliente tiene también un id único, nombre, dirección, teléfonos.
- La dirección se entiende por calle, número, colonia y ciudad _algunos valores son celdas obligatorias_
- Un producto contiene un id único, nombre, precio actual, stock y deberá estar asociado a su respectivo proveedor
- Además los productos se organizan en categorias y casa producto sólo va a una categoria dicha categoria contiene un id, nombre y descripción.

Para llevar un control contable se registrarán la información de la venta con un id, fecha

### Construcción de la base de datos
Creación de la base de datos y tabla
- Extracto del código

```sql
create database Gestion_Surectro;

use Gestion_surectro;

Create table categorias (
id int primary key not null,
nombre varchar(45) not null,
descripcion varchar(45)
);
```
###Identificamos las relaciones entre las entidades y construimos el diagrama

![Visualización del Diagrama](https://i.imgur.com/9nFIgof.png)
