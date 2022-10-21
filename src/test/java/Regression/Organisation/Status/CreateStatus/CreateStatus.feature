Feature: Create a status
  Background:
    * def datasheet = read('data.csv')

  @Regression
    Scenario Outline: Create the status
      Given url 'https://api.uatwamly.co.za/wamly/v1//organization/<orgId>/status'
      * def username = '<username>'
      * def password = '<password>'
      And call read('classpath:../Authentication/getToken.feature')
      And header Authorization = 'Bearer '+AccessToken
      And call read('../GetAllStatus/GetAllStatus.feature')
      * def j = Java.type('common.ModifyJSON')
      * def bodys2 = j.createStatus(statusResponse,1)
      * def temp = karate.fromString(bodys2)
      Then request temp
      Then method post
      * def createdResponse = response.response
      Then status 200
      Then match response.message == 'Statuses created successfully'
      And call read('../GetAllStatus/GetAllStatus.feature')

      Then match createdResponse[*].statusName contains statusResponse[*].statusName


      Examples:
      |datasheet|
