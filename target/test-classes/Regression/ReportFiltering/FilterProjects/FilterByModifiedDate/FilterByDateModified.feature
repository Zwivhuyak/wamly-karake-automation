Feature: Filter Projects by last modified date
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')
    * def result = Java.type('common.RandomSelectDate')
    * def randomDate = Java.type('common.RandomSelectDate')
  Scenario Outline: Filter Projects using last modified date
    Given url 'https://api.uatwamly.co.za/wamly/v1//report/search/projects'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    Then set bodys.organizationId = '<organizationId>'
#

    Then request bodys
    Then method post
    * def result = response.response.data
    * def dateList = randomDate.generateLastModified(result)
    * def newDate = randomDate.selectLastModified(dateList)

    Then status 200
    Then match response.response.data[0].lastModified == newDate
    Then match response.message == 'Projects searched successfully'
    And print response

    Examples:
      |datasheet|


