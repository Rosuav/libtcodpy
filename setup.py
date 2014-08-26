from distutils.core import setup
from Cython.Build import cythonize

setup(
	name = 'Python 3 bindings for libtcod',
	ext_modules = cythonize("libtcodpy.pyx"),
)