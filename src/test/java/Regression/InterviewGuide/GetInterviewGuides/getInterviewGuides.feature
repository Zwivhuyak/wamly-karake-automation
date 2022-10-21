Feature: Interview Guides
  Background:
    * def datasheet = read('data.csv')

    @Regression
    Scenario Outline: Get All interview guides from organization: <organizationName>
      Given url 'https://api.uatwamly.co.za/wamly/v1//organization/getInterviewGuideDashboard/<organizationId>'
      * def username = '<Email>'
      * def password = '<Password>'
      And call read('classpath:../Authentication/getToken.feature')
      And header Authorization = 'Bearer '+AccessToken

      Then method get
      And status 200
      And match response.message == 'Interview Guides Found'
      And print response

      Examples:
      |datasheet|