package com.bank;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Log {
	File file = new File("log.txt");
	Calendar cal = Calendar.getInstance();
	
    pointcut success() : call(void Bank.moneyMakeTransaction());
    after() : success() {
    //Aspecto ejemplo: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas. //
    	String cadena = "Deposito realizado - "+ cal.getTime();
    	System.out.println(cadena);
    	writeFile(cadena);
    	
    }
    
    public void writeFile(String linea) {
    	try {
			FileWriter fw = new FileWriter(file, true);
			fw.write(linea + "\n");
			fw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

}
