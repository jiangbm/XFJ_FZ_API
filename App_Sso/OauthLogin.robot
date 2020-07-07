*** Settings ***
Documentation                           登录
Resource                                ../App_Sso/Sso_Common.robot
Suite Setup                             Create Sso Session Common
Suite Teardown                          Fapi Delete All Sessions
Force Tags                              冒烟集-新福建APP     sso-app接口/第三方登录（孙安）
...                                     作者：江宝敏

*** Variables ***
&{WEIBO}                                provider=sina_weibo
...                                     oid=5800732080
...                                     nickname="-_abcdef西坡你要"
&{WECHAT}                               provider=tencent_wechat
...                                     oid=o7jOUwwSR2ecmE_wXxsofN7cYbmY
...                                     nickname="tester~『测试』"
&{QQ}                                   provider=tencent_QQ
...                                     oid=62D34A92B2C38EC00356E3CB4B0F03BC                #7422D090F908964F3C72C07ECE2B4D1B
...                                     nickname="用户63681415"
&{APPLE}                                provider=apple
...                                     oid=001587
...                                     nickname="APPLE001587"
${RESULT_QQ}                            用户63681415
${RESULT_WEIBO}                         abcdef西坡
${RESULT_WECHAT}                        tester~『测试』
${RESULT_APPLE}                         APPLE001587


*** Keywords ***

*** Test Cases ***
第三方QQ登录，登录成功后接口返回账号相关数据
    SSO Oauth Login                     ${QQ.provider}
    ...                                 ${QQ.oid}
    ...                                 ${QQ.nickname}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed
    Should Be Equal As Strings          ${response_data.nickname}       ${RESULT_QQ}

第三方微博登录，登录成功后接口返回账号相关数据
    SSO Oauth Login                     ${WEIBO.provider}
    ...                                 ${WEIBO.oid}
    ...                                 ${WEIBO.nickname}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed
    Should Be Equal As Strings          ${response_data.nickname}       ${RESULT_WEIBO}

第三方微信登录，登录成功后接口返回账号相关数据
    SSO Oauth Login                     ${WECHAT.provider}
    ...                                 ${WECHAT.oid}
    ...                                 ${WECHAT.nickname}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed
    Should Be Equal As Strings          ${response_data.nickname}       ${RESULT_WECHAT}

第三方APPLE ID登录，登录成功后接口返回账号相关数据
    SSO Oauth Login                     ${APPLE.provider}
    ...                                 ${APPLE.oid}
    ...                                 ${APPLE.nickname}
    Fapi Request Should Be Succeed
    Fapi Status Should Be Succeed
    Should Be Equal As Strings          ${response_data.nickname}       ${RESULT_APPLE}


