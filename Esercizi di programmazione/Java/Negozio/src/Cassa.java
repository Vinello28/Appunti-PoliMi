public class Cassa extends Thread
{
	private String [] Prodotti;
	
	public Cassa (String [] P)
	{
		Prodotti = P;
	}
	
	public void StampaScontrino()
	{
		for(int i = 0; i < Prodotti.length; i++) 
		{
			System.out.println("Scontrino:" + Prodotti[i]);
		}
	}
	
	public void run()
	{
		StampaScontrino();
	}
}