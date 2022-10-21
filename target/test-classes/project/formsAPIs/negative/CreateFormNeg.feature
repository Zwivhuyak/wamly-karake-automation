Feature: creating a form

    Background:
        * url BaseUrl
        * def body = read('classpath:baserequest/createForm.json')
        * def datasheet = read('classpath:testData/FormsAPI/negative/INT/createForm.csv')

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
        And match response.message contains '<ErrorMessage>'
        Examples:
            |datasheet|