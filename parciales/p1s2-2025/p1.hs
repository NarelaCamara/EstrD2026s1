Type Categoria = String deriving Show
Type CaminoJ = [Categoria] deriving Show
Type Producto = String deriving Show

data MVTree = MVT (Heap (Int,Producto) )  (Map Categoria MVTree) deriving Show 

emptyMVTree:: MVTree 
emptyMVTree = MVT ()



Perfecto, he leído el PDF completo. Déjame darte una explicación clara y organizada. 

Created 3 todos

## 📚 EXPLICACIÓN COMPLETA DEL PARCIAL

### **El Problema en Palabras Simples**

Imagina una tienda online como Amazon. Tienes:
- **Categorías jerárquicas**: "Electrónica" → "Computadoras" → "Laptops"
- **Productos en cada categoría**: "Laptop Dell XPS" (con 150 ventas)
- **Necesidad**: Saber rápidamente los TOP productos más vendidos de cualquier categoría, incluyendo los de sus subcategorías

La clave es **eficiencia**: si consultas "top 5 de Electrónica", no puedes recorrer todo el árbol cada vez. Necesitas un heap (cola de prioridad) que mantenga los top productos.

---

## 🔧 TIPOS ALGEBRAICOS (Estructuras de Datos)

Aquí están todos los tipos que se usan:

### **1. Categoria**
```haskell
type Categoria = String
```
**Ejemplos concretos**:
```haskell
"Electrónica"
"Computadoras"
"Laptops"
"Audio"
```

### **2. CaminoJ (Camino Jerárquico)**
```haskell
type CaminoJ = [Categoria]
```
**Ejemplos concretos**:
```haskell
[]                                              -- Raíz (categoría madre sin nombre)
["Electrónica"]                                 -- Una categoría principal
["Electrónica", "Computadoras"]                 -- Subcategoría
["Electrónica", "Computadoras", "Laptops"]      -- Más profundo
```

### **3. Producto**
```haskell
type Producto = String
```
**Ejemplos concretos**:
```haskell
"Laptop Dell XPS"
"Mouse Logitech MX Master"
"Auriculares Sony WH-1000"
```

### **4. MVTree (El corazón del TAD)**
```haskell
data MVTree = MVT (Heap (Int, Producto)) (Map Categoria MVTree)
                 -- vendidos ^             subcategorías
```

**Estructura concreta SIMPLE**:
```haskell
-- Árbol vacío
MVT [] Map.empty

-- Una categoría con 2 productos, sin subcategorías
MVT [(150, "Laptop Dell"), (80, "Mouse Logitech")] Map.empty
    -- El heap contiene tuplas (ventas, producto) ordenadas por ventas DESC

-- Una categoría con subcategorías
MVT [(150, "Laptop Dell"), (80, "Mouse Logitech"), (60, "Auriculares")]
    (Map.fromList
      [ ("Audio", MVT [(60, "Auriculares"), (40, "Altavoces")] Map.empty)
      , ("Periféricos", MVT [(80, "Mouse"), (50, "Teclado")] Map.empty)
      ])
```

**Punto importante**: El heap de la raíz contiene los top productos de **esa categoría Y todas sus subcategorías** combinados. Esto permite búsquedas eficientes.

---

## 📝 LOS 3 EJERCICIOS QUE HAY QUE HACER

### **EJERCICIO 1: `esMasVendido`**

```haskell
esMasVendido :: Producto -> CaminoJ -> Int -> MVTree -> Boolean
```

**¿Qué hace?**: Indica si un producto está entre los **n más vendidos** de **ALGUNA** categoría en el camino.

**Ejemplo**:
```
Árbol:
  Raíz
   ├─ Electrónica
   │   ├─ Computadoras
   │   │   └─ (150, "Laptop Dell"), (80, "Mouse")
   │   └─ Audio
   │       └─ (60, "Auriculares")
   └─ Accesorios
       └─ (70, "Cable USB")

esMasVendido "Mouse" ["Electrónica", "Computadoras"] 1
  → False (Mouse tiene 80, el top 1 es "Laptop Dell" con 150)

esMasVendido "Mouse" ["Electrónica", "Computadoras"] 2
  → True (Mouse es el 2do más vendido)

esMasVendido "Laptop Dell" ["Electrónica"] 3
  → True (está entre los top 3 de Electrónica)
```

**Ayuda dada**: Usa `inits` que genera segmentos iniciales:
```haskell
inits ["A", "B", "C"] = [[], ["A"], ["A", "B"], ["A", "B", "C"]]
```

---

### **EJERCICIO 2: Invariantes de Representación**

**¿Qué es?**: Las reglas que debe cumplir SIEMPRE un MVTree válido.

**Invariantes principales**:
1. **No duplicados en heap**: Para cada producto `p`, solo hay UN elemento `(n, p)` en el heap de cada nodo
2. **Heap ordenado**: El heap está ordenado descendente por número de ventas (max-heap)
3. **Top K consistencia**: El heap de cada nodo contiene los TOP K productos (de esa categoría + subcategorías)
4. **Árbol consistente**: Si un producto está en subcategoría, también está reflejado en el heap de la categoría padre

