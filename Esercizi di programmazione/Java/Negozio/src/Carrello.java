public class Carrello 
{
	private String [] Acq;
	private int NP;
	
	public Carrello (int _NP)
	{
		Acq = new String[3];
		NP = 0;
	}
	      
	public int getNP() 
	{
		return NP;
	}

	public void Aggiungi(String _P)
	{
		Acq[NP] = _P;
		NP++;
	}
	
	public int get_NP()
	{
		return NP;
	}
	
	public String Prod_ACQ()
	{
		String S ="";
		for (int i = 0; i < NP; i++)
		{
			S = S + Acq[i] +" | ";
		}
		return S;
	}
	
	public void Vuota_CAR()
	{
		Acq = new String [Acq.length];
		NP = 0;
	}
	
	public String[] get_ACQ()
	{
		return Acq;
	} 
}