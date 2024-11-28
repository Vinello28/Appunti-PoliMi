import java.util.Scanner;


public class MainMoto {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
        MotorinoC m = new MotorinoC(); 
        Moto m1=new Moto();
        
        
        int v1=0;
        
        System.out.println("inserisci la marca del motorino: " );
        Scanner T=new Scanner(System.in);
        String _marca=T.nextLine(); 
        System.out.println("inserisci la cilindrata del motorino: ");   
        Scanner T1= new Scanner(System.in);
        double _cilindrata = T1.nextDouble();
        System.out.println("inserisci l'anno del motorino: ");   
        Scanner T2= new Scanner(System.in);
        int _anno = T2.nextInt();
        System.out.println("inserisci il modello del motorino:\n ");  
        Scanner T3= new Scanner(System.in);
        String _modello=T3.nextLine(); 
        System.out.println("inserisci la targa del modello:\n ");   
        Scanner T4= new Scanner(System.in);
        String _targa=  T4.nextLine();
   
        
        do              
        {
            
            System.out.println("premi (1) per accendere il motorino");  
            System.out.println("premi (2) per spegnere il motorino");               
            System.out.println("premi (3) per visualizzare i dati del motorino");            
            System.out.println("premi (4) per frenare");            
            System.out.println("premi (5) per accelerare");   
            System.out.println("premi (6) per visualizzare il carburante rimanente");  
            System.out.println("premi (7) per terminare il programma");
            System.out.println("cosa vuoi fare?");
            Scanner ds=new Scanner(System.in);
            v1=ds.nextInt();
            
            switch (v1)
            {
            	
                case 1:    
                    m.Accendi();
                    System.out.println("il motorino è acceso" );
                    
                    
                    break;
                case 3:   
                	System.out.println( "la marca del motorino è:\n" + _marca );
                	System.out.println( "la cilindrata del motorino è:\n" + _cilindrata);
                	System.out.println( "l'anno del motorino è:\n" + _anno);
                	System.out.println( "il modello del motorino è:\n" + _modello);
                	System.out.println( "la targa del motorino è:\n" + _targa);
                
                        
                    break;
                case 2:    
                    m.Spegni();
                    System.out.println("il motorino è spento");
        
                    break;
                case 4:   
                    m.Frena();
                    System.out.println("la velocita è diminuita");
                    
                    break;
                case 5:   
                    m.Accellera();
                    System.out.println("la velocità è aumentata");
                    m1.Accellera();
                    System.out.println("la velocità è aumentata");
                    
                    break;
                case 6:   
                    m1.Consuma();
                    System.out.println( "il carburante rimanente della moto è:\n" + m1.get_carburante());
                    break;

                case 7:   
                    
                    break;
                default:
                	System.out.println("inserire un tasto tra quelli del menù");
                    break;
                    

            }
            
            



        } while (v1 != 6);
        
        
	}

}
