import Data.Bits (Bits (xor))
import Data.Word (Word8)
import System.Environment (getArgs)

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
    ("-e" : key : inputFile : [outputFile]) -> do
      let k = read key :: Word8
      input <- readFile inputFile
      let output = xorBytes k (map fromIntegral (unpack input))
      writeFile outputFile (pack output)
    ("-d" : key : inputFile : [outputFile]) -> do
      let k = read key :: Word8
      input <- readFile inputFile
      let output = xorBytes k (map fromIntegral (unpack input))
      writeFile outputFile (pack output)
    _ -> putStrLn "Usage: xor-cipher (-e|-d) <key> <input-file> <output-file>"

unpack = map (fromIntegral . fromEnum)

-- Convert a list of Word8 values to a String
pack :: [Word8] -> String
pack = map (toEnum . fromIntegral)