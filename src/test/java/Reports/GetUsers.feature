Feature: User Assertions
  Background:
    * def datasheet = read('classpath:testData/deleteApi/positive/INT/scenario.csv')
  Scenario Outline: Validate user information

    And match response.response.data[*].name contains 'Stima'
    And match response.response.data[*].surname contains 'Mollo'
    And match response.response.data[*].mobile contains '0723456777'
    And match response.response.data[*].email contains 'lothar@commandquality.co.za'
    And match response.response.data[*].status contains 'ACTIVE'
    And match response.response.data[*].dateAdded contains null
    And match response.response.data[*].lastModified contains '2020-11-22'
    And match response.response.data[*].lastLogin contains '2021-12-17'
    And match response.response.data[*].departments[*] contains 'Development'
    And match response.response.data[*].userProjects[*].projectName contains 'Okay'
    And match response.response.data[*].userProjects[*].status contains 'DRAFT'
    And match response.response.data[*].userProjects[*].creator contains false
    And match response.response.data[*].commentPropensity contains 0.0


    Examples:
      |datasheet|