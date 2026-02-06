#!/bin/bash

uv run python -m numpy.f2py --overwrite-signature -h src/euclidian_norm.pyf -m euclidian_norm src/euclidian_norm.f90
