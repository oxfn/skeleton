# Skeleton Makefile

.DEFAULT: dist 

SHLIBSRC = shlib/core \
           shlib/log 
SHLIBDIST = shlib/dist/shlib
SHLIBTEST = shlib/tests/all

$(SHLIBDIST): $(SHLIBSRC)
	cat $(SHLIBSRC) | sed \
		-e '/^[[:blank:]]*\(#.*\)*$$/d'\
		> $(SHLIBDIST)

dist: $(SHLIBDIST)

test: $(SHLIBDIST) $(SHLIBTEST)
	shlib/tests/all

install: dist test scripts/install
	scripts/install

clean:
	[ -e $(SHLIBDIST) ] && rm $(SHLIBDIST) || echo

