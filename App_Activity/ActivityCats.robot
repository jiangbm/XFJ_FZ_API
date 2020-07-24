*** Settings ***
Documentation                           该文档是获取活动分类接口用例文档
Resource                                ../App_Activity/Activity_Common.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     互动活动/活动分类接口（丁希）
...                                     作者：张鹏

*** Variables ***
${LEN_LIST}                             0
#${NAME}                                活动
${RESULT}                               -1

*** Keywords ***


*** Test Cases ***
获取活动分类成功
    Get Activity Cats
    Fapi Status Should Be               ${RESULT}
#    Should Be Equal As Strings          ${response_data[0].name}                ${NAME}