public class EventBuilder 
{
    Event event;

    public EventBuilder() {
        this.event = new Event();
    }

    public EventBuilder withSubject(String subject) {
        this.event.Subject = subject;
        return this;
    }

    public EventBuilder withContactType(String contactType) {
        this.event.ContactType__c = contactType;
        return this;
    }

    public EventBuilder withDescription(String description) {
        this.event.Description = description;
        return this;
    }

    public EventBuilder withWhatId(SObject record) {
        this.event.WhatId= record.Id;
        return this;
    }

    public EventBuilder withStartDateTime(Datetime startDateTime) {
        this.event.StartDateTime = startDateTime;
        return this;
    }

    public EventBuilder withEndDateTime(Datetime endDateTime) {
        this.event.EndDateTime = endDateTime;
        return this;
    }

    public Event build() {
        return event;
    }
}