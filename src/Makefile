TARGET = animals

SOURCES = animal cat dog mouse main
PKGS = gee-0.8

CFLAGS = -w -I. `pkg-config --cflags ${PKGS} glib-2.0 gobject-2.0`
LDFLAGS = `pkg-config --libs ${PKGS} glib-2.0 gobject-2.0`
VALAOPTS = --vapidir="." $(addprefix --pkg ,${PKGS})

VALAC = valac
CC = gcc
RM = rm -vf

ifeq ($(OS),Windows_NT)
    EXEEXT = .exe
else
    EXEEXT = 
endif

all: ${TARGET}${EXEEXT}

clean:
	@${RM} ${TARGET}${EXEEXT} *.o *.c *.h *.H *.vapi

%.c: %.vala
	@echo 'VALAC $<'
	@${VALAC} -C $< ${VALAOPTS} $(addprefix --pkg ,$(shell echo ${SOURCES} | sed -e 's~$(<:.vala=)\b.*~~')) \
        --internal-vapi=$(<:.vala=.vapi) --header=$(<:.vala=.H) --internal-header=$(<:.vala=.h)

%.o:%.c
	@echo 'CC    $<'
	@${CC} -o $@ -c $< ${CFLAGS}

.SECONDARY: $(addsuffix .c,${SOURCES})

${TARGET}${EXEEXT}: $(addsuffix .o,${SOURCES})
	@echo 'LD    $@'
	@${CC} -o $@ $^ ${LDFLAGS}
