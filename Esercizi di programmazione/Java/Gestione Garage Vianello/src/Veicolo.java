import java.util.Random;

public class Veicolo extends Automezzo {

	public Veicolo(String t, Semaforo S) {
		targa=t;
		s=S;
		R=new Random();
	}
	public void run() {
		try {
			sleep(R.nextInt(5000));
		} catch (InterruptedException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println(targa+" Attendo");
		s.R();
		System.out.println("Passa il veicolo: "+targa);
		try {
			sleep(R.nextInt(2000));
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Veicolo "+targa+" passato.");
		s.V();
	}
	
	
}
