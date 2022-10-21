Feature: A description
    Background:
        * url BaseUrl
    Scenario: A scenario to delete a form
        Given path '/form/'+orgID+'/'+formID
        And header Authorization = 'Bearer '+AccessToken
        When method delete
        Then status 200
        And print response
        Then response.code == '200'
        Then response.response == formID
        Then response.message == 'Form deleted successfully.'