public class Ponte 
{

	public static void main(String[] args) 
	{
		// TODO Auto-generated method stub
		Semaforo s = new Semaforo(1);
		
		Auto a1 = new Auto(" VolksWagen ", 111);
		Auto a2 = new Auto(" Mercedes-Benz ", 222);
		Auto a3 = new Auto(" Alfa Romeo ", 333);
		Auto a4 = new Auto(" FIAT ", 444);
		
		a1.setA(a1);
		a2.setA(a2);
		a3.setA(a3);
		a4.setA(a4);
		
		a1.setS(s);
		a2.setS(s);
		a3.setS(s);
		a4.setS(s);
		
		a1.start();
		a2.start();
		a3.start();
		a4.start();		
	}

}
