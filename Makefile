# Skeleton Makefile

.DEFAULT: dist 

SHLIBSRC = shlib/core \
		   shlib/log \
		   shlib/net
SHLIBDIST = shlib/dist/shlib
SHLIBTEST = shlib/tests/all

$(SHLIBDIST): $(SHLIBSRC)
	cat $(SHLIBSRC) |sed '/^\s*\(#.*\)\?$$/d' > $(SHLIBDIST)

dist: $(SHLIBDIST)

test: $(SHLIBDIST) $(SHLIBTEST)
	shlib/tests/all

install: scripts/install
	scripts/install

clean:
	[ -e $(SHLIBDIST) ] && rm $(SHLIBDIST) || echo

