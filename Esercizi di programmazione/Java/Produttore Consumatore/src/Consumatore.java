public class Consumatore extends Thread
{
	public Scaffale scaffale;
	public String[] prod;
	
	public Consumatore(String[] P, Scaffale _SC) 
	{
		Scaffale = _SC
	}
	
	public void Consuma() 
	{
		System.out.println("è stato comprato " + scaffale.get_P(TipoProdotto));
	}
}
