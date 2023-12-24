#include <stdint.h>
#include <string.h>

extern void curve25519_donna(uint8_t *output, const uint8_t *secret, const uint8_t *bp);

int main() {
    static const unsigned char basepoint[32] = {9};
    unsigned char mysecret[32], mypublic[32];
    unsigned i;

    memset(mysecret, 42, 32);
    mysecret[0] &= 248;
    mysecret[31] &= 127;
    mysecret[31] |= 64;

    // Load the caches
    for (i = 0; i < 1000; ++i) {
        curve25519_donna(mypublic, mysecret, basepoint);
    }

    return 0;
}
