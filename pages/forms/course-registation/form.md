---
title: Course Registration
form:
    name: course-registration
    fields:
        - name: name
          label: Name
          placeholder: Enter your name
          autocomplete: on
          type: text
          validate:
            required: true

        - name: email
          label: Email
          placeholder: Enter your email address
          type: email
          validate:
            required: true
        
        - name: course
          type: hidden
          default: "invalid_submission"

    buttons:
        - type: submit
          value: Submit
        - type: reset
          value: Reset

    process:
        - email:
            from: "{{ config.plugins.email.from }}"
            to:
              - "{{ form.value.email }}"
            subject: "EduRef Course Confirmation"
            body: "{% include 'forms/confirm-participant.html.twig' %}"
        - email:
            from: "{{ config.plugins.email.from }}"
            to:
              - "{{ config.plugins.email.to }}"
            subject: "[Course Registration] {{ form.value.name|e }}"
            body: "{% include 'forms/confirm-self.html.twig' %}"
        - save:
            filename: "{{ form.value.course }}.csv"
            body: "{% include 'forms/data.csv.twig' %}"
            operation: add
        - message: Registration successful!
        # - display: blog

---