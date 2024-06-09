---
theme: black
highlightTheme: zenburn
width: 960
height: 960
progress: true
slideNumber: false
enableChalkboard: false
enableOverview: false
transition: none
controls: false
center: true
---

<style>
.reveal code.verilog {
  font-size: 1.5em;
  line-height: 1.5em;
}

.reveal code.rust {
  font-size: 1.5em;
  line-height: 1.5em;
}
</style>



## Open-source Verilog Simulation

Notes:

Hola amigos mi nombre es Ciro y esto es JalapenoBytes, un canal centrado en electrónica y programación.

El día de hoy les mostraré cómo utilizar herramientas open-source para comenzar a trabajar con Verilog.

---

### Windows

Notes:

Si trabajan con Windows el proceso de instalación es el siguiente:

---
**Tools**

1. [Scoop](https://scoop.sh/) (Package manager)
2. [Icarus Verilog ](https://bleyer.org/icarus/) (Compiler/Simulator)
3. [GTKWave](https://gtkwave.sourceforge.net/) (Wave viewer)
4. [GNU Make](https://www.gnu.org/software/make/) (Workflow)
5. Any editor

<br><br>
 _GNU Make is optional but recommended_


Notes:

Uno Scoop,
Scoop es un instalador de línea de comandos para Windows. Nos Ayudara a que la instalacion sea mas rapida y agregue automaticamente los ejecutables a las variables de entorno del sistema

Dos Icarus Verilog.
Icarus Verilog es una herramienta open-source que nos permite Compilar y Simular códigos en Verilog.

Tres GTKWave.
GTKWave lo utilizeremos como visualizador las formas de onda.

Cuatro GNUMake
GNU Make, aunque no es absolutamente necesario hará que la experiencia de uso sea mucho más sencilla. Permite automatizar el flujo de trabajo y así evita el escribir una y otra vez los mismo comandos.

Cinco cualquier editor

---

### Installation Manual

[Link in descripton](https://github.com/cirofabianbermudez/jalapenobytes/tree/main/scripts/01_verilog_simulation/codes)

Todos los comandos los podras encontrar en la descripcion del video.

---

**Install Scoop**

- `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

- `Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression`

**Verify**

- `scoop --version`

<br>

 _[Microsoft Terminal](https://github.com/microsoft/terminal) runnings [PowerShell](https://github.com/PowerShell/PowerShell)_

Notes:

Para instalar Scoop abre una terminal de PowerShell y ejecutar los siguientes comandos en orden. Si todo se instaló correctamente `scoop --version` debería mostrar la versión actual de Scoop,

---

**Install Icarus Verilog and GTKWave**

<br>

 - `scoop install iverilog`

**Verify**

 - `iverilog -V`
 - `gtkwave --version`

<br>


 _GTKWave comes included with the Icarus Verilog installation_

Notes:

Para instalar Icarus Verilog, en una terminal de powershell ejecuta el siguiente comando. Afortunamente en Windows GTKWave viene incluido con la instalación de Icarus Verilog. Podemos comprobar que todo se instaló correctamente con los dos últimos comandos.

---

**Install GNU Make (Optional)**

<br>

 - `scoop install make`

**Verify**

 - `make --version`

<br>

A MinGW terminal is needed for full compatibility, you can install one with 

- `scoop install git`

Notes:

Para instalar GNU Make utilizamos el siguiente comando. Podemos comprobar que se instaló correctamente  `make --version`.

Se necesita un terminal MinGW para una completa compatibilidad con make, esta terminal viene incluida en la instalación de git, y si no tienes git puedes instalarlo con el siguiente comando.


---

**Editor**


> "Use whatever editor you feel most comfortable with."

<br>

- Visual Studio Code
- Notepad ++
- Sublime Text
- Neovim

Notes:

Finalmente para el editor, utiliza el editor con lo que te sientas más cómodo. Algunos editores populares son:

- Visual Studio Code
- Notepad ++
- Sublime Text
- Neovim

---

### Combinational Example

Notes:

Veamos un ejemplo de un circuito combinacional sencillo

---

**Boolean expression**

$$
	f(A,B,C) = (\overline{A} \cdot C) + (B \cdot C)
$$

**Verilog code**

```verilog 
module lut(
  input A,B,C,
  output F
);
  assign F = (~A & C) | (B & C);
endmodule
```
`lut.v`

Note:

Tenemos la siguiente expresión booleana de tres variables la cual se puede codificar en Verilog como se muestra en pantalla. 

Ahora necesitamos alguna manera de comprobar que nuestro código sea correcto.

---
  ### Testbench

Notes:

Para esto necesitamos escribir un Testbench.

---
Header

```verilog
`timescale 1ns / 100ps
`include "lut.v"
```

Testbench module

```verilog
module lut_tb();
  // Signals
  // Instantiation (DUT)
  // Stimulus
endmodule
```
`lut_tb.v`

DUT (Device Under Test)

Notes:

Esta es la estructura básica de un Testbench, en el encabezado declaramos la escala de tiempo de nuestra simulación y después incluimos nuestro diseño en Verilog.

Después del encabezado declaramos un módulo y dentro todo el código necesario para comprobar el funcionamiento del diseño.

Esto incluye señales, instanciación del diseño bajo prueba o comúnmente llamado DUT, y finalmente los estímulos

---

### Source code

[Link in descripton](https://github.com/cirofabianbermudez/jalapenobytes/tree/main/scripts/01_verilog_simulation/codes)

Notes:

El código fuente lo podrán encontrar en la descripción del video.

---

**Compilation**

`iverilog -o lut_tb.vvp  lut_tb.v`

**Simulation**

`vvp lut_tb.vvp`

**Wave Viewer**

`gtkwave lut_tv.vcd`

Notes:

Para compilar utilizamos el comando `iverilog`

Para simular el comando `vvp`

Y para abrir la forma de onda el comando `gtkwave`


---

**Compilation**

`iverilog lut_tb.v -o lut_tb.vvp`

**Flags**

`-o <path>`  specify the output file. 

**Output**

No errors means you are good

Notes:

Para compilar abrimos una terminal MinGW en la carpeta en la que estamos trabajando y compilamos con el comando `iverilog`, la bandera `-o` indica el nombre del archivo de salida y el ultimo argumento el nombre de nuestro diseño.

---

**Simulation**

`vvp lut_tb.vvp`

**Output**

`lut_tb.vcd`

```markdown
VCD info: dumpfile lut_tb.vcd opened for output.
Test completed
lut_tb.v:46: $finish called at 1600 (100ps)
```

Notes:

Para simular utilizamos el comando `vvp` ,  Se genera un archivo de salida con terminacion `.vcd` y deberiamos ver la siguiente en consola. 

---

**Wave Viewer**

`gtkwave lut_tv.vcd`

**Output**

![[01_viewer.png  | 1000]]

Notes:

Finalmente con el comando `gtkwave` podemos abrir el visualizador de onda

---

**It's always a good idea to save your work**

![[01_viewer2.png | |1000 ]]

`sim.gtkw`


Notes:

No olvides que siempre es una buena idea guardar tus simulaciones. 

---

### Use make 

Make your life easier

Notes:

Ahora pasamos a la parte de automatizacion
Has tu vida mas facil, utiliza un archivo make

---

`make help`

```markdown
============================================================

---------------------------- Targets -----------------------
  all          : Runs compilation and simulation
  compile      : Runs compilation
  sim          : Runs simulation
  view         : Runs viewer
  clean        : Removes generated files

============================================================
```

Notes: 

Con un archivo Makefile no es necesario tener que aprendernos todos los comandos, solo hay que modificar ligeramente el archivo de configuracion y esta es una de las maneras mas comunes de trabajar en proyectos mas grandes.

---


**Compilation**

`make compile`

**Simulation**

`make sim`

**Wave Viewer**

`make view`

Notes:

Utiliza make compile para compilar

make sim para simular 

y make view para ver la forma de onda

Estos son los únicos comandos que tienes que recordar

---

## Demostration

note: ahora pasamos a la parte de demostracion

---

## Special thanks

- [youtube/@NoBoilerplate](https://www.youtube.com/@NoBoilerplate)
- [youtube/@nicolevdh](https://www.youtube.com/@nicolevdh)

notes:

Un saludo especial a Nicole van der Hoeven y a No Boilerplate por sus videos sobre como hacer presentadores en Obsidian y su maravilloso formato para presentar.

---

![[01_jalapenobytes_logo.svg | 400]]

# Thank you

[youtube/@jalapenobytes](https://www.youtube.com/@jalapenobytes)


notes:

Se nos acabo el tiempo, muchas gracias por ver este video y espero les ayude en sus futuros proyectos. Hasta luego.
