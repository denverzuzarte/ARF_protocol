#!/usr/bin/env python3

import numpy as np
import random
import sys

class ARFLoader:
    def __init__(self, random_seed: int = 42):
        #print("initialised")
        random.seed(random_seed)
        primes = self.list_16bit_prime() 
        p = random.choice(primes) 
        q = random.choice(primes)
        pipe_addr: uint64 = self.rand_5byte_pipe_addr()
        print(p, " ", q, " ", pipe_addr)
        
    def rand_5byte_pipe_addr(self):
        pipe = 0xFFFFFFFFFF

    def list_16bit_prime(self):
        p_list = [2]
        for i in range (3, 2**16):
            is_prime: bool = True
            for p in p_list:
                if p>i**0.5:
                    break
                if i%p == 0:
                    is_prime = False
            if is_prime:
                p_list.append(i)
        #print(p_list)
        return p_list

if __name__ == "__main__":
    arf_loader = ARFLoader(random_seed=int(sys.argv[1]))
