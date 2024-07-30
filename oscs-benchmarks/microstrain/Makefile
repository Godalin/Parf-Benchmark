TARGETS = microstrain_gx4_45_test

CPPFLAGS    += \
  -I MIPSDK/C/Library/Include \
  -I include/microstrain_mips \
  -I MIPSDK/C/Utilities/Include \
  -D FIONREAD=0x541B \

all: $(TARGETS)

microstrain_gx4_45_test: \
  $(sort $(wildcard MIPSDK/C/Library/Source/*.c)) \
  MIPSDK/C/Utilities/Source/byteswap_utilities.c \
  src/mip_sdk_user_functions.c \
  MIPSDK/C/Examples/Linux/GX4-45/GX4_45_Test/GX4-45_Test.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ $^ $(LDFLAGS)

clean:
	rm -f $(TARGETS)

.PHONY: clean
