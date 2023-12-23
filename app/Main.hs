{-# LANGUAGE CApiFFI #-}
module Main where

import Foreign.C.Types

foreign import capi "foo.c foo" foo :: CInt

main :: IO ()
main = putStrLn "Hello, Haskell!"
