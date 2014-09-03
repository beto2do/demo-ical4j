package com.demo.ical4j



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EventCalendarController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def icalendarService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EventCalendar.list(params), model:[eventCalendarInstanceCount: EventCalendar.count()]
    }

    def show(EventCalendar eventCalendarInstance) {
        respond eventCalendarInstance
    }

    def create() {
        respond new EventCalendar(params)
    }

    @Transactional
    def save(EventCalendar eventCalendarInstance) {
        if (eventCalendarInstance == null) {
            notFound()
            return
        }

        if (eventCalendarInstance.hasErrors()) {
            respond eventCalendarInstance.errors, view:'create'
            return
        }

        eventCalendarInstance.save flush:true
        def html = """
                  <html>
                  <head></head>
                  <body>This is a testing...</body>
                  </html>
                  """
        def testingString = icalendarService.sendVEvent(html,eventCalendarInstance,"created")
        println"${testingString}"

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'eventCalendar.label', default: 'EventCalendar'), eventCalendarInstance.id])
                redirect eventCalendarInstance
            }
            '*' { respond eventCalendarInstance, [status: CREATED] }
        }
    }

    def edit(EventCalendar eventCalendarInstance) {
        respond eventCalendarInstance
    }

    @Transactional
    def update(EventCalendar eventCalendarInstance) {
        if (eventCalendarInstance == null) {
            notFound()
            return
        }

        if (eventCalendarInstance.hasErrors()) {
            respond eventCalendarInstance.errors, view:'edit'
            return
        }

        eventCalendarInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EventCalendar.label', default: 'EventCalendar'), eventCalendarInstance.id])
                redirect eventCalendarInstance
            }
            '*'{ respond eventCalendarInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EventCalendar eventCalendarInstance) {

        if (eventCalendarInstance == null) {
            notFound()
            return
        }

        eventCalendarInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EventCalendar.label', default: 'EventCalendar'), eventCalendarInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventCalendar.label', default: 'EventCalendar'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
