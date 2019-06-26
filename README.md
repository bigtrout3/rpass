# rpass

A command-line tool to generate a diceware password.

## Options

| Option | Description | Example |
|:------:|:-----------:|:-------:|
| `-c, --count=NUM` | How many words to pull. Default 3 | `-c4`, `--count=5` |
| `-d, --dictionary=DICTIONARY` | Path to dictionary to load words from. | `-dmydictionary.txt`, `--dictionary=mydictionary.txt` |
| `-s, --separator=SEPARATOR` | Separator used to join words together. Default `-` | `-s.`, `--separator=" "` |

## Installation

```
git clone https://github.com/bmpotter13/rpass.git
cd rpass
stack install
```

## Example Usages

```
$ rpass --help
rpass: user error (unrecognized option `--help'
Usage: rpass [OPTIONS]
  -c[NUM]   --count[=NUM]        Produce NUM words in password.
  -d[DICT]  --dictionary[=DICT]  Load words from DICTIONARY.
  -s[SEP]   --separator[=SEP]    Join words with SEPARATOR.
)
$ rpass
toss-stirks-dhoni
$ rpass -c5
pahutan-roupily-pian-tautens-bandos
$ rpass -c2 --separator=.
staup.denty
```
