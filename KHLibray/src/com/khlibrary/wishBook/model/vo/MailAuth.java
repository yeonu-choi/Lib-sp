package com.khlibrary.wishBook.model.vo;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
 
public class MailAuth extends Authenticator{
    
    PasswordAuthentication pa;
    
    public MailAuth() {
        String mail_id = "youngyi933@gmail.com";
        String mail_pw = "qwewer123456!";
        
        pa = new PasswordAuthentication(mail_id, mail_pw);
    }
    
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}
