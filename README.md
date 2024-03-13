# Encryption Program in Haskell

This is a simple encryption program written in Haskell that uses the XOR cipher to encrypt and decrypt files.

## Building the Project

You can build the project using either Cabal or the GHC command.

### Using Cabal

1. Navigate to the project directory.
2. Run the following command to build the project:

```sh
cabal build
```

### Using GHC

Run the following command to build the project:

```sh
ghc --make -isrc ./src/Main.hs -outputdir ./out
```

This command will compile the `Main.hs` file located in the `src` directory and place the generated executable in the `out` directory.

## Running the Program

After building the project, you can run the generated executable to encrypt or decrypt files.

### Encryption

To encrypt a file, use the `-e` flag, followed by the encryption key, input file, and output file:

```sh
main.exe -e <key> <input-file> <output-file>
```

Replace `<key>` with a number that you will need to remember for decryption, `<input-file>` with the path to the file you want to encrypt, and `<output-file>` with the desired path for the encrypted output file.

### Decryption

To decrypt a file, use the `-d` flag, followed by the same encryption key used for encryption, the encrypted input file, and the desired output file for the decrypted content:

```sh
main.exe -d <key> <input-file> <output-file>
```

Replace `<key>` with the same number used for encryption, `<input-file>` with the path to the encrypted file, and `<output-file>` with the desired path for the decrypted output file.

**Note:** Remember the encryption key you use, as it is required for successful decryption.

## Example

Encrypt a file:

```sh
main.exe -e 42 plaintext.txt ciphertext.txt
```

Decrypt the encrypted file:

```sh
main.exe -d 42 ciphertext.txt plaintext.txt
```

In this example, the key `42` is used for both encryption and decryption.
