
<%@ page import="com.demo.ical4j.EventCalendar" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'eventCalendar.label', default: 'EventCalendar')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-eventCalendar" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-eventCalendar" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list eventCalendar">
			
				<g:if test="${eventCalendarInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="eventCalendar.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${eventCalendarInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventCalendarInstance?.venue}">
				<li class="fieldcontain">
					<span id="venue-label" class="property-label"><g:message code="eventCalendar.venue.label" default="Venue" /></span>
					
						<span class="property-value" aria-labelledby="venue-label"><g:fieldValue bean="${eventCalendarInstance}" field="venue"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventCalendarInstance?.summary}">
				<li class="fieldcontain">
					<span id="summary-label" class="property-label"><g:message code="eventCalendar.summary.label" default="Summary" /></span>
					
						<span class="property-value" aria-labelledby="summary-label"><g:fieldValue bean="${eventCalendarInstance}" field="summary"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventCalendarInstance?.clazz}">
				<li class="fieldcontain">
					<span id="clazz-label" class="property-label"><g:message code="eventCalendar.clazz.label" default="Clazz" /></span>
					
						<span class="property-value" aria-labelledby="clazz-label"><g:fieldValue bean="${eventCalendarInstance}" field="clazz"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventCalendarInstance?.organizer}">
				<li class="fieldcontain">
					<span id="organizer-label" class="property-label"><g:message code="eventCalendar.organizer.label" default="Organizer" /></span>
					
						<span class="property-value" aria-labelledby="organizer-label"><g:fieldValue bean="${eventCalendarInstance}" field="organizer"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventCalendarInstance?.attendees}">
				<li class="fieldcontain">
					<span id="attendees-label" class="property-label"><g:message code="eventCalendar.attendees.label" default="Attendees" /></span>
					
						<span class="property-value" aria-labelledby="attendees-label"><g:fieldValue bean="${eventCalendarInstance}" field="attendees"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventCalendarInstance?.end}">
				<li class="fieldcontain">
					<span id="end-label" class="property-label"><g:message code="eventCalendar.end.label" default="End" /></span>
					
						<span class="property-value" aria-labelledby="end-label"><g:formatDate date="${eventCalendarInstance?.end}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventCalendarInstance?.stamp}">
				<li class="fieldcontain">
					<span id="stamp-label" class="property-label"><g:message code="eventCalendar.stamp.label" default="Stamp" /></span>
					
						<span class="property-value" aria-labelledby="stamp-label"><g:formatDate date="${eventCalendarInstance?.stamp}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventCalendarInstance?.begin}">
				<li class="fieldcontain">
					<span id="begin-label" class="property-label"><g:message code="eventCalendar.begin.label" default="Begin" /></span>
					
						<span class="property-value" aria-labelledby="begin-label"><g:formatDate date="${eventCalendarInstance?.begin}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventCalendarInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="eventCalendar.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${eventCalendarInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventCalendarInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="eventCalendar.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${eventCalendarInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${eventCalendarInstance?.uuid}">
				<li class="fieldcontain">
					<span id="uuid-label" class="property-label"><g:message code="eventCalendar.uuid.label" default="Uuid" /></span>
					
						<span class="property-value" aria-labelledby="uuid-label"><g:fieldValue bean="${eventCalendarInstance}" field="uuid"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:eventCalendarInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${eventCalendarInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
