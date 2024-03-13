# Encryption Program in Haskell

This is a simple encryption program written in Haskell that uses the XOR cipher to encrypt and decrypt files. It also includes a feature to save the encryption/decryption key in a separate file for convenience.

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

### Saving the Encryption/Decryption Key

Before encrypting or decrypting files, you can save the encryption/decryption key to a separate file using the `-k` flag:

```sh
main.exe -k <key> <key-file>
```

Replace `<key>` with the desired encryption/decryption key (a number), and `<key-file>` with the path to the file where you want to save the key.

### Encryption

To encrypt a file, use the `-e` flag, followed by the encryption key, input file, output file, and the key file:

```sh
main.exe -e <key> <input-file> <output-file> <key-file>
```

Replace `<key>` with the encryption key (the same key used when saving the key file, if you saved it), `<input-file>` with the path to the file you want to encrypt, `<output-file>` with the desired path for the encrypted output file, and `<key-file>` with the path to the file where the encryption key is stored.

### Decryption

To decrypt a file, use the `-d` flag, followed by the encrypted input file, the desired output file for the decrypted content, and the key file:

```sh
main.exe -d <input-file> <output-file> <key-file>
```

Replace `<input-file>` with the path to the encrypted file, `<output-file>` with the desired path for the decrypted output file, and `<key-file>` with the path to the file where the encryption key is stored.

## Example

Save the encryption/decryption key to a file:

```sh
main.exe -k 42 key.txt
```

Encrypt a file:

```sh
main.exe -e 42 plaintext.txt ciphertext.txt key.txt
```

Decrypt the encrypted file:

```sh
main.exe -d ciphertext.txt plaintext.txt key.txt
```

In this example, the key `42` is used for both encryption and decryption, and it is saved in the file `key.txt`.

**Note:** The kay saving feature is yet to be succefull so the key will need to be specified when [en/de]crypting the file
