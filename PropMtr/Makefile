# This condition assumes CROSS_COMPILE is defined in
# ~/yocto-varsom33/SDK/environment-setup-cortexa8hf-neon-linux
# ifdef CROSS_COMPILE
# CPPFLAGS+=-I/opt/linkeng/am335x/include
# LIBDIR=/opt/linkeng/am335x/lib
# else
# LIBDIR=/usr/local/lib
# endif
include /usr/local/share/monarch/appgen.mk

CXXFLAGS+=-g -Wall -std=c++11
LDFLAGS=$(AG_LDFLAGS) -ldasio -lnl -lpthread

.PHONY : all
all : PropMtr
OBJ = *.stackdump *.o
# TGT = $(tgt):/home/flight

PROPMTROBJ = PropMtr.o PropMtroui.o pmc.o
OBJ += PropMtr PropMtroui.cc
DIST += PropMtr
PropMtr : $(PROPMTROBJ) $(AG_LIBDIR)/libdasio.a
	$(CXX) -o PropMtr $(CXXFLAGS) $(PROPMTROBJ) $(LDFLAGS)
PropMtr.o : PropMtr.cc
PropMtroui.o : PropMtroui.cc
PropMtroui.cc : PropMtr.oui
	oui -o PropMtroui.cc $<

clean :
	rm -f $(OBJ)

#distribution : $(DIST)
#	scp $(DIST) $(TGT)
