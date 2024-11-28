public class Auto extends Thread
{
	private String marca;
	private int targa;
	private Boolean passata; //variabile per vedere se ha oltrepassato il ponte
	Semaforo s;
	Auto a;
	
	public Auto (String _m, int _t) 
	{
		marca = _m;
		targa = _t;
		passata = false;
	}

	public void run() 
	{
		s.R(a);
		passata = true;
		Visualizza();
	}
	
	//metodo visualizza
	public void Visualizza() 
	{
		System.out.println(" | " + marca + " | " + targa + " | l'auto ha passato il ponte | ");
		System.out.println();
	}
	
	//metodi get e set
	public String getMarca() 
	{
		return marca;
	}

	public void setMarca(String marca) 
	{
		this.marca = marca;
	}

	public int getTarga() 
	{
		return targa;
	}

	public void setTarga(int targa) 
	{
		this.targa = targa;
	}

	public Boolean getPassata() 
	{
		return passata;
	}

	public void setPassata(Boolean passata) 
	{
		this.passata = passata;
	}
	public void setS(Semaforo s) {
		this.s = s;
	}

	public void setA(Auto a) {
		this.a = a;
	}
}
