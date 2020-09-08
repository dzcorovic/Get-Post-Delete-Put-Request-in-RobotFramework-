*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${base_url} =  http://thetestingworldapi.com/

*** Test Cases ***
TC_Put_Request
    create session  AddData  ${base_url}
    ${body}=  create dictionary  id=69257  first_name=Testing  middle_name=Def  last_name=World  date_of_birth=12/12/1990
    ${header}=  create dictionary  Content-Type=application/json
    ${response}=  put request  AddData  api/studentsDetails/69257  data=${body}  headers=${header}
    log to console  ${response.status_code}
    log to console  ${response.content}
    ${response1}=  get request  AddData  api/studentsDetails/69257
    log to console  ${response1.content}



