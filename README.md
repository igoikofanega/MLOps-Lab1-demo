# MLOps-Lab1 - Image Processing Application

![CI Pipeline](https://github.com/igoikofanega/MLOps-Lab1-Demo/actions/workflows/CI.yml/badge.svg)

## Descripción

Aplicación de procesamiento de imágenes desarrollada para el Lab1 de MLOps. La aplicación permite realizar operaciones básicas sobre imágenes como predicción de clase (aleatoria), redimensionado, conversión a escala de grises y obtención de información.

## Estructura del Proyecto

```
MLOps-Lab1/
├── .github/
│   └── workflows/
│       └── CI.yml          # Pipeline de CI/CD
├── mylib/
│   ├── __init__.py
│   └── operations.py       # Lógica de procesamiento
├── cli/
│   ├── __init__.py
│   └── cli.py              # Interfaz de línea de comandos
├── api/
│   ├── __init__.py
│   └── api.py              # API con FastAPI
├── templates/
│   └── home.html           # Página principal de la API
├── tests/
│   ├── __init__.py
│   ├── test_operations.py  # Tests de la lógica
│   ├── test_cli.py         # Tests del CLI
│   └── test_api.py         # Tests de la API
├── Makefile                # Comandos automatizados
├── pyproject.toml          # Configuración del proyecto
└── README.md
```

## Instalación

### Requisitos previos
- Python 3.12 o superior
- uv (gestor de paquetes)

### Pasos de instalación

1. Clonar el repositorio:
```bash
git clone https://github.com/YOUR_USERNAME/MLOps-Lab1.git
cd MLOps-Lab1
```

2. Crear y activar el entorno virtual:
```bash
uv init
uv sync
source .venv/bin/activate  # En Linux/Mac
# o
.venv\Scripts\activate  # En Windows
```

3. Instalar dependencias:
```bash
make install
```

## Uso

### Command Line Interface (CLI)

#### Predecir clase de una imagen:
```bash
uv run python -m cli.cli predict /home/alumno/Desktop/datos/inigo.goikoetxea/MLOps/imagen.jpg
```

#### Redimensionar una imagen:
```bash
uv run python -m cli.cli resize path/to/image.jpg 200 200
uv run python -m cli.cli resize /home/alumno/Desktop/datos/inigo.goikoetxea/MLOps/imagen.jpg 200 200 --output resized.jpg
```

#### Convertir a escala de grises:
```bash
uv run python -m cli.cli grayscale path/to/image.jpg
uv run python -m cli.cli grayscale /home/alumno/Desktop/datos/inigo.goikoetxea/MLOps/imagen.jpg --output gray.jpg
```

#### Obtener información de una imagen:
```bash
uv run python -m cli.cli info /home/alumno/Desktop/datos/inigo.goikoetxea/MLOps/imagen.jpg
```

### API (FastAPI)

#### Iniciar el servidor:
```bash
uv run python -m api.api
```

La API estará disponible en `http://localhost:8000`

#### Endpoints disponibles:

- **GET /** - Página principal
- **POST /predict** - Predice la clase de una imagen
  - Parámetros: `file` (imagen)
- **POST /resize** - Redimensiona una imagen
  - Parámetros: `file` (imagen), `width` (int), `height` (int)
- **POST /grayscale** - Convierte una imagen a escala de grises
  - Parámetros: `file` (imagen)
- **POST /info** - Obtiene información de una imagen
  - Parámetros: `file` (imagen)

#### Documentación interactiva:
Una vez iniciado el servidor, visita `http://localhost:8000/docs` para ver la documentación interactiva de Swagger UI.

## Desarrollo

### Makefile - Comandos disponibles

```bash
make install    # Instalar todas las dependencias
make format     # Formatear el código con Black
make lint       # Analizar el código con Pylint
make test       # Ejecutar los tests con pytest
make refactor   # Formatear y analizar (format + lint)
make all        # Ejecutar todo (install + format + lint + test)
make clean      # Limpiar archivos temporales
```

### Testing

Ejecutar todos los tests:
```bash
make test
```

Ejecutar tests específicos:
```bash
uv run pytest tests/test_operations.py -v
uv run pytest tests/test_cli.py -v
uv run pytest tests/test_api.py -v
```

Ver cobertura de tests:
```bash
uv run pytest tests/ --cov=mylib --cov=cli --cov=api --cov-report=html
```

## CI/CD Pipeline

El proyecto utiliza GitHub Actions para ejecutar automáticamente:

1. **Format**: Formateo del código con Black
2. **Lint**: Análisis estático con Pylint
3. **Test**: Ejecución de tests con pytest

El pipeline se ejecuta en cada `push` y `pull_request` a la rama `main`.

## Clases de Predicción

Las clases disponibles para la predicción aleatoria son:
- perro
- gato
- coche
- avión
- barco
- bicicleta
- persona
- casa

## Tecnologías Utilizadas

- **Python 3.12**
- **Pillow (PIL)**: Procesamiento de imágenes
- **Click**: Creación del CLI
- **FastAPI**: Framework para la API
- **Uvicorn**: Servidor ASGI
- **Pytest**: Framework de testing
- **Black**: Formateo de código
- **Pylint**: Análisis estático
- **uv**: Gestor de paquetes y entornos virtuales

## Autor

[Tu Nombre] - Universidad Pública de Navarra

## Licencia

MIT License
