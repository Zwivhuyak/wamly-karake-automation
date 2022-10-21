# new feature
# Tags: optional

Feature: creating a form

  Background:
    * url BaseUrl
    * def body = read('classpath:baserequest/createForm.json')
    * def datasheet = read('classpath:testData/FormsAPI/positive/INT/scenario.csv')

  Scenario Outline: <scenarioDescription>

    Given path '<endpoint>'
    When request body
    * def username = '<username>'
    * def password = '<password>'
    * def user_pool = '<user_pool>'
    * def client_id = '<client_id>'
    And set body.description = '<FormDescription>'
    And set body.name = '<FormName>'
    And set body.organizationId = '<organizationId>'
    And set body.fields[0].name = '<FieldName>'
    And call read('getToken.feature')
    And header Authorization = 'Bearer '+AccessToken
    When method post
    And print response
    Then status 200
    Then match response.code == '200'
    Then match response.response.id == '#string'
    Then match response.response.wamlyDefault == false
    Then match response.response.organizationId contains '<organizationId>'
    Then match response.response.name contains '<FormName>'
    Then match response.response.description contains '<FormDescription>'
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
    Then match response.response.status == 'ACTIVE'
    Then match response.response.default == false
    * def orgID = response.response.organizationId
    * def formID = response.response.id
    And call read('getFormsByOrg.feature')
    And call read('getForm.feature')
    And  call read('getOrgDefaultForm.feature')
    And  call read('deleteForm.feature')
    Examples:
   |datasheet|
