Feature: Update email template
  Background:
    * def datasheet = read('data.csv')
    * def body = read('body.json')

  @EmailTemplate
    Scenario Outline: Update existing email template
      Given url 'https://api.uatwamly.co.za/wamly/v1//templates/<organizationId>/updateTemplate/<guideId>'
      * def username = '<Email>'
      * def password = '<Password>'
      And call read('classpath:../Authentication/getToken.feature')
      And header Authorization = 'Bearer '+AccessToken

      Then body.emailContent = '<emailContent>'
      Then body.name = '<name>'
      Then body.invitation = <invitation>

      Then request body
      And method put
      And status 200
      And print response

      Examples:
      |datasheet|