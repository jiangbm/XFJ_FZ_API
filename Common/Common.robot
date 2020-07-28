*** Settings ***
Documentation                           该文档是翔宇新媒体产品客户端接口关键字集文档
Library                                 FATL.FapiKeywords
Library                                 Collections
Library                                 RequestsLibrary
Library                                 OperatingSystem
Library                                 DateTime
Library                                 String
Library                                 Selenium2Library
Library                                 ../Secret/XFJ_Des.py
Library                                 ../Secret/authen.py
#Library                                 HttpLibrary.HTTP

*** Variables ***
#外网接口地址
${SERVER}                               https://api1.fjdaily.com
${SSO}                                  https://api1.fjdaily.com:18443
${APPIF_URL}                            ${SERVER}/app_if
${SSO_URL}                              ${SSO}/sso-app

# alias
${APPIF_ALIAS}                          appif
${SSO_ALIAS}                            sso
#接口封装后需要加的一个参数
${CURVERSIONS}                          1

*** Keywords ***
Create Session Common
    Fapi Create Session                 ${APPIF_ALIAS}      ${APPIF_URL}
    ${secretinfo} =                     sign
    Fapi Headers Set                    time                ${secretinfo}[time]
    ...                                 authtoken           ${secretinfo}[authtoken]
    ...                                 sign                ${secretinfo}[sign]


Create Sso Session Common
    Fapi Create Session                 ${SSO_ALIAS}        ${SSO_URL}

