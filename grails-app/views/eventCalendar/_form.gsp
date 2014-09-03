<%@ page import="com.demo.ical4j.EventCalendar" %>



<div class="fieldcontain ${hasErrors(bean: eventCalendarInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="eventCalendar.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" maxlength="200" required="" value="${eventCalendarInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventCalendarInstance, field: 'venue', 'error')} required">
	<label for="venue">
		<g:message code="eventCalendar.venue.label" default="Venue" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="venue" maxlength="200" required="" value="${eventCalendarInstance?.venue}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventCalendarInstance, field: 'summary', 'error')} required">
	<label for="summary">
		<g:message code="eventCalendar.summary.label" default="Summary" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="summary" cols="40" rows="5" maxlength="1000" required="" value="${eventCalendarInstance?.summary}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventCalendarInstance, field: 'clazz', 'error')} required">
	<label for="clazz">
		<g:message code="eventCalendar.clazz.label" default="Clazz" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="clazz" maxlength="200" required="" value="${eventCalendarInstance?.clazz}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventCalendarInstance, field: 'organizer', 'error')} required">
	<label for="organizer">
		<g:message code="eventCalendar.organizer.label" default="Organizer" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="organizer" maxlength="200" required="" value="${eventCalendarInstance?.organizer}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventCalendarInstance, field: 'attendees', 'error')} required">
	<label for="attendees">
		<g:message code="eventCalendar.attendees.label" default="Attendees" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="attendees" maxlength="200" required="" value="${eventCalendarInstance?.attendees}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventCalendarInstance, field: 'end', 'error')} ">
	<label for="end">
		<g:message code="eventCalendar.end.label" default="End" />
		
	</label>
	<g:datePicker name="end" precision="day"  value="${eventCalendarInstance?.end}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: eventCalendarInstance, field: 'stamp', 'error')} ">
	<label for="stamp">
		<g:message code="eventCalendar.stamp.label" default="Stamp" />
		
	</label>
	<g:datePicker name="stamp" precision="day"  value="${eventCalendarInstance?.stamp}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: eventCalendarInstance, field: 'begin', 'error')} required">
	<label for="begin">
		<g:message code="eventCalendar.begin.label" default="Begin" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="begin" precision="day"  value="${eventCalendarInstance?.begin}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: eventCalendarInstance, field: 'uuid', 'error')} required">
	<label for="uuid">
		<g:message code="eventCalendar.uuid.label" default="Uuid" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="uuid" required="" value="${eventCalendarInstance?.uuid}"/>

</div>

