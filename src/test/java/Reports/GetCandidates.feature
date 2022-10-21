Feature: User Assertions
  Background:
    * def datasheet = read('classpath:testData/deleteApi/positive/INT/scenario.csv')
  Scenario Outline: Validate user information

    And match response.response.data[*].firstName contains 'Lloyd'
    And match response.response.data[*].lastName contains 'Ntlemo'
    And match response.response.data[*].contactNumber contains '864689067854'
    And match response.response.data[*].candidateEmail contains 'lloydbunhle@gmail.com'
    And match response.response.data[*].projectName contains '03 May All Devices Test'
    And match response.response.data[*].projectDepartment contains 'Default (available to all users)'
    And match response.response.data[*].projectStatus contains 'ACTIVE'
    And match response.response.data[*].interviewStatus contains 'COMPLETE'
    And match response.response.data[*].customStatus contains 'NONE'
    And match response.response.data[*].interviewDate contains '2021-11-23'
    And match response.response.data[*].averageRating contains '0'
    And match response.response.data[*].introVidWatched contains false
    And match response.response.data[*].wasReset contains false
    And match response.response.data[*].candidateFeedback contains null
    And match response.response.data[*].dropOffProgress contains null
    And match response.response.data[*].setOffQuestion contains null
    And match response.response.data[*].formName contains ''
    And match response.response.data[*].candidateForm.infoDTOS[*].fieldName contains 'Candidate Email'
    And match response.response.data[*].candidateForm.infoDTOS[*].value contains 'lloydbunhle@gmail.com'
    And match response.response.data[*].candidateForm.infoDTOS[*].dataType contains 'TextInput'


    Examples:
      |datasheet|