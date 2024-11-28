
public class Scaffale 
{
	int NP;
	String[] P;
	
	public Scaffale(int _NP) 
	{
		P = new String[_NP];
		NP = 0;
	}
	
	public String get_P(String _TP) 
	{
		int i = 0;
		while (i< NP && P[i].compareTo(_TP) != 0) 
		{
			i++;
		}
		if (i<NP) 
		{
			String p = P[i];
			for (int )
		}
		else 
		{
			return "";
		}
	}
}
