import System.Environment
import System.IO
import Control.Monad
import System.Exit
import Data.Char

encrypt :: String -> String -> String -> IO()
encrypt i o ky = do	inf <- openFile i ReadMode 
			plaintext <- hGetContents inf
			let key = take (length plaintext) (cycle ky)
			let ciphertext = create_cipher plaintext key
			--outf <- openFile o WriteMode
			writeFile o ciphertext

create_cipher :: String -> String -> String
create_cipher [] [] = []
create_cipher (x:xs) (y:ys) = chr(((ord x) + (ord y))`mod`255 ) : (create_cipher xs ys)

main = do	argv <- getArgs
		let argc = length(argv)
		if (argc /= 3)
		then do	putStrLn "Invalid number of arguments"
			exitFailure
		else do encrypt (argv !! 0) (argv !! 1) (argv !! 2)
