#include <iostream>
#include <fstream>
#include <string>
#include <streambuf>
#include <stdio.h>
#include <stdlib.h>

using namespace std;

void encrypt(char* infile, char* outfile, char* key){
	ifstream in(infile);
	if(in)
	{
		string plaintext = string(istreambuf_iterator<char>(in), istreambuf_iterator<char>());
		string ciphertext = "";
		for (int i = 0; i < plaintext.length(); i++)
		{	
			int k_ind = 0;
			if(k_ind == sizeof(key)) k_ind = 0;
			ciphertext += char((int(plaintext[i]) + int(key[k_ind]))%255);
			k_ind++;
		}
		ofstream out(outfile);
		out << ciphertext;
		out.close();
	}
	else
	{
		cout << "Input file does not exist\n";
		exit(EXIT_FAILURE);
	}
	in.close();
	return;
}

int main(int argc, char** argv){
	if(argc != 4){
		cout << "Invalid number of arguments\n";
		exit(EXIT_FAILURE);
	}
	encrypt(argv[1], argv[2], argv[3]);
	return(0);
}
