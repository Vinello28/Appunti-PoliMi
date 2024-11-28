
public class Supermercato {

	public static void main(String[] args) 
	{
		String[] P = {"Pasta", "Biscotti", "Pizza"};
		Scaffale S = new Scaffale (5);
		Produttore P0 = new Produttore("Pasta", S);
		Produttore P1 = new Produttore("Biscotti", S);
		Produttore P2 = new Produttore("Pizza", S);
		
		Consumatore C0 = new Consumatore (P, S);
		Consumatore C1 = new Consumatore (P, S);
		Consumatore C2 = new Consumatore (P, S);

		P0.start();
		P1.start();
		P2.start();
		
		C0.start();
		C1.start();
		C2.start();
	}

}
