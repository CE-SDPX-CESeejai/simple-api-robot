*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${API_URL}    http://127.0.0.1:5000

*** Test Cases ***

Verify Addition with Integers
    [Documentation]
    ${response}    GET    ${API_URL}/plus/5/6
    Status Should Be    200    ${response}
    ${json}    Set Variable    ${response.json()}
    Should Be Equal As Numbers    ${json["result"]}    11

Verify Addition with Floats
    [Documentation]
    ${response}    GET    ${API_URL}/plus/5.5/2.5
    Status Should Be    200    ${response}
    ${json}    Set Variable    ${response.json()}
    Should Be Equal As Numbers    ${json["result"]}    8.0

Verify Addition with Mixed Integers and Floats
    [Documentation]
    ${response}    GET    ${API_URL}/plus/7/2.3
    Status Should Be    200    ${response}
    ${json}    Set Variable    ${response.json()}
    Should Be Equal As Numbers    ${json["result"]}    9.3

Verify Negative Numbers
    [Documentation]
    ${response}    GET    ${API_URL}/plus/-5/-3
    Status Should Be    200    ${response}
    ${json}    Set Variable    ${response.json()}
    Should Be Equal As Numbers    ${json["result"]}    -8

Verify Zero Addition
    [Documentation]
    ${response}    GET    ${API_URL}/plus/0/0
    Status Should Be    200    ${response}
    ${json}    Set Variable    ${response.json()}
    Should Be Equal As Numbers    ${json["result"]}    0
Verify Invalid Input
    [Documentation]
    ${response}    GET    ${API_URL}/plus/abc/5    expected_status=400
    ${json}    Set Variable    ${response.json()}
    Should Contain    ${json["error"]}    Invalid input


