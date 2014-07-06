
-- Demonstrates of a possible solution to expression problem in Haskell.

module Main where

import Prelude hiding (print)

-- Classes

class Document a where
    load :: a -> IO ()
    save :: a -> IO ()

class Printable a where
    print :: a -> IO ()


-- Text Document

data TextDocument = TextDocument String

-- Document Interface
instance Document TextDocument where
    load (TextDocument a) = putStrLn ("Loading TextDocument(" ++ a ++ ")...")
    save (TextDocument a) = putStrLn ("Saving TextDocument(" ++ a ++ ")...")

-- Printable Interface
instance Printable TextDocument where
    print (TextDocument a) = putStrLn ("Printing TextDocument(" ++ a ++ ")")


-- Drawing Document

data DrawingDocument = DrawingDocument String

-- Document Interface
instance Document DrawingDocument where
    load (DrawingDocument a) = putStrLn ("Loading DrawingDocument(" ++ a ++ ")...")
    save (DrawingDocument a) = putStrLn ("Saving DrawingDocument(" ++ a ++ ")...")

-- Printable Interface
instance Printable DrawingDocument where
    print (DrawingDocument a) = putStrLn ("Printing DrawingDocument(" ++ a ++ ")")


-- Demonstration

test a = do
    load a
    save a
    print a

main = do
    putStrLn ""
    test (TextDocument "text")
    putStrLn ""
    test (DrawingDocument "text")
    putStrLn ""

