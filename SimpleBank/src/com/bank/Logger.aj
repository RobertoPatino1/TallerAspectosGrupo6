package com.bank;

import java.io.File;
import java.util.Calendar;

public aspect Logger {
	File file = new File("log.txt");
	Calendar today = Calendar.getInstance();
    pointcut success() : call(* create*(..) );
    after() : success() {
    //Aspecto ejemplo: solo muestra este mensaje después de haber creado un usuario 
    	System.out.println("**** User created ****");
    }
    pointcut Transaccion() : call(* moneyMakeTransaction*(..) );
    after() : success() {
    	System.out.println("**** Transaccion realizada ****");
    }
    pointcut Retiro() : call(* moneyWithdrawal*(..) );
    after() : success() {
    	System.out.println("**** Retiro Exitoso ****");
    }
}
