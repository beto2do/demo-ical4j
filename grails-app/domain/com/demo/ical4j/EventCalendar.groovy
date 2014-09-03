package com.demo.ical4j

class EventCalendar {

  String uuid = UUID.randomUUID().toString().replace('-','')[0..15]
  String title
  String venue
  String summary
  String clazz
  String organizer
  String attendees

  Date begin
  Date end
  Date stamp

  Date dateCreated
  Date lastUpdated

  static constraints = {
    title blank:false, size:1..200
    venue blank:false, size:1..200
    summary blank:false, size:1..1000
    clazz blank:false, size:1..200
    organizer email: true, blank:false, size:1..200
    attendees blank:false, size:1..200
    end nullable:true
    stamp nullable:true
  }
}
