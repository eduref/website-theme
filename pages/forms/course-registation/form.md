---
title: Course Registration
form:
    name: course-registration
    fields:
        - name: name
          label: Name
          placeholder: Enter your name
          autofocus: on
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
        # - email:
        #     from: "{{ config.plugins.email.from }}"
        #     to:
        #       - "{{ config.plugins.email.from }}"
        #       - "{{ form.value.email }}"
        #     subject: "[Feedback] {{ form.value.name|e }}"
        #     body: "{% include 'forms/data.html.twig' %}"
        - save:
            filename: "{{ form.value.course }}.csv"
            body: "{% include 'forms/data.csv.twig' %}"
            operation: add
        - message: Registration successful!
        # - display: blog

---