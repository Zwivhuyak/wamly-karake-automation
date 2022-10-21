# new feature
# Tags: optional

Feature: A description
  Background:
    * url BaseUrl
  Scenario: A scenario to get a form by organization
    Given path '/form/'+orgID+'/'+formID
    And header Authorization = 'Bearer '+AccessToken
    When method get
    Then status 200
    And print response
    Then match response.code == '200'
    Then match response.response.id == formID
    Then match response.response.wamlyDefault == false
    Then match response.response.organizationId contains orgID
    Then match response.response.name contains '#string'
    Then match response.response.description contains '#string'
    Then match response.response.fields == '#[5]'
    Then match response.response.fields[0].id =='#string'
    Then match response.response.fields[0].dataType =='#string'
    Then match response.response.fields[0].systemField == true
    Then match response.response.fields[0].index == 0
    Then match response.response.fields[0].field == true
    Then match response.response.fields[1].id =='#string'
    Then match response.response.fields[1].dataType =='#string'
    Then match response.response.fields[1].systemField == true
    Then match response.response.fields[1].index == 1
    Then match response.response.fields[1].field == true
    Then match response.response.fields[2].id =='#string'
    Then match response.response.fields[2].dataType =='#string'
    Then match response.response.fields[2].systemField == true
    Then match response.response.fields[2].index == 2
    Then match response.response.fields[2].field == true
    Then match response.response.fields[3].id =='#string'
    Then match response.response.fields[3].dataType =='#string'
    Then match response.response.fields[3].systemField == true
    Then match response.response.fields[3].index == 3
    Then match response.response.fields[3].field == true
    Then match response.response.status contains 'ACTIVE'
    Then match response.response.default == false
    Then match response.message contains 'Form retrieved successfully'