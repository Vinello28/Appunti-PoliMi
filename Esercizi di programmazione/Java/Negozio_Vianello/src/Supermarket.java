public class Supermarket 
{
	public static void main(String[] args) 
	{
		// TODO Auto-generated method stub
		
		Scaffale A = new Scaffale (5);
		Scaffale B = new Scaffale (5);
		Scaffale I = new Scaffale (5);
		
		String[] Pr_A = {"Pasta", "Biscotti", "Pizza", "Miele"};
		String[] Pr_B = {"Acqua", "Birra", "Gin", "Rum"};
		String[] Pr_I = {"Sapone", "Dentifricio", "Shampoo", "Amuchina"};

		Produttore PA = new Produttore(Pr_A, A, "PA");
		Produttore PB = new Produttore(Pr_B, B, "PB");
		Produttore PI = new Produttore(Pr_I, I, "PI");
		
		//Vengono lanciati i produttori
		PA.start();
		PB.start();
		PI.start();
		
		Consumatore C0 = new Consumatore(A, Pr_A, B, Pr_B, I, Pr_I, "C0");
		Consumatore C1 = new Consumatore(A, Pr_A, B, Pr_B, I, Pr_I, "C1");
		Consumatore C2 = new Consumatore(A, Pr_A, B, Pr_B, I, Pr_I, "C2");
		
		//Vengono lanciati i consumatori
		C0.start();
		C1.start();
		C2.start();
	}
}
