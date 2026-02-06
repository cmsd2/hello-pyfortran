project('hellopyfortran', 'c', 'fortran',
  version: '0.1.0',
)

py = import('python').find_installation(pure: false)

incdir_numpy = run_command(py,
  ['-c', 'import numpy; print(numpy.get_include())'],
  check: true,
).stdout().strip()

incdir_f2py = run_command(py,
  ['-c', 'import numpy.f2py; print(numpy.f2py.get_include())'],
  check: true,
).stdout().strip()

fortranobject_c = incdir_f2py / 'fortranobject.c'

# Generate the f2py C wrapper from the Fortran source
euclidian_norm_f2py = custom_target(
  'euclidian_norm_f2py',
  input: 'src/euclidian_norm.f90',
  output: ['euclidian_normmodule.c', 'euclidian_norm-f2pywrappers.f'],
  command: [py, '-m', 'numpy.f2py', '@INPUT@', '-m', 'euclidian_norm', '--lower'],
)

# Build the Python extension module
py.extension_module(
  'euclidian_norm',
  ['src/euclidian_norm.f90', fortranobject_c, euclidian_norm_f2py],
  c_args: ['-I' + incdir_numpy, '-I' + incdir_f2py],
  install: true,
  subdir: 'hellopyfortran',
)

# Install the Python package files
py.install_sources(
  'hellopyfortran/__init__.py',
  'hellopyfortran/main.py',
  subdir: 'hellopyfortran',
)
