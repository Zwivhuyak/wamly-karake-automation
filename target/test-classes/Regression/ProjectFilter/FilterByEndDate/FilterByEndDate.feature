Feature: Filter By End Date
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')
#    * def object = Java.type('common.ModifyJSON')
#    * def datee = object.convertDate()

  @Sprint
  Scenario Outline: Filter Projects By End Date
    Given url 'https://api.uatwamly.co.za/wamly/v1/project/filter'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    Then bodys.organizationId = '<organizationId>'
    Then bodys.endDate = '<endDate>'

    Then request bodys
    Then method post
    Then status 200
    Then match response.response[*].end contains '<endDate>'
    Then print response
    And call read('classpath:../Regression/RememberFilterBy/RememberFilterByEndDate/getFilterByEndDate.feature')
    Examples:
      |datasheet|