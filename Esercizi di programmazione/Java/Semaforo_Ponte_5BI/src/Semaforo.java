public class Semaforo 
{
		private int valore;

		public Semaforo(int valore)    {
			this.valore = valore;  
		}

		synchronized public void R()  {
			while (valore==0)  {
				try {
				wait();
				} 
				catch (InterruptedException e) {}  
				}
			valore--; 
			
		}

		synchronized public void V()  {
			valore++;
			notify();
		}

		public int getValore() {
			return valore;
		}

		public void setValore(int valore) {
			this.valore = valore;
		}
}

