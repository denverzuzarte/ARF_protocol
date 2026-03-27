#!/usr/bin/env python3

import numpy as np
from arf_loader import ARFLoader
import sys

class RSAcracker:
    def __init__(self, n:int, e:int):
        self.n = n
        self.e = e
        self.arf = ARFLoader()
        self.primes = ARFLoader.list_16bit_prime(self.arf)
        self.p, self.q, self.d = self.brute()
        print("p = ", self.p,"q = ", self.q,"d = ", self.d)
        #add the function to initialise the listner

    def brute(self):
        for p in self.primes:
            if self.n%p == 0:
                break;
        q = self.n/p
        d = (p-1)*(q-1)/self.e
        return p, q, d

if __name__ == "__main__":
    rsa_cracker = RSAcracker(int(sys.argv[1]), int(sys.argv[2]))

