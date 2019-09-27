module Main where

import Sort
import System.Environment (getArgs)
import System.IO.Error
import Control.Exception (catch)

(<&>) :: Functor f => f a -> (a -> b) -> f b
(<&>) = flip fmap

main = getArgs >>= processFiles

processFiles :: [String] -> IO ()
processFiles [] = return ()
--processFiles (f:fs) = (catch :: IO a -> (IOError -> IO a) -> IO a) (tryToProcess f) (msg f) 
processFiles (f:fs) = (catch :: IO a -> (IOError -> IO a) -> IO a) (tryToProcess f) (putStrLn . show) 

tryToProcess :: String -> IO () 
tryToProcess f = readFile f >>= (putStrLn . show . countWords) 

msg f e	| isDoesNotExistErrorType e = putStrLn ("File \"" ++ f ++ "\" does not exist.")
	| isPermissionErrorType e = putStrLn  ("File \"" ++ f ++ "\": Access denied.")
	| otherwise = putStr ""
