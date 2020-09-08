*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary

*** Variables ***
${base_url}  http://thetestingworldapi.com/

*** Test Cases ***
TC_Post_Request
    create session  AddData  ${base_url}
    ${body}=  create dictionary  first_name=Testing  middle_name=Abc  last_name=World  date_of_birth=12/12/1990
    ${header}=  create dictionary  Content-Type=application/json
    ${response}=  post request  AddData  api/studentsDetails  data=${body}  headers=${header}

    ${code}=  convert to string  ${response.status_code}
    should be equal  ${code}  201

    log to console  ${response.status_code}
    log to console  ${response.content}