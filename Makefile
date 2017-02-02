BGB=bgb
RGBASM=rgbasm
RGBLINK=rgblink
RGBFIX=rgbfix

build: rgbasm rgblink rgbfix
run: bgb
build-and-run: build run

rgbasm:
	@mkdir -p build
	$(RGBASM) -v -o build/pghg.o src/main.asm

rgblink:
	@mkdir -p bin
	$(RGBLINK) -m bin/pghg.map -n bin/pghg.sym -o bin/pghg.gb build/pghg.o

rgbfix:
	$(RGBFIX) -v -t "PGHG" -p 0 bin/pghg.gb

bgb:
	$(BGB) bin/pghg.gb

clean:
	rm -rf bin/
	rm -rf build/
