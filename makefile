btry: btry.o
	objcopy -O binary $< $@
	chmod +x $@

btry.o: btry.s
	as -mx86-used-note=no $< -o $@

.PHONY: clean
clean:
	rm -f btry.o btry

.PHONY: strace
strace: btry
	strace ./btry >/dev/null
