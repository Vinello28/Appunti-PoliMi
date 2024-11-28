
public class Magazziniere extends Thread
{
	protected Elemento_richiesto requested; //variabile condivisa
	protected Boolean libero;
	
	public Magazziniere() 
	{
		libero = true;
	}
	
	public void Run() 
	{
		synchronized (requested) 
		{
			if (requested.get_Scrivibile() == true && libero == true) 
			{
				libero = false;
				try 
				{
					requested.wait();
				}
				catch(InterruptedException e) 
				{
					
				}
				requested.Scrivi();
				requested.set_Scrivibile(false);
				requested.notify();
				libero = true;
			}
		}
	}
}
