import sys

def return_args():
	if len(sys.argv) != 4:
		sys.exit("Invalid number of arguments")
	return sys.argv

def decrypt(infile, outfile, key):
	try:
		infile = open(infile, "r")
		outfile = open(outfile, "w")
		plaintext = ""
		k_ind = 0
		for char in infile.read():
			if k_ind == len(key):
				k_ind = 0
			plaintext += chr((ord(char) - ord(key[k_ind]))%255)
			k_ind += 1
		outfile.write(plaintext)
		infile.close()
		outfile.close()	
	except IOError:
		sys.exit("Input file does not exist")

def main():
	args = return_args()
	decrypt(args[1], args[2], args[3])

main()
