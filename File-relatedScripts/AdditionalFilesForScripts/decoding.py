import sys
import codecs

def decode_unicode_escape_sequences(input_string):
    input_string = input_string.replace("\\U", "\\u")
    return codecs.unicode_escape_decode(input_string)[0]

if __name__ == "__main__":
    print(decode_unicode_escape_sequences(sys.argv[1]))
