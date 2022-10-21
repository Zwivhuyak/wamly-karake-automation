Feature: Filter Projects by Date created
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')
    * def randomDate = Java.type('common.RandomSelectDate')
  Scenario Outline: Filter Projects using Date created
    Given url 'https://api.uatwamly.co.za/wamly/v1//report/search/projects'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    Then set bodys.organizationId = '<organizationId>'
    Then set bodys.dateCreated = '<dateCreated>'

    Then request bodys
    Then method post
    * def result = response.response.data
    * def dateList = randomDate.generateDateCreated(result)
    * def newDate = randomDate.selectDateCreated(dateList)
    Then status 200
    Then match response.response.data[*].dateCreated contains newDate
    Then match response.message == 'Projects searched successfully'
    And print response

    Examples:
      |datasheet|