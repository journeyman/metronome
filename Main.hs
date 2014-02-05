module Metronome where

import System.Environment (getArgs)

import Metronome.Input

main :: IO ()
main =  do
	input <- getArgs'
	--putStrLn "unparsed args:"
	--print input
	let args = parseArgs input
	--putStrLn "parsed args:" 
	--print (map show args)
	let config = getConfigFromMap . argsToMap $ args
	putStrLn $ "running config: \n" ++ show config

getArgs' :: IO [String]
--getArgs' = getTestArgs
getArgs' = getArgs

getTestArgs :: IO [String]
getTestArgs = return ["-t=117", "-b=blah"]