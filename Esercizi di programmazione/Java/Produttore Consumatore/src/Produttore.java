public class Produttore extends Thread
{
	private String TipoProdotto;
	private Scaffale scaffale;
	
	public Produttore(String _TP, Scaffale _SC) 
	{
		TipoProdotto = _TP;
		scaffale = _SC;
	}
	
	public void Produci() 
	{
		System.out.println("è stato inserito " + scaffale.set_P(TipoProdotto));
	}
	
	public void run() 
	{
		for (int i = 0; i<)
	}
}
