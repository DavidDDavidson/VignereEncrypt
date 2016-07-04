import sys

def return_args():
	if len(sys.argv) != 4:
		sys.exit("Invalid number of arguments")
	return sys.argv

def encrypt(infile, outfile, key):
	try:
		infile = open(infile, "r")
		outfile = open(outfile, "w")
		ciphertext = ""
		k_ind = 0
		for char in infile.read():
			if k_ind == len(key):
				k_ind = 0
			ciphertext += chr((ord(char) + ord(key[k_ind]))%255)
			k_ind += 1
		outfile.write(ciphertext)
		infile.close()
		outfile.close()	
	except IOError:
		sys.exit("Input file does not exist")

def main():
	args = return_args()
	encrypt(args[1], args[2], args[3])

main()
