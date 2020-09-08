*** Settings ***
Library  RequestsLibrary
Library  Collections


*** Variables ***
${base_url}  http://thetestingworldapi.com/


*** Test Cases ***
TC1_Get_Request
    create session  Get_Student_Details  ${base_url}
    ${response}=  get request  Get_Student_Details  api/studentsDetails
    log to console  ${response.content}
    log to console  ${response.status_code}

