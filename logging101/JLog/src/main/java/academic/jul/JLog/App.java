package academic.jul.JLog;
import java.util.logging.*;

public class App 
{
	private final static Logger logger = Logger.getLogger(App.class.getName());
	
	public void doOp(){
		logger.warning("Warning msg jul.JLog ");
		logger.info("Info msg jul.JLog ");
		logger.severe("Severe msg jul.JLog ");
		logger.fine("Fine msg jul.JLog");
		
	}
    public static void main( String[] args )
    {
    		System.out.println( "J logging" );
    		new App().doOp();
        
    }
}