---

### **EJERCICIO 3: Implementar la Interfaz Completa**

Tienes que implementar 5 funciones:

#### **1. `emptyMVTree :: MVTree`**
```haskell
-- Simplemente un árbol vacío
emptyMVTree = MVT [] Map.empty
```

#### **2. `registrarCategoria :: CaminoJ -> MVTree -> MVTree`**
Agrega categorías al árbol. Si no existen, las crea vacías.

**Ejemplo**:
```
registrarCategoria ["Electrónica", "Computadoras", "Laptops"] emptyMVTree

Resultado: Estructura donde cada categoría existe en su lugar
Electrónica
  └─ Computadoras
      └─ Laptops
```

**Eficiencia**: O(J log SC) - J es la longitud del camino, SC es max subcategorías

#### **3. `subCategoriasDe :: CaminoJ -> MVTree -> [Categoria]`**
Devuelve todas las subcategorías de la última categoría del camino.

**Ejemplo**:
```
subCategoriasDe ["Electrónica"] arbol
  → ["Computadoras", "Audio", "Periféricos"]

subCategoriasDe ["Electrónica", "Computadoras"] arbol
  → ["Laptops", "Desktops"]
```

**Eficiencia**: O(J log SC) - recorrer el camino + acceso al mapa

#### **4. `registrarVenta :: Producto -> CaminoJ -> MVTree -> MVTree`**
Registra una venta de un producto en TODAS las categorías del camino.

**Ejemplo**:
```
registrarVenta "Laptop Dell" ["Electrónica", "Computadoras"] arbol

Efecto:
- Incrementa contador de "Laptop Dell" en Computadoras
- Incrementa contador de "Laptop Dell" en Electrónica (se propaga)
- Reordena heaps en el camino para mantener orden
```

**Eficiencia**: O(J(log SC + P log P))
- J iteraciones (una por categoría en el camino)
- log SC: acceso al map
- P log P: reordenar heap (P productos por categoría)

#### **5. `masVendidosEn :: Int -> CaminoJ -> MVTree -> [Productos]`**
Devuelve los TOP n productos más vendidos de una categoría.

**Ejemplo**:
```
masVendidosEn 3 ["Electrónica"] arbol
  → ["Laptop Dell" (150), "Auriculares Sony" (120), "Mouse Logitech" (100)]

masVendidosEn 2 ["Electrónica", "Computadoras"] arbol
  → ["Laptop Dell" (150), "Monitor LG" (95)]
```

**Eficiencia**: O(J log SC + P log P)
- J log SC: navegar al camino correcto
- P log P: extraer top n del heap

---

## 📊 EJEMPLO VISUAL COMPLETO

Vamos a construir un árbol paso a paso:

```haskell
-- Paso 1: Árbol vacío
arbol0 = emptyMVTree
-- MVT [] Map.empty

-- Paso 2: Registrar categorías
arbol1 = registrarCategoria ["Electrónica", "Computadoras"] arbol0
arbol2 = registrarCategoria ["Electrónica", "Audio"] arbol1
-- Ahora existe la estructura de carpetas

-- Paso 3: Registrar ventas
arbol3 = registrarVenta "Laptop Dell" ["Electrónica", "Computadoras"] arbol2
arbol4 = registrarVenta "Mouse" ["Electrónica", "Computadoras"] arbol3
arbol5 = registrarVenta "Auriculares" ["Electrónica", "Audio"] arbol4

-- Resultado final (estructura simplificada):
-- MVT (heap raíz)
--    [
--      (150, "Laptop Dell"),      -- viene de Computadoras
--      (100, "Auriculares"),      -- viene de Audio
--      (80, "Mouse")              -- viene de Computadoras
--    ]
--    Map:
--      "Computadoras" → MVT [(150, "Laptop"), (80, "Mouse")] Map.empty
--      "Audio" → MVT [(100, "Auriculares")] Map.empty

-- Consultas:
masVendidosEn 2 ["Electrónica"] arbol5
  → ["Laptop Dell", "Auriculares"]

subCategoriasDe ["Electrónica"] arbol5
  → ["Computadoras", "Audio"]

esMasVendido "Mouse" ["Electrónica", "Computadoras"] 1
  → False (top 1 es "Laptop Dell")
```

---

## 📋 RESUMEN: QUÉ HACER AHORA

| Ejercicio | Qué implementar | Dificultad | Dependencias |
|-----------|-----------------|-----------|--------------|
| **1** | `esMasVendido` | Media | `inits` (dada) |
| **2** | Escribir invariantes | Fácil | Análisis teórico |
| **3** | 5 funciones de interfaz | Difícil | Ejercicio 1 & 2 |

**Orden recomendado**:
1. Primero Ejercicio 2 (entender invariantes)
2. Luego Ejercicio 1 (`esMasVendido` - práctica con heap/map)
3. Finalmente Ejercicio 3 (implementar todas las funciones)

¿Quieres que ahora **implementemos el código Haskell** paso a paso? Puedo comenzar completando el archivo p1.hs con las soluciones.