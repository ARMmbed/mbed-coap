#
# Makefile for combined NSDL+COAP library
#

# Define compiler toolchain with CC or PLATFORM variables
# Example (GCC toolchains, default $CC and $AR are used)
# make
#
# OR (Cross-compile GCC toolchain)
# make PLATFORM=arm-linux-gnueabi-
#
# OR (ArmCC/Keil)
# make CC=ArmCC AR=ArmAR
#
# OR (IAR-ARM)
# make CC=iccarm

LIB = libnsdl.a
SRCS := \
	libNsdl/src/sn_grs.c \
	libNsdl/src/sn_nsdl.c \
	libCoap/src/sn_coap_protocol.c \
	libCoap/src/sn_coap_parser.c \
	libCoap/src/sn_coap_header_check.c \
	libCoap/src/sn_coap_builder.c \

override CFLAGS += -IlibNsdl/src/Include/
override CFLAGS += -IlibCoap/src/include/
SERVLIB_DIR := ../libService
override CFLAGS += -I$(SERVLIB_DIR)/include

override CFLAGS += -DREAL_EMBEDDED

include ../libService/toolchain_rules.mk

$(eval $(call generate_rules,$(LIB),$(SRCS)))

