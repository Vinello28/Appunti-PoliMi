import java.util.Random;

public class Produttore extends Thread{
	
	private String[] TipoProdotto;
	private Scaffale Scaf;
	Random r;
	
	public Produttore(String []_TP, Scaffale _SC, String _NT)
	{
		r=new Random();
		this.setName(_NT);
		TipoProdotto=_TP;
		Scaf=_SC;
	}
	
	public void Produci(int NP)
	{
		
		synchronized (Scaf)
		{		
			System.out.println(this.getName()+" "+"ha inserito: " + Scaf.set_P(TipoProdotto[NP]));
			Scaf.Stampa();
		}
	}
	
	public void run()
	{
		Random r=new Random();
		for (int i=0;i<5;i++)
		{
			try {
				sleep(r.nextInt(100));
			}catch (InterruptedException e) {
				e.printStackTrace();
			}
			Produci(r.nextInt(TipoProdotto.length));
		}
	}
}
