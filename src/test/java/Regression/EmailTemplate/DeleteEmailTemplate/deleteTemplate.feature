Feature: Delete email template
  Background:
    * def datasheet = read('data.csv')

  @EmailTemplate
  Scenario Outline: Delete existing email template
    Given url 'https://api.uatwamly.co.za/wamly/v1//organization/dc141d52-2a86-4550-a146-ca2867a18f71/template/<guideId>'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    And method delete
    And status 200
    And print response

    Examples:
      |datasheet|