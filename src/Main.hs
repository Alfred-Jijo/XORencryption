import Data.Bits (Bits (xor))
import Data.Word (Word8)
import System.Environment (getArgs)
import System.IO (IOMode (ReadMode, WriteMode), hClose, hGetContents, hPutStr, openFile)

-- Encrypt/decrypt a single byte using XOR
xorByte :: Word8 -> Word8 -> Word8
xorByte key byte = key `xor` byte

-- Encrypt/decrypt a list of bytes using XOR
xorBytes :: Word8 -> [Word8] -> [Word8]
xorBytes key = map (xorByte key)

main :: IO ()
main = do
  args <- getArgs
  case args of
    ["-e", key, inputFile, outputFile, keyFile] -> do
      let k = read key :: Word8
      input <- readFile inputFile
      let output = xorBytes k (map fromIntegral (unpack input))
      writeFile outputFile (pack output)
      saveKey k keyFile
    ["-d", inputFile, outputFile, keyFile] -> do
      k <- loadKey keyFile
      input <- readFile inputFile
      let output = xorBytes k (map fromIntegral (unpack input))
      writeFile outputFile (pack output)
    ["-k", key, keyFile] -> saveKey (read key :: Word8) keyFile
    _ -> putStrLn "Usage: xor-cipher (-e|-d|-k) <key> <input-file> <output-file> [<key-file>]"

unpack = map (fromIntegral . fromEnum)

-- Convert a list of Word8 values to a String
pack :: [Word8] -> String
pack = map (toEnum . fromIntegral)

-- Save the encryption/decryption key to a file
saveKey :: Word8 -> FilePath -> IO ()
saveKey key keyFile = do
  handle <- openFile keyFile WriteMode
  hPutStr handle (show key)
  hClose handle

-- Load the encryption/decryption key from a file
loadKey :: FilePath -> IO Word8
loadKey keyFile = do
  handle <- openFile keyFile ReadMode
  keyStr <- hGetContents handle
  hClose handle
  return (read keyStr)