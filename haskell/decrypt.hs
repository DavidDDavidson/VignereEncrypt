import System.Environment
import System.IO
import Control.Monad
import System.Exit
import Data.Char

decrypt :: String -> String -> String -> IO()
decrypt i o ky = do	inf <- openFile i ReadMode 
			ciphertext <- hGetContents inf
			let key = take (length ciphertext) (cycle ky)
			let plaintext = create_plaintext ciphertext key
			--outf <- openFile o WriteMode
			writeFile o plaintext

create_plaintext :: String -> String -> String
create_plaintext [] [] = []
create_plaintext (x:xs) (y:ys) = chr(((ord x) - (ord y))`mod`255 ) : (create_plaintext xs ys)

main = do	argv <- getArgs
		let argc = length(argv)
		if (argc /= 3)
		then do	putStrLn "Invalid number of arguments"
			exitFailure
		else do decrypt (argv !! 0) (argv !! 1) (argv !! 2)
