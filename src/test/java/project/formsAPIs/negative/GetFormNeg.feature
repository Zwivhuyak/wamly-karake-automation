Feature: A description
  Background:
    * url BaseUrl
    * def datasheet = read('classpath:testData/FormsAPI/negative/INT/scenario.csv')
  Scenario Outline: <scenarioDescription>
    * def organizationId = '<organizationId>'
#    Getting the default form in the organization 
    Given path '/form/'+organizationId+'/default'
    * def username = '<username>'
    * def password = '<password>'
    * def user_pool = '<user_pool>'
    * def client_id = '<client_id>'
    And call read('getToken.feature')
    And header Authorization = 'Bearer '+AccessToken
    When method get
    Then status 200
    And print response
    And match response.response.organizationId == organizationId
    * def formID = response.response.id
    * def orgID = response.response.organizationId
#changing status of a default form
    Given path '/form/'+orgID+'/'+formID+'/status'
    And header Authorization = 'Bearer '+AccessToken
    When method get
    Then match response.message == '<ErrorMessageForStatus>'
#    Deleting Form a default form

    Given path '/form/'+orgID+'/'+formID
    And header Authorization = 'Bearer '+AccessToken
    When method delete
    Then match response.message == '<ErrorMessageForDeleting>'
    Examples:
      |datasheet|
