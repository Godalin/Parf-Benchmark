/* These stubs are provided only to enable a "fake compilation" for OSCS-based
   purposes. */

#include <stdint.h>

uint8_t eeprom_read_byte (const uint8_t *__p) {
  return *__p;
}

void eeprom_update_byte (uint8_t *__p, uint8_t __value) {
  *__p = __value;
}

uint16_t eeprom_read_word (const uint16_t *__p) {
  return *__p;
}

void eeprom_update_word (uint16_t *__p, uint16_t __value) {
  *__p = __value;
}
