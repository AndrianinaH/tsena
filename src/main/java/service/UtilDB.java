package service;

import java.math.RoundingMode;
import java.text.NumberFormat;

public class UtilDB 
{
	public  static String formatNumber(double nb)
	{
		NumberFormat numberFormat_ = NumberFormat.getInstance(java.util.Locale.FRENCH);
	    
	    numberFormat_.setRoundingMode(RoundingMode.HALF_DOWN);
	    numberFormat_.setMinimumIntegerDigits(2);
	    numberFormat_.setMaximumIntegerDigits(20);
	    return numberFormat_.format(nb);
	}
}
