build: rgbasm rgblink rgbfix
run: bgb
build-and-run: build run

rgbasm:
	@mkdir -p build
	rgbasm -v -o build/pghg.o src/main.asm

rgblink:
	@mkdir -p bin
	rgblink -m bin/pghg.map -n bin/pghg.sym -o bin/pghg.gb build/pghg.o

rgbfix:
	rgbfix -v -t "PGHG" -p 0 bin/pghg.gb

bgb:
	bgb bin/pghg.gb

clean:
	rm -rf bin/
	rm -rf build/
