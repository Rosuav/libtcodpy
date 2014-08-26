# cython: language_level=3
# distutils: language = c++
# distutils: libraries = tcod tcodxx
# distutils: include_dirs = ../libtcod-1.6.0/include
# distutils: library_dirs = ../libtcod-1.6.0
# distutils: extra_compile_args = -fpermissive

cdef enum TCOD_event_t:
	TCOD_EVENT_NONE=0,
	TCOD_EVENT_KEY_PRESS=1,
	TCOD_EVENT_KEY_RELEASE=2,
	TCOD_EVENT_KEY=TCOD_EVENT_KEY_PRESS|TCOD_EVENT_KEY_RELEASE,
	TCOD_EVENT_MOUSE_MOVE=4,
	TCOD_EVENT_MOUSE_PRESS=8,
	TCOD_EVENT_MOUSE_RELEASE=16,
	TCOD_EVENT_MOUSE=TCOD_EVENT_MOUSE_MOVE|TCOD_EVENT_MOUSE_PRESS|TCOD_EVENT_MOUSE_RELEASE,
	TCOD_EVENT_FINGER_MOVE=32,
	TCOD_EVENT_FINGER_PRESS=64,
	TCOD_EVENT_FINGER_RELEASE=128,
	TCOD_EVENT_FINGER=TCOD_EVENT_FINGER_MOVE|TCOD_EVENT_FINGER_PRESS|TCOD_EVENT_FINGER_RELEASE,
	TCOD_EVENT_ANY=TCOD_EVENT_KEY|TCOD_EVENT_MOUSE|TCOD_EVENT_FINGER,
cdef extern from "libtcod.hpp" namespace "TCODSystem":
	cdef void checkForEvent(int eventMask, void *key, void *mouse)
cdef extern from "libtcod.hpp":
	cdef cppclass TCODConsole:
		void clear()
		void putChar(int,int,int)
cdef extern from "libtcod.hpp" namespace "TCODConsole":
	cdef void initRoot(int w, int h, const char * title, int fullscreen, int renderer)
	cdef int isWindowClosed()
	cdef void flush()
	cdef TCODConsole *root

def say_hello():
	initRoot(80,50,"libtcod C++ tutorial",0,2)
	while not isWindowClosed():
		checkForEvent(TCOD_EVENT_KEY_PRESS,NULL,NULL)
		root.clear()
		root.putChar(40,25,b'@')
		flush()
