# src/arch/x86/x64-efi/Makefile

# Compiler and linker settings
CC = gcc
CFLAGS = -Wall -Wextra -fno-stack-protector -fpic -fshort-wchar -mno-red-zone -ffreestanding -I src/include -I lib/gnu-efi/inc
LDFLAGS = -shared -Bsymbolic

# Source files
SRCS = $(wildcard src/*.c)
OBJS = $(SRCS:.c=.o)

# Output directory
OUTDIR = build/arch/x86/x64-efi
OUTFILE = $(OUTDIR)/bootx64.efi

# Gnu-EFI library path
GNUEFI_DIR = lib/gnu-efi
GNUEFI_INC = -L$(GNUEFI_DIR)/x86_64/lib -L$(GNUEFI_DIR)/x86_64/gnuefi
GNUEFI_LIB = $(GNUEFI_DIR)/x86_64/gnuefi/libgnuefi.a $(GNUEFI_DIR)/x86_64/lib/libefi.a
GNUEFI_CRT = $(GNUEFI_DIR)/x86_64/gnuefi/crt0-efi-x86_64.o

# Build target
all: $(OUTDIR) $(OUTFILE)

# Create output directory if it doesn't exist
$(OUTDIR):
	mkdir -p $(OUTDIR)

# Compile source files
src/%.o: src/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

# Link object files to create the EFI binary
$(OUTFILE): $(OBJS) $(GNUEFI_LIB) $(GNUEFI_CRT)
	ld -nostdlib $(LDFLAGS) $(GNUEFI_CRT) $(OBJS) -T$(GNUEFI_DIR)/gnuefi/elf_x86_64_efi.lds -o $(OUTFILE) $(GNUEFI_LIB)

# Clean build artifacts
clean:
	rm -r $(OBJS) $(OUTDIR)

