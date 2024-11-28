import java.util.Random;

public class Ponte {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Semaforo sem=new Semaforo(3);
		Automezzo[] A= new Automezzo[10];
		Random R= new Random();
		for (int i=0;i<10;i++)
			if (R.nextInt(2)==0)
				A[i]= new Veicolo("V_"+i,sem);
			else
				A[i]= new Camion("C_"+i,sem);
		for (int i=0;i<10;i++)
			A[i].start();
		
	}

}
