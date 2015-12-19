TARGET = animals

SOURCES = animal cat dog mouse main
PKGS = gee-0.8

CFLAGS = -w -I. `pkg-config --cflags gee-0.8 glib-2.0 gobject-2.0`
LDFLAGS = `pkg-config --libs gee-0.8 glib-2.0 gobject-2.0`
VALAOPTS = --vapidir="." $(addprefix --pkg ,${PKGS})

VALAC = valac
CC = cc
RM = rm -vf

all: ${TARGET}

clean:
	@${RM} ${TARGET} *.o *.c *.h *.H *.vapi

%.c: %.vala
	@echo 'VALAC $<'
	@${VALAC} -C $< ${VALAOPTS} $(addprefix --pkg ,$(shell echo ${SOURCES} | sed -e 's~$(<:.vala=)\b.*~~')) \
        --internal-vapi=$(<:.vala=.vapi) --header=$(<:.vala=.H) --internal-header=$(<:.vala=.h)

%.o:%.c
	@echo 'CC    $<'
	@${CC} -o $@ -c $< ${CFLAGS}

.SECONDARY: $(addsuffix .c,${SOURCES})

animals: $(addsuffix .o,${SOURCES})
	@echo 'LD    $@'
	@${CC} -o $@ $^ ${LDFLAGS}
