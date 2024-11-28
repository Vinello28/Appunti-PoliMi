public class Semaforo 
{
		private int valore;

		public Semaforo(int valore)    
		{
			this.valore = valore;  
		}

		synchronized public void R(Auto a)  
		{
			valore--;
			while (valore==0)  
			{
				try 
				{ 
					a.wait(3000); 
				} 
				catch (InterruptedException e) {}  
			}
			V();
		}

		synchronized public void V()  {
			valore++;
			notify();
		}
}


