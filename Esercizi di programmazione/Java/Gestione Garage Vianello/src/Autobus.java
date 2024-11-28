import java.util.Random;

public class Autobus extends Automezzo {
	
	
	public Autobus(String t, Semaforo S) {
		targa=t;
		s=S;
		R=new Random();
	}
	public void run() {
		try {
			sleep(R.nextInt(7000));
		} catch (InterruptedException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println(targa+" Attendo");
		s.R();
		System.out.println("Passa il veicolo: "+targa);
		try {
			sleep(R.nextInt(3000));
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Veicolo "+targa+" passato.");
		s.V();
	}
	
	
}