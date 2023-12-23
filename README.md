
# This is a simple example that demonstrates an error with capi linker

Running `cabal build` should reproduce the following error:

```
Resolving dependencies...
Build profile: -w ghc-9.6.3 -O1
In order, the following will be built (use -v for more details):
 - capi-linker-error-0.1.0.0 (exe:capi-linker-error) (first run)
Configuring executable 'capi-linker-error' for capi-linker-error-0.1.0.0..
Preprocessing executable 'capi-linker-error' for capi-linker-error-0.1.0.0..
Building executable 'capi-linker-error' for capi-linker-error-0.1.0.0..
[1 of 1] Compiling Main             ( app/Main.hs, /home/brcha/b/capi_linker_error/dist-newstyle/build/x86_64-linux/ghc-9.6.3/capi-linker-error-0.1.0.0/x/capi-linker-error/build/capi-linker-error/capi-linker-error-tmp/Main.o )
[2 of 2] Linking /home/brcha/b/capi_linker_error/dist-newstyle/build/x86_64-linux/ghc-9.6.3/capi-linker-error-0.1.0.0/x/capi-linker-error/build/capi-linker-error/capi-linker-error
/nix/store/1fn92b0783crypjcxvdv6ycmvi27by0j-binutils-2.40/bin/ld.gold: error: /home/brcha/b/capi_linker_error/dist-newstyle/build/x86_64-linux/ghc-9.6.3/capi-linker-error-0.1.0.0/x/capi-linker-error/build/capi-linker-error/capi-linker-error-tmp/app/foo.o: multiple definition of 'foo'
/nix/store/1fn92b0783crypjcxvdv6ycmvi27by0j-binutils-2.40/bin/ld.gold: /home/brcha/b/capi_linker_error/dist-newstyle/build/x86_64-linux/ghc-9.6.3/capi-linker-error-0.1.0.0/x/capi-linker-error/build/capi-linker-error/capi-linker-error-tmp/Main.o: previous definition here
collect2: error: ld returned 1 exit status
ghc-9.6.3: `cc' failed in phase `Linker'. (Exit code: 1)
Error: cabal: Failed to build exe:capi-linker-error from
capi-linker-error-0.1.0.0.
```

For some reason, there are multiple definitions of the function that was supposed to be FFI-ed into Haskell.
