# ibm-1401-bc
Binary encoder / decoder command line tool for the [IBM 1401 emulator](https://github.com/sanzaru/ibm-1401)

## Options

- e: Encode
- d: Decode

## Usage examples:

### Encode a file
```./ibm-1401-bc -e some-file-to-decode```

After running the program the decoded data can be found in the file _some-file-to-decode.dis_

### Decode a file
```./ibm-1401-bc -d some-file-to-decode```

After running the program the decoded data can be found in the file _some-file-to-decode.bcd_
