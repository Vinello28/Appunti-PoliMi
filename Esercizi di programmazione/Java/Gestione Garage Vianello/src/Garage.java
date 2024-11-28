import java.util.Random;

public class Garage 
{

	public static void main(String[] args) 
	{
		Semaforo sem=new Semaforo(3);
		Automezzo[] A= new Automezzo[17];
		Random R= new Random();
		int tmp;
		int x1 = 0;
		int x2 = 0;
		int x3 = 0;
		
		int i = 0;
		do
		{
			tmp = R.nextInt(4);
			
			if (tmp == 0 && x1 <= 10) 
			{
				A[i]= new Auto("A_"+i,sem);
				x1++;
			}
			else 
			{
				if(tmp == 1 && x2 <= 5) 
				{
					A[i]= new Camion("C_"+i,sem);
					x2++;
				}
				else 
				{
					if(tmp == 2 && x2 <= 5) 
					{
						A[i]= new Autobus("B_"+i,sem);
						x2++;
					}
					else 
					{
						if(tmp == 3 && x3 <= 2) 
						{
							A[i]= new Mezzi_Speciali("M_"+i,sem);
							x3++;
						}
					}
				}
				
			}
			i++;
		}while (i < 17);
		
		for (int j=0;j<17;j++) 
		{
			A[j].start();
		}
	}

}
