
public class Moto extends MotorinoC {

	private int _nmarce;
    private int _marcia;
    private int _capserb;
    private int _carburante;
    
	public Moto()  {
		// TODO Auto-generated constructor stub
	}
	
	public Moto (int nm, int m,int cs,int ca)
    {
    	
    	_nmarce=nm;
    	_marcia=m;
    	_capserb=cs;
    	_carburante=ca;
    	_capserb=100;
    	_nmarce=5;
    	_carburante=100;
    }
    
	public int get_nmarce() {
		return _nmarce;
	}

	public void set_nmarce(int _nmarce) {
		this._nmarce = _nmarce;
	}

	public int get_marcia() {
		return _marcia;
	}

	public void set_marcia(int _marcia) {
		this._marcia = _marcia;
	}

	public int get_capserb() {
		return _capserb;
	}

	public void set_capserb(int _capserb) {
		this._capserb = _capserb;
	}

	public int get_carburante() {
		return _carburante;
	}

	public void set_carburante(int _carburante) {
		this._carburante = _carburante;
	}
    
    public void AggiungiMarcia()
    {
    	_marcia++;
    }

    public void DiminuisciMarcia()
    {
    	_marcia--;
    }
    
    public double Accellera() 
    {
        if (_velocita < _cilindrata)
        {
            _velocita= _marcia %_cilindrata; 

        }
        else
        {
            _velocita = _velocita + 0;
        }
        return _velocita;
    }
    
    public double Consuma()
    {
    	_carburante= (int) (_velocita/1000);
    	return _carburante;
    }
    
    public double Rifornisci()
    {
    	_carburante=100;
    	return _carburante;
    }
    
    public double Riserva()
    {
    	if(_carburante<10%_capserb)
    	{
    		_carburante=100;
    		
    	}return _carburante;
    }
}
    	
    
    