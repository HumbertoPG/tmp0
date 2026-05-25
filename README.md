# Compilador incremental: 14 versiones

Este paquete fue generado a partir de dos ZIPs:

- `archivos_luciano(3).zip`: tomado como **versión 01 inicial**. Solo se copiaron los archivos fuente reales `analisis.py` y `arbol.py`; se ignoraron los metadatos `__MACOSX/._*` porque no forman parte del código.
- `compilador_completoV1(2).zip`: tomado como **versión 14 final**. La carpeta `version_14_final/` fue extraída directamente del ZIP final y no se modificó.

## Criterio de progresión

Cada versión intermedia introduce un concepto pequeño, manteniendo coherencia entre `analisis.py`, `arbol.py` y, desde la versión 10, `main.py` y los ejemplos de `codigo_c/`.

1. `version_01_inicial`: código base original.
2. `version_02_intermedia_01`: corrige múltiples sentencias, variables en expresiones y `load` en LLVM.
3. `version_03_intermedia_02`: refactoriza el AST hacia `Program -> FunctionDecl -> Block` y reemplaza listas enlazadas por listas Python.
4. `version_04_intermedia_03`: agrega palabras reservadas y regla `Type` para `int`, `float` y `void`.
5. `version_05_intermedia_04`: soporta múltiples funciones y parámetros.
6. `version_06_intermedia_05`: agrega `return` y operadores `+`, `-`, `*`, `/`.
7. `version_07_intermedia_06`: agrega literales `float` y conversiones entre `int` y `float`.
8. `version_08_intermedia_07`: agrega comparaciones e `if/else`.
9. `version_09_intermedia_08`: agrega ciclo `while`.
10. `version_10_intermedia_09`: agrega llamadas, `printf`, strings, `main.py` y primeros ejemplos `.c`.
11. `version_11_intermedia_10`: agrega ciclo `for`.
12. `version_12_intermedia_11`: agrega ciclo `do/while`.
13. `version_13_intermedia_12`: agrega `switch/case/default` y todos los ejemplos finales.
14. `version_14_final`: versión final exacta extraída del ZIP final.

## Notas de ingeniería

- Las versiones intermedias contienen comentarios pedagógicos en las zonas donde se introduce cada cambio.
- No se agregaron archivos de explicación dentro de `version_14_final` para no alterar la entrega final.
- Los archivos `.pyc` y `__pycache__` solo aparecen en `version_14_final` porque ya venían en el ZIP final.
- Las carpetas `codigo_c/`, `codigo_ll/` y `main.py` aparecen hasta que el compilador puede procesar archivos por carpeta, igual que la arquitectura final.
# tmp0
