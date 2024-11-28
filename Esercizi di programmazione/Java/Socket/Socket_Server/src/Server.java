import java.io.*;
import java.net.*;

public class Server 
{
	public static final int PORT = 1050; // porta al di fuori del range 1-1024 !
	
	public static int Somma(int n1, int n2) 
	{
		return n1+n2;
	}
	
	public static int Sottrazione(int n1, int n2) 
	{
		if (n1 > n2 || n1 == n2) 
		{
			return n1-n2;
		}
		else 
		{
			return n2 - n1;
		}
	}
	
	public static int Prodotto(int n1, int n2) 
	{
		return n1*n2;
	}
	
	public static double Rapporto(int n1, int n2) 
	{
		double x;
		x = n1/n2;
		return x;
	}
	
	public static int Fattoriale(int x) 
	{
		int tmp = x;
		int c = x;
		
		for(int i = 0; i < x-1; i++) 
		{
			c = c - 1;
			tmp = tmp*c;
		}
		
		return tmp;
	}
	
	public static int Potenza(int n1, int n2) 
	{
		int tmp = n1;
		
		for(int i = 0; i < n2; i++) 
		{
			tmp = tmp*n1;
		}
		
		return tmp;
	}
	
	public static int Sommatoria(int x) 
	{
		int tmp = x;
		int c = x;
		
		for(int i = 0; i < x; i++) 
		{
			c = c - 1;
			tmp = tmp + c;
		}
		
		return tmp;
	}
	
	
	//main 
	public static void main(String[] args) throws IOException 
	{
		ServerSocket serverSocket = new ServerSocket(PORT);
		System.out.println("EchoServer: started ");
		System.out.println("Server Socket: " + serverSocket);
		Socket clientSocket=null;
		BufferedReader in=null;
		PrintWriter out=null;
		String[] sp;
		
		String Error = "ERRORE: Comando errato.";
		boolean error = false;
		
		try 
		{
			 // bloccante finchè non avviene una connessione
			 clientSocket = serverSocket.accept();
			 System.out.println("Connection accepted: "+ clientSocket);
			 
			 // creazione stream di input da clientSocket
			 InputStreamReader isr = new InputStreamReader(clientSocket.getInputStream());
			 in = new BufferedReader(isr);
			 
			 // creazione stream di output su clientSocket
			 OutputStreamWriter osw = new OutputStreamWriter(clientSocket.getOutputStream());
			 BufferedWriter bw = new BufferedWriter(osw);
			 out = new PrintWriter(bw, true);
			 
			 //ciclo di ricezione dal client e invio di risposta
			 while (true) 
			 {
				 String str = in.readLine();
				 sp = new String[3];
				 sp = str.split(" ");
				 
				 sp = new String[3];
				 sp = str.split(" ");
				 
				 int tmp = 0;
				 double div = 0;
				 boolean _div = false;
				 int n1 = Integer.parseInt(sp[1]);
				 int n2 = Integer.parseInt(sp[2]);
				 
				 if (sp[0].equals("B")) 
				 { 
					 break;
				 }
				 else 
				 {
					if(sp[0].equals("S"))
					{
						tmp = Somma(n1, n2);
					}
					else 
					{
						if(sp[0].equals("D"))
						{
							tmp = Sottrazione(n1, n2);
						}
						else 
						{
							if(sp[0].equals("P"))
							{
								tmp = Prodotto(n1, n2);
							}
							else 
							{
								if(sp[0].equals("R"))
								{
									div = Rapporto(n1, n2);
									_div = true;
								}
								else 
								{
									if(sp[0].equals("F"))
									{
										tmp = Fattoriale(n1);
									}
									else 
									{
										if(sp[0].equals("E"))
										{
											tmp = Potenza(n1, n2);
										}
										else 
										{
											if(sp[0].equals("Z"))
											{
												tmp = Sommatoria(n1);
											}
											else 
											{
												error = true;
											}
										}
									}
								}
							}
						}
					}
				 }
				 System.out.println("Echoing: " + str);
				 
				 if(error == false) 
				 {
					 if (_div == true) 
					 {
						 out.println(div);
						 _div = false;
					 }
					 else 
					 {
						 out.println(tmp);
					 }
				 }
				 else 
				 {
					 out.println(Error);
					 error = false;
				 }
			 }
		 }
		 catch (IOException e) 
		 {
			 System.err.println("Accept failed");
			 System.exit(1);
		 }
		 
		// chiusura di stream e socket
		 System.out.println("EchoServer: closing...");
		 out.close();
		 in.close();
		 clientSocket.close();
		 serverSocket.close();
	}
} // EchoServer
