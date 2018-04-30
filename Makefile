build:
	make -C loader/
	make -C stage0/
	make -C server/
clean:
	make -C loader/ clean
	make -C stage0/ clean
	make -C server/ clean

test: clean build
	-loader/loader stage0/stage0.bin