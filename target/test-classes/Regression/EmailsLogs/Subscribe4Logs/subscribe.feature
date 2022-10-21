Feature: Email Logs
  Background:
    * def datasheet = read('data.csv')
  Scenario Outline: Subscribe to emails logs

    Given url 'https://api.uatwamly.co.za/wamly/v1/email/log/8e7466c6-a697-4b3b-a4b0-6998acaed6e8/subscription'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken
    Then method get
    Then print response

    Examples:
    |datasheet|