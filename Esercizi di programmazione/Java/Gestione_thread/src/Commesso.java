
public class Commesso extends Magazziniere
{
	private int articolo;
	
	public Commesso() 
	{
		
	}
	
	public void Run() 
	{
		synchronized (requested) 
		{
			if (requested.get_Scrivibile() == false && libero == true) 
			{
				libero = false;
				try 
				{
					requested.wait();
				}
				catch (InterruptedException e) {}
				
				articolo = requested.Leggi();
				requested.set_Scrivibile(true);
				requested.notify();
				libero = true;
			}
		}
	}
	
	public void Visualizza() 
	{
		System.out.println("Viene servito l'articolo n°" + articolo);
	}
}
