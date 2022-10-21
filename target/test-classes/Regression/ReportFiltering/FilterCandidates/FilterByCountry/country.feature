Feature: Filter Candidates by Country
  Background:
    * def datasheet = read('data.csv')
    * def bodys = read('body.json')
    * def manipulate = Java.type('common.manipulateCountry')
  @FilterCandidates
  Scenario Outline: Filter Candidates using Country
    Given url 'https://api.uatwamly.co.za/wamly/v1/report/search/candidates'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken

    Then set bodys.organizationId = '<organizationId>'
    Then set bodys.fields.id = '<superCId>'
    Then set bodys.fields.responses.id = '<countryId>'
    Then set bodys.fields.responses.value = '<value>'
    Then set bodys.fields.responses.selected = <selected>

    Then request bodys
    Then method post
    Then status 200
    * def sw = manipulate.candidateForm(response.response.data)
    And print sw
    Examples:
      |datasheet|


