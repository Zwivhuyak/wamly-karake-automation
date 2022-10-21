Feature: Super User
  Background:
    * def datasheet = read('data.csv')
    * def requestBody = read('body.json')
    * def method = Java.type('common.JSONArray')
    * def fun =
    """
  {
  "org":[]
  }
  """
  @bootcamp
  Scenario Outline: Search using the following fields : <field>


    Then set fun.org[] = 'ggg'
    Then print fun








    Examples:
    |datasheet|