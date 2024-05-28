# Top-level Makefile

.PHONY: all clean

all:
	$(MAKE) -C src/arch/x86/x64-efi

clean:
	$(MAKE) -C src/arch/x86/x64-efi clean

