import java.io.*;
import java.lang.System.*;

public class decrypt{
	public static void main(String [] args){
		if(args.length != 3)
		{
			System.out.println("Invalid number of arguments");
			System.exit(-1);
		}
		File in = new File(args[0]);
		File out = new File(args[1]);
		String key = args[2];
		decrypt(in, out, key);
	
	}

	public static void decrypt(File in, File out, String key){
		try{
			FileInputStream in_stream = new FileInputStream(in);
			FileOutputStream out_stream = new FileOutputStream(out);
			int next_byte;
			int k_ind = 0;
			while((next_byte = in_stream.read()) != -1)
			{
				if (k_ind == key.length()) k_ind = 0;
				char decrypted_char = (char) ((next_byte - ((int)key.charAt(k_ind))) %255);
				out_stream.write(decrypted_char);
				k_ind++;
			}
			in_stream.close();
			out_stream.close();
		}
		catch(IOException ex){
			System.out.println("Input file does not exist");
		}			
	}
}
