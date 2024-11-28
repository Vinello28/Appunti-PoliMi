import java.net.*;
import java.io.*;

public class Client 
{
	public static final int PORT = 1050; // porta al di fuori del range 1-1024 !
	
	public static void main(String[] args) throws IOException 
	{
		/* Lanciando il programma senza argomenti si ottiene il local loopback IP address,
	 	per testarlo in locale (client e server sulla stessa macchina), altrimenti
	 	si possono passare da linea di comando l’indirizzo o il nome della macchina remota */
	 
		InetAddress addr;
		if (args.length == 0) 
		{ 
			addr = InetAddress.getByName(null);
		}
		else 
		{
			addr = InetAddress.getByName(args[0]);
		}
		
		Socket socket=null;
		BufferedReader in=null, stdIn=null;
		PrintWriter out=null;
		try 
		{
			 // creazione socket
			 socket = new Socket(addr, PORT);
			 System.out.println("EchoClient: started");
			 System.out.println("Client Socket: "+ socket);
			 
			 // creazione stream di input da socket
			 InputStreamReader isr = new InputStreamReader( socket.getInputStream());
			 in = new BufferedReader(isr);
			 
			 // creazione stream di output su socket
			 OutputStreamWriter osw = new OutputStreamWriter( socket.getOutputStream());
			 BufferedWriter bw = new BufferedWriter(osw);
			 out = new PrintWriter(bw, true);
			
			 // creazione stream di input da tastiera
			 stdIn = new BufferedReader(new InputStreamReader(System.in));
			 String userInput;
			 
			 // ciclo di lettura da tastiera, invio al server e stampa risposta
			 while (true)
			 {
				 userInput = stdIn.readLine();
				 out.println(userInput);
				 if (userInput.equals("B")) break;
				 System.out.println("Echo: " + in.readLine());
			 }
		 }
		 
		catch (UnknownHostException e) 
		{
			System.err.println("Don’t know about host "+ addr);
		    System.exit(1);
		} 
		catch (IOException e) 
		{
			System.err.println("Couldn’t get I/O for the connection to: " + addr);
			System.exit(1);
		}
		
		System.out.println("EchoClient: closing...");
		out.close();
	    in.close();
		stdIn.close();
		socket.close();
	 }
} //EchoClient