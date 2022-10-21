 Feature: Project Filtering
  Background:
    * def data = read('data.csv')
    * def RequestBody = read('Body.json')
   @Regression
  Scenario Outline: Filter Project using : <FieldFilter> = <FilterValue>

    Given url 'https://api.uatwamly.co.za/wamly/v1/project/filter'
    * def username = '<Email>'
    * def password = '<Password>'
    And call read('classpath:../Authentication/getToken.feature')
    And header Authorization = 'Bearer '+AccessToken
    Then request RequestBody
    When set RequestBody.organizationId = '<OrgId>'
    When set RequestBody.<FieldFilter> = '<FilterValue>'
    Then print RequestBody
    Then method post
    Then status 200
    Then match response.response[*].<FieldFilter> contains '<FilterValue>'
    Then print response
    And call read('SavedFilter.feature')
    Then match response.response.<FieldFilter> contains '<FilterValue>'


    Examples:
    |data|
