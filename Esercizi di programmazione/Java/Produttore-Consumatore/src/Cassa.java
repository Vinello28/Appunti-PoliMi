
public class Cassa extends Thread{

	private String [] Prodotti;

	
	public Cassa (String[] _Prodotto) 
	{
		Prodotti = _Prodotto;
	}
	
	public void Stampa_Scontrino()
	{
		for (int i =0; i <Prodotti.length;i++)
		{
			System.out.println("SCONTRINO: " + Prodotti[i]);
		}
	}
	
	public void run()
	{
		Stampa_Scontrino();
	}
}
