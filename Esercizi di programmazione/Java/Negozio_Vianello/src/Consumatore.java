import java.util.Random;

public class Consumatore extends Thread
{
	private String[] Prod_A;
	private String[] Prod_B;
	private String[] Prod_I;
	private Scaffale Scaf_A;
	private Scaffale Scaf_B;
	private Scaffale Scaf_I;
	private Carrello Car;
	private Cassa Cas;

	public Consumatore (Scaffale _SA, String[] PA,Scaffale _SB, String[] PB,Scaffale _SI, String[] PI, String _NT)
	{
		this.setName(_NT);
		Scaf_A = _SA;
		Prod_A = PA;
		Scaf_B = _SB;
		Prod_B = PB;
		Scaf_I = _SI;
		Prod_I = PI;
		Car = new Carrello(3);
		Cas = new Cassa (Car.get_ACQ());
	}
	
	public void Consuma(String _TP, Scaffale Scaf)
	{
		String P;
		synchronized (Scaf)
		{
			P = Scaf.get_P(_TP);	
			Car.Aggiungi(P);
			System.out.println(this.getName()+ " cerca " + _TP + " e ha comprato: " + P);
			Scaf.Stampa();
		}
	}

	public void run()
	{
		Random r = new Random();
		for (int i = 0; i < 3; i++)
		{
			try 
			{
				sleep(r.nextInt(300));
			}
			catch (InterruptedException e) 
			{
				e.printStackTrace();
			}
			Consuma(Prod_A[r.nextInt(Prod_A.length)], Scaf_A);
			Consuma(Prod_B[r.nextInt(Prod_B.length)], Scaf_B);
			Consuma(Prod_I[r.nextInt(Prod_I.length)], Scaf_I);
			
			System.out.println(i + " " + this.getName() + " ha comprato " + Car.Prod_ACQ());		
			synchronized (this.getClass()) 
			{
				Cas.start();			
			try 
			{
				Cas.join();
			} 
			catch (InterruptedException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
				}
			}
			Car.Vuota_CAR();
		}
	}
}