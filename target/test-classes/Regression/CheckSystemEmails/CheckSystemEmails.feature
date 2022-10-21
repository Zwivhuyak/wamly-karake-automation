Feature: Check System Emails
  Scenario: Check Emails

    Given call read('classpath:../Mailsac/createMailsacEmail.feature')
    Then print email