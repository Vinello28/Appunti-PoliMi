
public class Elemento_richiesto 
{
	private Boolean scrivibile;
	private int contenuto;
	
	public Elemento_richiesto() 
	{
		scrivibile = true;
		contenuto = 0;
	}
	
	public void Scrivi() 
	{
		contenuto++;
	}
	
	public int Leggi() 
	{
		return contenuto;
	}

	public Boolean get_Scrivibile() {
		return scrivibile;
	}

	public void set_Scrivibile(Boolean x) {
		this.scrivibile = x;
	}
}
