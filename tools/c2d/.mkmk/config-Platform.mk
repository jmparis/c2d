ifeq ($(OS),Windows_NT)
CFLAGS_WIN	?=
LDLIBS_WIN	?=
CFLAGS		+=	$(CFLAGS_WIN)
LDLIBS		+=	$(LDLIBS_WIN)
else
CFLAGS_LIN	?=
LDLIBS_LIN	?=	-lm
CFLAGS		+=	$(CFLAGS_LIN)
LDLIBS		+=	$(LDLIBS_LIN)
endif
