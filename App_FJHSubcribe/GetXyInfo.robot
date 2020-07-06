*** Settings ***
Documentation                           查看翔宇号详情空间接口
Resource                                ../App_FJHSubcribe/SubcribeCommon.robot
Force Tags                              冒烟集-新福建App     查看翔宇号详情空间接口/互动订阅(林升)
...                                     作者：张鹏
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions

*** Variables ***
${ID0}                                  57
${ID1}                                  123456
${RESULT}                               福建交警
${LIST}                               0

*** Keywords ***


*** Test Cases ***
输入正确的翔宇号ID查看详情空间，接口返回成功
    Get Xy Info                         ${ID0}
    Should Be Equal As Strings          ${response_data.topic}                   ${RESULT}

输入错误的翔宇号ID查看详情空间，接口返回成功
    Get Xy Info                         ${ID1}
    Should Be Equal As Strings          ${response_data.articleCount}           ${LIST}
