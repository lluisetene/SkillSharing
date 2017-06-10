package es.uji.ei1027.skillsharing.model;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class NotificarColaboraciones {

	private String correo;
	private String password;
	private Properties props;
	
	public NotificarColaboraciones() {
		
	props = new Properties();
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.starttls.enable", "true");
	props.put("mail.smtp.host", "smtp.gmail.com");
	props.put("mail.smtp.port", "587");
	
	correo = "cuentaskillsharing@gmail.com";
	password = "skillsharing@1";
	
	}
	
	
	public void notificarColaboracion(String ofertante, String demandante, Collaboration colaboracion, String nombreOferta, String nombreDemanda) {
		
        String subject = "Colaboración Establecida";
        String mensage = 
        		"Se acaba de establecer una colaboración entre " + ofertante + " y " + demandante + " con las siguientes características:\n"
        		+ "ID de la colaboración: " + colaboracion.getIdCollaboration() + "\n"
        		+ "Nombre de la oferta realizada: " + nombreOferta + "\n"
        		+ "Nombre de la demanda realizada: "+ nombreDemanda + "\n"
        		+ "Fecha de inicio de la colaboración: " + colaboracion.getBeginningDate() + "\n"
        		+ "Fecha de finalización de la colaboración: " + colaboracion.getEndingDate();
        
 
        
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(correo, password);
                    }
                });
 
        try {
 
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(correo));
            message.setRecipients(Message.RecipientType.TO, new InternetAddress[] { 
            		new InternetAddress(ofertante),
            		new InternetAddress(demandante)
            });
            message.setSubject(subject);
            message.setText(mensage);
 
            Transport.send(message);
            System.out.println("Mensaje enviado a " + ofertante + " y " + demandante);
 
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
	}
	
	
}
