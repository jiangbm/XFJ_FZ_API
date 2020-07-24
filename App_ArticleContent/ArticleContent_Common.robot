*** Settings ***
Documentation                           该文档是获取稿件详情模块接口用例文档
Resource                                ../Common/Common.robot
Library                                 ../Secret/XFJ_Des.py
Library                                 ../Secret/authen.py
Force Tags                              冒烟集-新福建APP     稿件详情相关接口（赖厚泽）
...                                     作者：张鹏

*** Variables ***
${GETARTICLECONTENT_URI}                /getArticleContent
${EVENT_URI}                            //event
${SITEID}                               1
${TYPE}                                 0                   #稿件类型
${EVENTTYPE}                            2                   #分享事件
${CHANNEL}                              1

*** Keywords ***
Get Article Content
    [Documentation]                     查看稿件详情接口
    [Arguments]                         ${articleid}
    ...                                 ${siteid}=${SITEID}
    ${secretinfo} =                     sign
    ${authtoken} =                      Set Variable        ${secretinfo}[authtoken]
    ${time} =                           Set Variable        ${secretinfo}[time]
    ${sign} =                           Set Variable        ${secretinfo}[sign]
    Fapi Headers Set                    sign                ${sign}
    ...                                 time                ${time}
    ...                                 authtoken           ${authtoken}
    Fapi Params Set                     articleId           ${articleid}
    ...                                 siteId              1
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Get                            ${APPIF_ALIAS}      ${GETARTICLECONTENT_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}

Get Event
    [Documentation]                     稿件分享接口
    [Arguments]                         ${id}
    ...                                 ${siteid}=${SITEID}
    ...                                 ${type}=${TYPE}
    ...                                 ${eventtype}=${EVENTTYPE}
    ...                                 ${channel}=${CHANNEL}
    ${secretinfo} =                     sign
    ${token} =                          Set Variable        ${secretinfo}[authtoken]
    ${time} =                           Set Variable        ${secretinfo}[time]
    ${sign} =                           Set Variable        ${secretinfo}[sign]
    Fapi Params Set                     id                  ${id}
    ...                                 siteID              ${siteid}
    ...                                 type                ${type}
    ...                                 eventType           ${eventtype}
    ...                                 channel             ${channel}
    ...                                 curVersions         ${CURVERSIONS}
    Fapi Headers Set
    ...                                 authtoken           ${token}
    ...                                 time                ${time}
    ...                                 sign                ${sign}
    Fapi Get                            ${APPIF_ALIAS}      ${EVENT_URI}
    ${data}                             Fapi Data To Object
    Set Suite Variable                  ${response_data}    ${data}