# Práctica 4 - Cámara para Sistema Planetario

![version](https://img.shields.io/badge/version-1.0-green)

## Memoria

### Autor

Kevin David Rosales Santana - <kevin.rosales101@alu.ulpgc.es>

### Índice

1. [Introducción](#1-introducción)
2. [Muestra del resultado](#2-muestra-del-resultado)
3. [Descripción del trabajo realizado](#3-descripción-del-trabajo-realizado)

   3.1 [Estructura de ficheros](#31-estructura-de-ficheros)
   
   3.2 [Decisiones en el desarrollo](#32-decisiones-en-el-desarrollo)
   
      - 3.2.1 [Cambio entre vista general/nave](#321-cambio-entre-vista-general/nave)
      - 3.2.2 [Rotación de la cámara](#322-rotación-de-la-cámara)
      - 3.2.3 [Zoom de la cámara (movimiento)](#323-zoom-de-la-cámara-(movimiento))
      - 3.2.4 [Vista de la cámara](#324-vista-de-la-cámara)
      - 3.2.5 [Límites en el movimiento](#325-límites-en-el-movimiento)
   
4. [Conclusión](#4-conclusión)
5. [Ejecución del Proyecto](#5-ejecución-del-proyecto)
6. [Referencias y herramientas utilizadas](#6-referencias-y-herramientas-utilizadas)

### 1. Introducción

En la presente práctica se pedía implementar **una cámara para el sistema planetario** de la [práctica anterior (ver referencia 9)](#6-referencias-y-herramientas-utilizadas) en movimiento, sirviendo para el aprendizaje de *Processing*, el cual tiene como objetivo facilitar los desarrollos con fines creativos en entornos digitales. 

Dicho **sistema planetario** debía incluir una estrella, (al menos) cinco planetas y alguna luna, integrando primitivas 3D, texto e imágenes (como por ejemplo, una imagen de fondo). En este caso se parte de un sistema planetario con:

- 1 estrella, 8 planetas y 4 lunas con rotaciones lógicas.
- Texturas e imagen de fondo. 
- Título e información de control en el menú.
- Nombre de sistema planetario, de estrella y de los planetas aleatorio.
- Cohete espacial (sin movimiento propio) apuntando a la estrella.
- Movimiento del sistema planetario con el ratón.

En este repositorio se tiene la implementación de la cámara pedida, que incluye:

- Posibilidad de cambiar entre vista general ([de la anterior práctica (ver referencia 9)](#6-referencias-y-herramientas-utilizadas)) y cámara de la nave.
- Cámara en primera persona de la nave que incluye:
  - Capacidad de rotación.
  - Capacidad de realizar zoom (aportando movimiento para **acercarse** o **alejarse**).
  - Capacidad de modificar la vista de la cámara.
- Límites en el movimiento para evitar fallos o alejarse en exceso del sistema planetario.

### 2. Muestra del resultado

<div align="center">
   <img src="Practica4/media/animation.gif" alt="animation"></img>
   <p>Figura 1: Muestra del resultado</p>
</div>

**Nota importante:** los elementos que pertenecen al sistema planetario no realizan rotaciones tan rápidas como las que se pueden observar en la *Figura 1*. Esto se debe a la representación que proporciona el *.gif*.

### 3. Descripción del trabajo realizado

#### 3.1 Estructura de ficheros

Para realizar este trabajo, se han creado estos cuatro ficheros (presentes en la carpeta [Practica4](Practica4/)):

| Fichero          | Descripción                                                  |
| :--------------- | :----------------------------------------------------------- |
| *Practica4.pde*  | Fichero encargado de la **interfaz gráfica** del sistema planetario. Además, al ser el fichero principal, gestiona el `setup()` y el `draw()` del proyecto haciendo uso del resto de ficheros de este. Es el encargado de cambiar entre [la vista general y la vista de la nave](#321-cambio-entre-vista-general/nave) en primera persona. Por último, se encarga de escuchar los eventos de teclado y ratón. |
| *Controller.pde* | Clase **controlador**. Se encarga de crear la estrella, los planetas, las lunas, la nave y de dibujar dichos elementos. También administra la lógica de rotaciones del sistema. Se encarga además de gestionar [la rotación]((#322-rotación-de-la-cámara)), [el zoom](#323-zoom-de-la-cámara-(movimiento)) y [la vista de la cámara](#324-vista-de-la-cámara). También se asegura de [gestionar límites](#325-límites-en-el-movimiento) para que la nave no se aleje demasiado del sistema planetario. |
| *MySphere.pde*   | Clase **modelo** que representa a un objeto *Esfera*. Dicho objeto contiene principalmente el *PShape* de la esfera (independientemente de ser la estrella, los planetas o la luna), entre otros. También contiene la lógica de generación de nombres aleatorios. |
| *MyShip.pde*     | Clase **modelo** que representa a un objeto *Nave Espacial*. Dicho objeto contiene el *PShape* utilizado para representar la nave espacial. Además, como la cámara está situada en dicha nave espacial, contiene todos los datos necesarios para tratar esta. |

<div align="center">
   <p>Tabla 1: Estructura de ficheros</p>
</div>

#### 3.2 Decisiones en el desarrollo

A la hora de realizar **la cámara** del sistema planetario se ha tenido que tomar una serie de decisiones respecto al desarrollo del proyecto. A continuación, se listarán dichas decisiones:

##### 3.2.1 Cambio entre vista general/nave



##### 3.2.2 Rotación de la cámara



##### 3.2.3 Zoom de la cámara (movimiento)



##### 3.2.4 Vista de la cámara




##### 3.2.5 Límites en el movimiento




##### 3.2.6 Generación de nombres



### 4. Conclusión

Esta práctica ha servido una vez más como aprendizaje para *Processing* y, además, se ha tratado de una práctica muy entretenida donde se ha tenido contacto con una herramienta que sirve como herramienta para aprender el funcionamiento de las cámaras en este tipo de programas informáticos.

Además, realizar este tipo de trabajos da una idea lo difícil que puede resultar entender el sistema que envuelve a este tipo de mecanismos. En concreto, *processing* propone la manera explicada previamente, es decir, el uso de una posición de observador, un centro de la escena a visualizar y una vertical.

Por último, se debe recalcar que gracias a esta cuarta práctica de *Creando Interfaces de Usuario*, se ha podido continuar **estudiando el manejo del *PShape***, obteniendo más conocimiento sobre el tratamiento de objetos tridimensionales gracias a la cámara.

### 5. Ejecución del proyecto

Para ejecutar este proyecto, es necesario:

- Tener instalado [Processing (Referencia 3)](#6-referencias-y-herramientas-utilizadas)

Para ejecutar el proyecto, tan solo se debe abrir el fichero [Practica4.pde](Practica4/Practica4.pde) y darle al botón de ejecutar.

**Nota importante:** es posible que debido a la cantidad de texturas y rotaciones en un espacio tridimensional la carga inicial sea algo elevada (en torno a los 10 segundos en mi caso).

### 6. Referencias y herramientas utilizadas

- [1] Modesto Fernando Castrillón Santana, José Daniel Hernández Sosa. [Creando Interfaces de Usuario. Guion de Prácticas](https://cv-aep.ulpgc.es/cv/ulpgctp20/pluginfile.php/126724/mod_resource/content/25/CIU_Pr_cticas.pdf)
- [2] Processing Foundation. [Processing Reference.](https://processing.org/reference/)
- [3] Processing Foundation. [Processing Download.](https://processing.org/download/)
- [4] Extrapixel. [GifAnimation Processing Library.](https://github.com/extrapixel/gif-animation)
- [5] TurboSquid, Inc. [Free3D](https://free3d.com/)
- [6] Textures for Planets. [Textures for Planets](http://www.texturesforplanets.com/)
- [7] INOVE. [Solar System Scope](https://www.solarsystemscope.com/)
- [8] Stéphane Lyver. [Compressor](https://compressor.io/)
- [9] Kevin David Rosales Santana. [Repositorio de Práctica 3: Sistema Planetario](https://github.com/kevinrosalesdev/CIU-Practica3)
