default: cat


.PHONY: clean


cat: cat.hs
	ghc $@


clean:
	rm cat *.hi *.o
