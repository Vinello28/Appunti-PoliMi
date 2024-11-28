public class Scaffale 
{
	private String[] P;
	private int NP;
	
	public Scaffale(int _NP)
	{
		P = new String [_NP];
		NP = 0;
	}
	
	public String get_P(String _TP)
	{
		int i = 0;
		
		while (i < NP && P[i].compareTo(_TP) != 0)
		{
			i++;
		}
		
		if (i<NP)
		{
			String p = P[i];
			
			for (int j = i; j < P.length-1; j++)
			{
				P[j] = P[j+1];
			}
			
			P[P.length-1] = null;
			NP--;
			return p;
		}
		
		else
		{
			return "oggetto non trovato...";
		}
	
	}
	
	public boolean set_P(String _TP)
	{
		if(NP < P.length)
		{
			P[NP] = _TP;	
			NP++;
			return true;
		}
		else
		{
			return false;
		}

	}
	
	public void Stampa()
	{
		for(int i = 0; i < NP; i++)
		{
			System.out.println(i +" "+ P[i]);
		}
	}
}
