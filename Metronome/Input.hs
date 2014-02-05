module Metronome.Input where

import Data.Maybe (fromMaybe)
import qualified Data.Map as Data

data Arg = SingleArg { name :: String 
					 } 
		 | PairArg { key :: String
				   , value :: String
				   } deriving (Show)


data Config = Config { tempo :: Int
					 , bitFilePath :: FilePath
					 } deriving (Show)


parseArgs :: [String] -> [Arg]
parseArgs = map SingleArg

defaultTempo :: String
defaultTempo = show (100 :: Int)

defaultBitFilePath :: FilePath
defaultBitFilePath = ""

getConfigFromMap :: Data.Map String String -> Config
getConfigFromMap m = 
	Config { tempo = read $ fromMaybe defaultTempo (Data.lookup "-t=" m)
		   , bitFilePath = fromMaybe defaultBitFilePath (Data.lookup "-b=" m)
		   }

argsToMap :: [Arg] -> Data.Map String String
argsToMap args = Data.fromList [(k, v) | PairArg k v <- args]