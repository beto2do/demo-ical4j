package com.demo.ical4j

import net.fortuna.ical4j.model.property.*
import net.fortuna.ical4j.model.*
import net.fortuna.ical4j.model.component.*
import javax.activation.MailcapCommandMap
import javax.activation.MimetypesFileTypeMap
import javax.mail.BodyPart
import javax.mail.Message
import javax.mail.Multipart
import javax.mail.Session
import javax.mail.Transport
import javax.mail.internet.InternetAddress
import javax.mail.internet.MimeBodyPart
import javax.mail.internet.MimeMessage
import javax.mail.internet.MimeMultipart
import javax.mail.Authenticator
import javax.mail.PasswordAuthentication

class IcalendarService {

  def grailsApplication

  //Method to generate icalendar file
  def createVEvent ( event ) {
    def builder = new ContentBuilder()
    def calendar = builder.calendar() {
      prodid(':-//myCompany Inc//myCompany Calendar //EN')
      version('2.0')
      calscale('GREGORIAN')
      method('REQUEST')
      vevent() {
        dtstart(new DtStart(new DateTime(event.begin)))
        dtend(new DtEnd(new DateTime(event.end)))
        dtstamp(new DtStamp(new DateTime(new Date())))
        organizer(new Organizer(URI.create(event.organizer)))
        uid(event.uuid)
        event.attendees.split(',').each{email ->
          Attendee attendeeInstance = new Attendee(URI.create("mailto:${email}"))
          attendeeInstance.getParameters().add(net.fortuna.ical4j.model.parameter.CuType.INDIVIDUAL)
          attendeeInstance.getParameters().add(net.fortuna.ical4j.model.parameter.Role.REQ_PARTICIPANT)
          attendeeInstance.getParameters().add(net.fortuna.ical4j.model.parameter.PartStat.NEEDS_ACTION)
          attendeeInstance.getParameters().add(net.fortuna.ical4j.model.parameter.Rsvp.TRUE)
          attendee(attendeeInstance)
        }
        lastmodified(new LastModified(new DateTime(event?.lastUpdated?:new Date())))
        created(new Created(new DateTime(event?.dateCreated?:new Date())))
        location(new Location(event.venue))
        sequence(new Sequence())
        status(new Status('CONFIRMED'))
        summary(new Summary(event.summary))
        transp(new Transp('OPAQUE'))
        priority(new Priority(5))
      }
    }
    calendar.toString()
  }

  //Method to send event by email
  def sendVEvent ( html,event,action ){
    Properties props = new Properties()
    println "host --->>>"+grailsApplication.config.grails.mail.host
    println "username --->>>"+grailsApplication.config.grails.mail.username
    println "password --->>>"+grailsApplication.config.grails.mail.password
    props.put("mail.smtp.host", grailsApplication.config.grails.mail.host)
    props.put("mail.smtp.port", grailsApplication.config.grails.mail.port)
    props.put("mail.smtp.auth",true)
    props.put("mail.smtp.starttls.enable", true)
    Session session = Session.getInstance(props,
      new Authenticator(){
        protected PasswordAuthentication getPasswordAuthentication() {
          return new PasswordAuthentication(grailsApplication.config.grails.mail.username, grailsApplication.config.grails.mail.password)
        }
      })
    session.setDebug(false)

    def calendar_str = createVEvent(event)
    def mailfrom =  "notification@myCompany.com"

    MimetypesFileTypeMap mimetypes = (MimetypesFileTypeMap)MimetypesFileTypeMap.getDefaultFileTypeMap()
    mimetypes.addMimeTypes("text/calendar ics ICS")

    MailcapCommandMap mailcap = (MailcapCommandMap) MailcapCommandMap.getDefaultCommandMap()
    mailcap.addMailcap("text/calendar;; x-java-content-handler=com.sun.mail.handlers.text_plain")
    Multipart multipart = new MimeMultipart("alternative")

    BodyPart calendarPart = new MimeBodyPart()
    calendarPart.addHeader("Content-Class", "urn:content-classes:calendarmessage")
    calendarPart.addHeader("Content-Type", "text/plain; charset='UTF-8'")
    calendarPart.addHeader("Content-Transfer-Encoding", "base64")
    calendarPart.setContent(calendar_str, "text/calendar;method=REQUEST; charset=utf-8")
    MimeBodyPart descriptionPart = new MimeBodyPart()
    descriptionPart.setContentID("<Event from myCompany>")
    descriptionPart.setDisposition("inline")
    descriptionPart.setContent(html, "text/html; charset=utf-8")

    multipart.addBodyPart(descriptionPart)
    multipart.addBodyPart(calendarPart)

    def fromString = 'Event - '+event.title
    Message message = new MimeMessage(session)
    message.addHeaderLine("method=REQUEST")
    message.addHeaderLine("charset=UTF-8")
    message.addHeaderLine("component=VEVENT")
    message.setFrom(new InternetAddress(mailfrom, fromString))
    def listAddress = [event.organizer]
    event.attendees.split(',').each{email ->
      listAddress.add(new InternetAddress(email))
    }
    message.setRecipients(Message.RecipientType.TO,listAddress.join(","))
    message.setReplyTo(new InternetAddress(mailfrom, "Test"))
    message.setSubject("[myCompany - Event ] "+event.title+" was "+action,"utf-8")
    message.setContent(multipart,"charset=utf-8")
    Transport transport = session.getTransport("smtp")
    transport.connect()
    transport.send(message)
    transport.close()
  }  
}
