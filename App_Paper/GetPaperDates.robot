*** Settings ***
Documentation                           该文档是读取期刊列表接口用例文档
Resource                                ../App_Paper/PaperArticle_Common.robot
Suite Setup                             Create Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     数字报（李昊）
...                                     作者：温怡春

*** Variables ***
${PAPERID}                              1
${PAPERID0}                             10  
${VERSION}                              1595865600000
${VERSION0}                             0
${DATES0}                               []
${COUNT}                                5

*** Test Cases ***
读报纸下的期刊列表，返回数据成功
    Get Paper Dates                     ${paperid}
    ...                                 ${count}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed
    Should Be Equal As Strings          ${response_data.version}                ${version}

报纸期刊列表下无数据，返回数据为空
    Get Paper Dates                     ${paperid0}
    ...                                 ${count}
    Fapi Status Should Be Succeed
    Fapi Request Should Be Succeed
    Should Be Equal As Strings          ${response_data.version}                ${version0}
    Should Be Equal As Strings          ${response_data.dates}                  ${dates0}