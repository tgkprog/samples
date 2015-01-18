package academic.log4j2.L2;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
public class App 
{
	private static final Logger logger = LogManager.getLogger(App.class);
	
	public void doIt(){
		
		logger.warn("Warn - log4j2");
		logger.info("info - log4j2");
		logger.fatal("fatal");
		logger.debug("debug - log4j2");
		logger.error("error - log4j2");
	}
    public static void main( String[] args )
    {
        System.out.println( "Log4j2" );
        (new App()).doIt();
    }
}
