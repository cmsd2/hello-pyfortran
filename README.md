# hellopyfortran

A minimal example of calling Fortran from Python using NumPy's f2py and meson-python.

## Building

Requires a Fortran compiler (e.g. `gfortran`) and Python 3.12+.

```bash
uv pip install .
```
### Building a wheel

```bash
uv build
```

## Running

```bash
uv run --no-project python -m hellopyfortran
```

## How it works

The Fortran subroutine in `src/euclidian_norm.f90` computes the Euclidean norm of two numbers. NumPy's f2py generates a C wrapper at build time, and meson-python compiles everything into a Python extension module that can be imported directly.
