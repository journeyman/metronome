module Metronome where

import System.Environment (getArgs)

import Metronome.Input

main :: IO ()
main =  do
	input <- getArgs'
	let args = parseArgs input
	print $ "parsed args:\n" : (map show args)
	let config = getConfigFromMap . argsToMap $ args
	print config

getArgs' :: IO [String]
getArgs' = getTestArgs
--getArgs' = getArgs

getTestArgs :: IO [String]
getTestArgs = return ["-t=117 -b=blah"]