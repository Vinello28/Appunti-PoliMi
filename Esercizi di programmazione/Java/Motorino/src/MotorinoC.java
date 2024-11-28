
public class MotorinoC {

	protected int _cilindrata;
    private int _anno;
    private String _marca;
    private String _targa;
    private boolean _acceso;
    protected double _velocita;
    private double _velocitamax;
    
    public MotorinoC(int a, String m,String ta,boolean acc,double vel,double vmax)
    {
    	_anno=a;
    	_marca=m;
    	_targa=ta;
    	_acceso=acc;
    	_velocita=vel;
    	_velocitamax=vmax;
    }
    public MotorinoC() 
    {
    	_cilindrata=125;
        _velocita = 0;
        _acceso = false;
    }
    
    public void Accendi() 
    {
        _acceso = true;   

    }
    
    public double Accellera() 
    {
        if (_velocita < _cilindrata)
        {
            _velocita = _velocita + _velocita *2/100; 

        }
        else
        {
            _velocita = _velocita + 0;
        }
        return _velocita;
    }
    
    public double Frena()        

    {
        _velocita = _velocita - _velocita * 1 / 100;     
        return _velocita;                                
    }
    
    public boolean Spegni()   
    {

        if (_velocita == 0)    

        {

            _acceso = false;        

        }
        return _acceso;      
    }

	public int get_cilindrata() {
		return _cilindrata;
	}

	public void set_cilindrata(int _cilindrata) {
		this._cilindrata = _cilindrata;
	}

	public int get_anno() {
		return _anno;
	}

	public void set_anno(int _anno) {
		this._anno = _anno;
	}

	public String get_marca() {
		return _marca;
	}

	public void set_marca(String _marca) {
		this._marca = _marca;
	}

	public String get_targa() {
		return _targa;
	}

	public void set_targa(String _targa) {
		this._targa = _targa;
	}

	public boolean is_acceso() {
		return _acceso;
	}

	public void set_acceso(boolean _acceso) {
		this._acceso = _acceso;
	}

	public double get_velocita() {
		return _velocita;
	}

	public void set_velocita(double _velocita) {
		this._velocita = _velocita;
	}

	public double get_velocitamax() {
		return _velocitamax;
	}

	public void set_velocitamax(double _velocitamax) {
		this._velocitamax = _velocitamax;
	}
    
}
