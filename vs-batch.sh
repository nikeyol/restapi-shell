#!/bin/sh
#set -vx
url_base="https://192.168.1.3/api"


content_type="application/json"
milos_tenant="admin"
milos_csrf="DR8zu8o4nvt4yyNCP4ClK4KQ5dof8guD"
milos_cookie="csrftoken=DR8zu8o4nvt4yyNCP4ClK4KQ5dof8guD; sessionid=d5xr2be0091wy4krbbpys68amfixddmd"
milos_refer="https://192.168.1.3/"

milos_appfile="applicationprofile"
milos_netfile="networkprofile"
milos_pool="pool"
milos_svc="service"
milos_vs="virtualservice"

#Get Tenant
tenant="https://192.168.1.3/api/tenant/admin"

#Get Cloud
milos_cloud=$(curl -k -s $url_base/cloud -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" | jq -r '.results[0].url')

echo "cloud url is $milos_cloud"
sleep 3

#Get se_group
milos_seg=$(curl -k -s $url_base/serviceenginegroup -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" | jq -r '.results[0].url')
echo "seg url is $milos_seg"
sleep 3

#Get SE
milos_se=$(curl -k -s $url_base/serviceengine -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" | jq -r '.results[0].url')
echo "se url is $milos_se"
sleep 3

#Config Data Nic IP for SE


#Get vrf
milos_vrf=$(curl -k -s $url_base/vrfcontext -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" | jq -r '.results[] | select(.name == "global") | .url')
echo "vrf url is $milos_vrf"
sleep 3

#Get analyticsprofile
milos_anaylitics_profile=$(curl -k -s $url_base/analyticsprofile -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" | jq -r '.results[0].url')
echo "analytics url is $milos_anaylitics_profile"
sleep 3

#Get application profiles
milos_app_profile_http=$(curl -k -s $url_base/applicationprofile -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" | jq -r '.results[] | select(.name == "System-HTTP") | .url')
echo "app profile http url is $milos_app_profile_http"
sleep 3

milos_app_profile_dns=$(curl -k -s $url_base/applicationprofile -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" | jq -r '.results[] | select(.name == "System-DNS") | .url')
echo "app profile dns url is $milos_app_profile_dns"
sleep 3

milos_app_profile_syslog=$(curl -k -s $url_base/applicationprofile -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" | jq -r '.results[] | select(.name == "System-Syslog") | .url')
echo "app profile syslog url is $milos_app_profile_syslog"
sleep 3

milos_app_profile_L4=$(curl -k -s $url_base/applicationprofile -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" | jq -r '.results[] | select(.name == "System-L4-Application") | .url')
echo "app profile l4 url is $milos_app_profile_L4"
sleep 3

milos_app_profile_ssl=$(curl -k -s $url_base/applicationprofile -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" | jq -r '.results[] | select(.name == "System-SSL-Application") | .url')
echo "app profile ssl url is $milos_app_profile_ssl"
sleep 3

milos_app_profile_secure_http=$(curl -k -s $url_base/applicationprofile -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" | jq -r '.results[] | select(.name == "System-Secure-HTTP") | .url')
echo "app profile secure http url is $milos_app_profile_secure_http"
sleep 3

# get network profiles
milos_network_profile_udp_fast=$(curl -k -s $url_base/networkprofile -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" | jq -r '.results[] | select(.name == "System-UDP-Fast-Path") | .url')
echo "milos_network_profile_udp_fast url is $milos_network_profile_udp_fast"
sleep 3

milos_network_profile_udp_per_packet=$(curl -k -s $url_base/networkprofile -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" | jq -r '.results[] | select(.name == "System-UDP-Per-Pkt") | .url')
echo "milos_network_profile_udp_per_packet url is $milos_network_profile_udp_per_packet"
sleep 3

milos_network_profile_udp_nonat=$(curl -k -s $url_base/networkprofile -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" | jq -r '.results[] | select(.name == "System-UDP-No-SNAT") | .url')
echo "milos_network_profile_udp_nonat url is $milos_network_profile_udp_nonat"
sleep 3


milos_network_profile_tcp_fast=$(curl -k -s $url_base/networkprofile -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" | jq -r '.results[] | select(.name == "System-TCP-Fast-Path") | .url')
echo "milos_network_profile_tcp_fast url is $milos_network_profile_tcp_fast"
sleep 3

milos_network_profile_tcp=$(curl -k -s $url_base/networkprofile -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" | jq -r '.results[] | select(.name == "System-TCP-Proxy") | .url')
echo "milos_network_profile_tcp url is $milos_network_profile_tcp"
sleep 3

# create health monitor
hm_json_data="$(cat <<EOF
  {
    "name": "HM-TCP-1",
    "tenant_ref": "https://192.168.1.3/api/tenant/admin",
    "receive_timeout": 4,
    "failed_checks": 2,
    "send_interval": 10,
    "successful_checks": 2,
    "type": "HEALTH_MONITOR_TCP"
  }
EOF)"

echo "delete existing vs before pool deleting\n"
resp=$(curl -k -s $url_base/virtualservice  \
-H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie"|jq -r '.results[].url')
if [ -n "$resp" ]; then
  for url in $resp; do
    echo "deleting vs: $url"
    curl -k -s -XDELETE $url -H "X-Csrftoken: $milos_csrf" \
    -H "X-Avi-Tenant: admin" \
    -H "Content-Type: application/json" \
    -H "Referer: $milos_refer" \
    --cookie "$milos_cookie"
  done
fi

echo "delete existing pool before hm deleting\n"
resp=$(curl -k -s $url_base/pool  \
-H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie"|jq -r '.results[].url')
if [ -n "$resp" ]; then
  for url in $resp; do
    echo "deleting pool: $url"
    curl -k -s -XDELETE $url -H "X-Csrftoken: $milos_csrf" \
    -H "X-Avi-Tenant: admin" \
    -H "Content-Type: application/json" \
    -H "Referer: $milos_refer" \
    --cookie "$milos_cookie"
  done
fi

echo "deleting http policy set\n"
resp=$(curl -k -s $url_base/httppolicyset -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" |grep "HTTP-FullProxy-Basic-1-HTTP-Policy-Set")
if [ -n "$resp" ]; then
  echo "delete the existing hm config"
  curl -k -s -XDELETE -H "X-Csrftoken: $milos_csrf" \
  -H "X-Avi-Tenant: admin" \
  -H "Content-Type: application/json" \
  -H "Referer: $milos_refer" \
  --cookie "$milos_cookie" \
  $(curl -k -s $url_base/httppolicyset -H "X-Csrftoken: $milos_csrf" \
  -H "X-Avi-Tenant: admin" \
  -H "Content-Type: application/json" \
  -H "Referer: $milos_refer" \
  --cookie "$milos_cookie" | jq -r '.results[] | select(.name == "HTTP-FullProxy-Basic-1-HTTP-Policy-Set") | .url')
fi
sleep 3

echo "hm_json_data is $hm_json_data\n"
resp=$(curl -k -s $url_base/healthmonitor -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" |grep "HM-TCP-1")
if [ -n "$resp" ]; then
  echo "delete the existing hm config"
  curl -k -s -XDELETE -H "X-Csrftoken: $milos_csrf" \
  -H "X-Avi-Tenant: admin" \
  -H "Content-Type: application/json" \
  -H "Referer: $milos_refer" \
  --cookie "$milos_cookie" \
  $(curl -k -s $url_base/healthmonitor -H "X-Csrftoken: $milos_csrf" \
  -H "X-Avi-Tenant: admin" \
  -H "Content-Type: application/json" \
  -H "Referer: $milos_refer" \
  --cookie "$milos_cookie" | jq -r '.results[] | select(.name == "HM-TCP-1") | .url')
fi
sleep 3

milos_hm_url=$(curl -k -s -XPOST $url_base/healthmonitor -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$hm_json_data" |jq -r '.results[] | select(.name == "HM-TCP-1") | .url')
echo "milos_hm_url is $milos_hm_url"
sleep 3

milos_hm_system_http_url=$(curl -k -s -X= $url_base/healthmonitor -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$hm_json_data" |jq -r '.results[] | select(.name == "System-HTTP") | .url')
echo "milos_hm_system_http_url is $milos_hm_system_http_url"
sleep 3

milos_hm_system_ping_url=$(curl -k -s -XGET $url_base/healthmonitor -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$hm_json_data" |jq -r '.results[] | select(.name == "System-Ping") | .url')
echo "milos_hm_system_ping_url is $milos_hm_system_ping_url"
sleep 3

milos_hm_system_tcp_url=$(curl -k -s -XGET $url_base/healthmonitor -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$hm_json_data" |jq -r '.results[] | select(.name == "System-TCP") | .url')
echo "milos_hm_system_tcp_url is $milos_hm_system_tcp_url"
sleep 3

milos_hm_system_udp_url=$(curl -k -s -XGET $url_base/healthmonitor -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$hm_json_data" |jq -r '.results[] | select(.name == "System-UDP") | .url')
echo "milos_hm_system_udp_url is $milos_hm_system_udp_url"
sleep 3

milos_hm_system_dns_url=$(curl -k -s -XGET $url_base/healthmonitor -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$hm_json_data" |jq -r '.results[] | select(.name == "System-DNS") | .url')
echo "milos_hm_system_dns_url is $milos_hm_system_dns_url"
sleep 3

milos_hm_system_perl_url=$(curl -k -s -XGET $url_base/healthmonitor -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$hm_json_data" |jq -r '.results[] | select(.name == "System-Xternal-Perl") | .url')
echo "milos_hm_system_perl_url is $milos_hm_system_perl_url"
sleep 3

milos_hm_system_shell_url=$(curl -k -s -XGET $url_base/healthmonitor -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$hm_json_data" |jq -r '.results[] | select(.name == "System-Xternal-Shell") | .url')
echo "milos_hm_system_shell_url is $milos_hm_system_shell_url"
sleep 3


milos_hm_system_python_url=$(curl -k -s -XGET $url_base/healthmonitor -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$hm_json_data" |jq -r '.results[] | select(.name == "System-Xternal-Python") | .url')
echo "milos_hm_system_python_url is $milos_hm_system_python_url"
sleep 3

#network data
network_10_json_data="$(cat <<EOF
{
   "name":"seg-network-10",
   "tenant_ref":"$tenant",
   "cloud_ref":"$milos_cloud",
   "configured_subnets":[
      {
         "prefix":{
            "ip_addr":{
               "type":"V4",
               "addr":"10.0.0.0"
            },
            "mask":24
         }
      }
   ],
   "exclude_discovered_subnets":false,
   "synced_from_se":false,
   "dhcp_enabled":false,
   "vrf_context_ref":"$milso_vrf",
   "vcenter_dvs":true
}
EOF)"

# create network 10
network_10_url=""

resp=$(curl -k -s $url_base/network -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" | jq -r '.results[].url')
if [ -n "$resp" ]; then
  echo "delete the existing network config"
  for url in $resp; do
    curl -k -s -XDELETE $url -H "X-Csrftoken: $milos_csrf" \
    -H "X-Avi-Tenant: admin" \
    -H "Content-Type: application/json" \
    -H "Referer: $milos_refer" \
    --cookie "$milos_cookie"
  done
fi
network_10_url=$(curl -k -s -X POST $url_base/network  \
-H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" \
-d "$network_10_json_data" | jq '.url')

echo "network_10_url is $network_10_url"
sleep 3


# create network 192
network_192_json_data="$(cat <<EOF
{
   "name":"seg-network-192",
   "tenant_ref":"$tenant",
   "cloud_ref":"$milos_cloud",
   "configured_subnets":[
      {
         "prefix":{
            "ip_addr":{
               "type":"V4",
               "addr":"192.168.1.0"
            },
            "mask":24
         }
      }
   ],
   "exclude_discovered_subnets":false,
   "synced_from_se":false,
   "dhcp_enabled":false,
   "vrf_context_ref":"$milso_vrf",
   "vcenter_dvs":true
}
EOF)"
echo "network_192_json_data is $network_192_json_data"
network_192_url=""
network_192_url=$(curl -k -s -X POST $url_base/network  \
-H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" \
-d "$network_192_json_data" |jq  '.url')
echo "network_192_url is $network_192_url"
sleep 3



#create ssl certificate
#ssl profile
ssl_profile_json_data=$(
cat <<EOF
{
  "name": "test-tls1.0-1",
  "tenant_ref": "$tenant",
  "accepted_ciphers": "ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-ECDSA-AES128-GCM-SHA256",
  "accepted_versions": [{"type": "SSL_VERSION_TLS1"}, {"type": "SSL_VERSION_TLS1_1"}, {"type": "SSL_VERSION_TLS1_2"}],
  "cipher_enums": ["TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384", "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384", "TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256"],
  "send_close_notify": true,
  "dhparam": "-----BEGIN DH PARAMETERS-----\nMIIBCAKCAQEA9HHHYFFxq6ayCuvk/jzz0Zos3OazkfyGI724unR5hPDfWdqQ2Abl\nvteGk/0TGoFxJIgYRO2hJ0jpyWD+B4dpTGGEKhc4Cp7d8cXGhdxnsYf6KS1SSLtU\nIqsUIw6drBYrpSKHIL90mligpw221XjcuT7duArouJWoMwjBejF8esChUURAldQk\nqLxs9nRkXDX6nsWu1O0G0VwvASmvtIryRvVRTgEN3qG8R7AUN2URT3T3qPhaTWM/\nX1Nggl/RQAx2+QTVSDQlDau4Sypp54y8uNtvJJDp8eANHzwuGYMDdnfCYw70UxJV\n+NjQUa+/Pda0CEbqHZC5DSTTgVT83TkcowIBAg==\n-----END DH PARAMETERS-----",
  "ssl_rating": {"performance_rating": "SSL_SCORE_EXCELLENT", "security_score": "100", "compatibility_rating": "SSL_SCORE_BAD"}
}
EOF
})
ssl_profile_url=""

resp=$(curl -k -s $url_base/sslprofile -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" | grep "test-tls1.0-1")

if [ -n "$resp" ]; then
  curl -k -s -XDELETE  -H "X-Csrftoken: $milos_csrf" \
  -H "X-Avi-Tenant: admin" \
  -H "Content-Type: application/json" \
  -H "Referer: $milos_refer" \
  --cookie "$milos_cookie" $(curl -k -s $url_base/sslprofile -H "X-Csrftoken: $milos_csrf" \
  -H "X-Avi-Tenant: admin" \
  -H "Content-Type: application/json" \
  -H "Referer: $milos_refer" \
  --cookie "$milos_cookie" |jq -r '.results[] | select(.name=="test-tls1.0-1") | .url')
fi

ssl_profile_url=$(curl -s -k -X POST $url_base/sslprofile  \
-H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: https://192.168.1.3/" \
--cookie "$milos_cookie" \
-d "$ssl_profile_json_data"|jq -r '.results[] | select(.name=="test-tls1.0-1") | .url')

echo "ssl_profile_url is $ssl_profile_url"

ssl_profile_standard_url=$(curl -s -k -X GET $url_base/sslprofile  \
-H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: https://192.168.1.3/" \
--cookie "$milos_cookie" \
-d "$ssl_profile_json_data"|jq -r '.results[] | select(.name=="System-Standard") | .url')


#system ssl profile
ssl_profile_standard_url=$(curl -s -k -XGET $url_base/sslprofile  \
-H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: https://192.168.1.3/" \
--cookie "$milos_cookie" \
|jq -r '.results[] | select(.name=="System-Standard") | .url')

#ssl key
ssl_key_json_data=$(
cat <<EOF
{
   "name":"cert-1",
   "tenant_ref":"$tenant",
   "certificate":{
      "public_key":"-----BEGIN PUBLIC KEY-----\nMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAt45VZ+gjISqwBp1grgZk\nSYiuXpKXfe7SYB+6L7GceALwGdFypDK1kRpKo2ZKZ0b8WXApEYU0qTvwI7B0SslA\nodRsaorb/8Gvr+I/1Z73H7O1W3pRpanpI4w5Pscgoxn1pGfGd898Vhfw/v8T1NDT\nBjyLFlEx/aKOxkw/EFusEGmflIq3HKP2MP2I06KIcLQA0ESXuQikHosTpSOfem0j\nF9KBQaO79P/1fNTFiFnE8EpcESVqDQlqso0yULFiDjN0pFXHb3lqIRj1hQ9gv3pK\njEFEJkfRVDc/BdqzCJO7KJ98H/+04QM8l+NKHvplMrpbzaIa9NUBtC6rHiqRO1LH\nbMWuI7wpvhSETaWL/dmPTpN67QNVkstoq7ACPxJ5QSPTI56CcIgAz/g/HCgXXyIV\niUlClFGht3EwHrdAfLqnU0gZrPAX9E8IdxkAybRvq3X8CaNXGBBCp8NVva2Ay9Z1\nPWu1bZ6tX5JgFaXdGPrqYCfTdKGbkRT+kU/Q12ItY3ZgqUev8LuQvipzsNFetKsV\n8TPRtvRz4fCDN81FeVGcTM+SdToVssVKIgBN8SdZvlwq1MtlAczZBIAiuG9a5coM\n79ip0awX4Q9HlOmzoPNaRiRB/XiTLN33eABj6wBviUNhzM+cdrc8rUyctPokEiY5\nQqXYbS5xRgxOF2jME9L+WKMCAwEAAQ==\n-----END PUBLIC KEY-----\n",
      "self_signed":false,
      "certificate":"-----BEGIN CERTIFICATE-----\n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\neFSn1yMKGs2KKVJWFQ==\n-----END CERTIFICATE-----\n",
      "not_after":"2025-06-11 02:44:51",
      "signature_algorithm":"sha1WithRSAEncryption",
      "expiry_status":"SSL_CERTIFICATE_GOOD",
      "version":"2",
      "text":  "Certificate:\n    Data:\n        Version: 3 (0x2)\n        Serial Number: 1 (0x1)\n    Signature Algorithm: sha1WithRSAEncryption\n        Issuer: C=cn, ST=bj, L=bj, O=milos, OU=dev, CN=miloslb.com.cn/emailAddress=zj-1314@163.com\n        Validity\n            Not Before: Jun 13 02:44:51 2023 GMT\n            Not After : Jun 11 02:44:51 2025 GMT\n        Subject: CN=miloslb.com.cn, ST=bj, C=cn/emailAddress=zj-1314@163.com, O=milos, OU=dev\n        Subject Public Key Info:\n            Public Key Algorithm: rsaEncryption\n                Public-Key: (4096 bit)\n                Modulus:\n                    00:b7:8e:55:67:e8:23:21:2a:b0:06:9d:60:ae:06:\n                    64:49:88:ae:5e:92:97:7d:ee:d2:60:1f:ba:2f:b1:\n                    9c:78:02:f0:19:d1:72:a4:32:b5:91:1a:4a:a3:66:\n                    4a:67:46:fc:59:70:29:11:85:34:a9:3b:f0:23:b0:\n                    74:4a:c9:40:a1:d4:6c:6a:8a:db:ff:c1:af:af:e2:\n                    3f:d5:9e:f7:1f:b3:b5:5b:7a:51:a5:a9:e9:23:8c:\n                    39:3e:c7:20:a3:19:f5:a4:67:c6:77:cf:7c:56:17:\n                    f0:fe:ff:13:d4:d0:d3:06:3c:8b:16:51:31:fd:a2:\n                    8e:c6:4c:3f:10:5b:ac:10:69:9f:94:8a:b7:1c:a3:\n                    f6:30:fd:88:d3:a2:88:70:b4:00:d0:44:97:b9:08:\n                    a4:1e:8b:13:a5:23:9f:7a:6d:23:17:d2:81:41:a3:\n                    bb:f4:ff:f5:7c:d4:c5:88:59:c4:f0:4a:5c:11:25:\n                    6a:0d:09:6a:b2:8d:32:50:b1:62:0e:33:74:a4:55:\n                    c7:6f:79:6a:21:18:f5:85:0f:60:bf:7a:4a:8c:41:\n                    44:26:47:d1:54:37:3f:05:da:b3:08:93:bb:28:9f:\n                    7c:1f:ff:b4:e1:03:3c:97:e3:4a:1e:fa:65:32:ba:\n                    5b:cd:a2:1a:f4:d5:01:b4:2e:ab:1e:2a:91:3b:52:\n                    c7:6c:c5:ae:23:bc:29:be:14:84:4d:a5:8b:fd:d9:\n                    8f:4e:93:7a:ed:03:55:92:cb:68:ab:b0:02:3f:12:\n                    79:41:23:d3:23:9e:82:70:88:00:cf:f8:3f:1c:28:\n                    17:5f:22:15:89:49:42:94:51:a1:b7:71:30:1e:b7:\n                    40:7c:ba:a7:53:48:19:ac:f0:17:f4:4f:08:77:19:\n                    00:c9:b4:6f:ab:75:fc:09:a3:57:18:10:42:a7:c3:\n                    55:bd:ad:80:cb:d6:75:3d:6b:b5:6d:9e:ad:5f:92:\n                    60:15:a5:dd:18:fa:ea:60:27:d3:74:a1:9b:91:14:\n                    fe:91:4f:d0:d7:62:2d:63:76:60:a9:47:af:f0:bb:\n                    90:be:2a:73:b0:d1:5e:b4:ab:15:f1:33:d1:b6:f4:\n                    73:e1:f0:83:37:cd:45:79:51:9c:4c:cf:92:75:3a:\n                    15:b2:c5:4a:22:00:4d:f1:27:59:be:5c:2a:d4:cb:\n                    65:01:cc:d9:04:80:22:b8:6f:5a:e5:ca:0c:ef:d8:\n                    a9:d1:ac:17:e1:0f:47:94:e9:b3:a0:f3:5a:46:24:\n                    41:fd:78:93:2c:dd:f7:78:00:63:eb:00:6f:89:43:\n                    61:cc:cf:9c:76:b7:3c:ad:4c:9c:b4:fa:24:12:26:\n                    39:42:a5:d8:6d:2e:71:46:0c:4e:17:68:cc:13:d2:\n                    fe:58:a3\n                Exponent: 65537 (0x10001)\n        X509v3 extensions:\n            X509v3 Basic Constraints: \n                CA:FALSE\n            X509v3 Subject Key Identifier: \n                F9:7D:BF:DB:E8:BB:F6:DA:20:37:C3:55:2F:C2:D2:A0:99:84:1B:4A\n            X509v3 Authority Key Identifier: \n                keyid:3E:43:A9:E6:CE:33:5F:D3:6E:92:BD:E1:F4:D2:43:8B:D7:59:6A:27\n\n            X509v3 Key Usage: \n                Digital Signature, Key Encipherment\n            X509v3 Extended Key Usage: \n                TLS Web Server Authentication\n            X509v3 CRL Distribution Points: \n\n                Full Name:\n                  URI:http://miloslb.com.cn/root.crl\n\n            X509v3 Subject Alternative Name: \n                DNS:miloslb.com.cn, DNS:*.miloslb.com.cn\n    Signature Algorithm: sha1WithRSAEncryption\n         ad:12:84:a6:b6:6b:78:79:0a:f1:78:fd:69:49:fc:84:d7:94:\n         05:c8:76:fb:af:a6:ed:5b:cf:06:7e:8b:2a:4c:41:6f:5d:45:\n         da:56:b0:26:a5:82:3d:34:36:5c:96:a0:24:f3:36:a6:c1:7e:\n         b4:a8:00:98:57:2d:08:3a:af:c1:59:6c:ab:71:07:0b:f7:c4:\n         5c:3f:27:6c:74:58:4f:96:e7:17:bd:96:8f:aa:41:61:fc:c7:\n         af:7f:8c:72:1c:ad:0f:ce:44:51:5b:91:1e:1e:da:b7:ba:51:\n         ba:1c:63:d2:27:71:df:c2:db:c9:b4:e0:74:1f:fd:21:8f:0b:\n         dd:ec:65:0f:e6:a1:87:4b:e7:47:ff:c1:fb:f4:98:d2:cd:96:\n         5c:ec:08:84:20:ff:e5:bb:53:13:12:0f:61:a2:63:1b:a7:1b:\n         bf:30:82:8a:70:bf:ac:a3:39:66:46:65:64:90:ea:0c:11:26:\n         fe:a1:3e:56:33:12:dd:c1:85:28:87:19:a5:4b:fc:7f:7b:f6:\n         fd:d4:e3:a8:04:fd:60:3d:a1:c0:2a:7e:fb:35:bc:f0:72:73:\n         ac:6b:43:f8:43:23:bf:a4:89:dd:64:73:71:84:b1:fa:85:77:\n         cd:e1:74:49:0c:fe:f8:62:97:cc:3d:29:b1:8c:ce:0e:c1:bb:\n         52:f8:b5:cc:db:de:ad:f8:9f:86:83:8f:16:ff:10:f8:48:b7:\n         5b:5f:15:14:35:e3:64:f1:75:2b:82:27:d3:ea:85:1c:04:79:\n         ab:ec:f6:79:85:17:48:bd:71:4b:0b:6a:ee:e6:82:a8:60:03:\n         f8:f7:55:ae:d9:e1:99:96:48:36:10:ad:2b:95:03:37:fb:18:\n         c1:68:41:d4:51:62:d9:f9:12:d2:88:32:05:b2:b5:3e:c1:33:\n         ca:31:9b:21:74:5d:dd:06:cb:0a:82:be:e7:df:28:32:23:79:\n         2a:68:07:dc:cc:a9:7b:57:dd:d7:ac:6a:e7:16:37:75:9c:b2:\n         b1:20:9a:30:bb:5b:e1:2a:ba:f7:12:1e:2e:4a:04:5c:a6:8d:\n         3e:48:c0:f6:b3:08:3b:e0:86:3b:d1:ba:f7:2c:3c:f8:86:0e:\n         a5:90:aa:8a:03:84:22:75:bc:27:bc:6a:51:22:c6:ee:51:b2:\n         a0:10:f7:da:54:57:33:1d:f3:35:65:0e:c2:aa:26:86:fa:a7:\n         83:4b:b0:cc:81:5c:bf:c7:5f:77:36:54:98:31:c5:d6:17:de:\n         ae:19:c4:ae:37:79:b0:9b:41:8c:f5:f2:a2:01:15:b7:9b:0c:\n         03:8d:15:f0:e5:f9:1f:a1:24:10:e7:f3:24:78:54:a7:d7:23:\n         0a:1a:cd:8a:29:52:56:15\n",
      "fingerprint":"SHA1 Fingerprint=1C:65:86:09:88:D5:D0:C1:7A:DF:2D:7A:71:AC:8C:46:2E:40:40:0B\n",
      "key_params":{
         "rsa_params":{
            "key_size":"SSL_KEY_4096_BITS",
            "exponent":65537
         },
         "algorithm":"SSL_KEY_ALGORITHM_RSA"
      },
      "serial_number":"1",
      "subject":{
         "distinguished_name":"CN=miloslb.com.cn, ST=bj, C=cn/emailAddress=zj-1314@163.com, O=milos, OU=dev",
         "country":"cn",
         "organization_unit":"dev",
         "state":"bj",
         "common_name":"miloslb.com.cn",
         "organization":"milos",
         "email_address":"zj-1314@163.com"
      },
      "not_before":"2023-06-13 02:44:51",
      "issuer":{
         "locality":"bj",
         "distinguished_name":"C=cn, ST=bj, L=bj, O=milos, OU=dev, CN=miloslb.com.cn/emailAddress=zj-1314@163.com",
         "country":"cn",
         "organization_unit":"dev",
         "state":"bj",
         "common_name":"miloslb.com.cn",
         "organization":"milos",
         "email_address":"zj-1314@163.com"
      }
   },
   "key_params":{
      "rsa_params":{
         "key_size":"SSL_KEY_4096_BITS",
         "exponent":65537
      },
      "algorithm":"SSL_KEY_ALGORITHM_RSA"
   },
   "ca_certs":[
      {
         "name":"miloslb.com.cn"
      }
   ],
   "type":"SSL_CERTIFICATE_TYPE_VIRTUALSERVICE",
   "key": "-----BEGIN PRIVATE KEY-----\n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\n8CvD7s7DLwhdhDsDFM6TVqKroxdcJln/\n-----END PRIVATE KEY-----\n"
}
EOF)

ssl_certificate_url=""
resp=$(curl -k -s $url_base/sslkeyandcertificate  \
-H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: https://192.168.1.3/" \
--cookie "$milos_cookie" |grep "cert-1")

if [ -n "$resp" ]; then
  curl -s -k -XDELETE  \
  -H "X-Csrftoken: $milos_csrf" \
  -H "X-Avi-Tenant: admin" \
  -H "Content-Type: application/json" \
  -H "Referer: $milos_refer" \
  --cookie "$milos_cookie" $(curl -k -s $url_base/sslkeyandcertificate  \
  -H "X-Csrftoken: $milos_csrf" \
  -H "X-Avi-Tenant: admin" \
  -H "Content-Type: application/json" \
  -H "Referer: $milos_refer" \
  --cookie "$milos_cookie"|jq -r '.results[] | select(.name=="cert-1") | .url')
fi

ssl_certificate_url=$(curl -s -k -X POST $url_base/sslkeyandcertificate  \
-H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" \
-d "$ssl_key_json_data" | jq -r '.url')

echo "ssl_certificate_url url is $ssl_certificate_url"
sleep 3

#Get Persistence profile
milos_persistence_http_cookie_profile=$(curl -s -k -XGET $url_base/applicationpersistenceprofile -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" | jq -r '.results[] | select(.name=="System-Persistence-Http-Cookie") | .url')
echo "milos_persistence_http_cookie_profile url is $milos_persistence_http_cookie_profile"
sleep 3

milos_persistence_http_header_profile=$(curl -s -k -XGET $url_base/applicationpersistenceprofile -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" | jq -r '.results[] | select(.name=="System-Persistence-Custom-Http-Header") | .url')
echo "milos_persistence_http_header_profile url is $milos_persistence_http_header_profile"
sleep 3

milos_persistence_app_cookie_profile=$(curl -s -k -XGET $url_base/applicationpersistenceprofile -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" | jq -r '.results[] | select(.name=="System-Persistence-App-Cookie") | .url')
echo "milos_persistence_app_cookie_profile url is $milos_persistence_app_cookie_profile"
sleep 3

milos_persistence_tls_profile=$(curl -s -k -XGET $url_base/applicationpersistenceprofile -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" | jq -r '.results[] | select(.name=="System-Persistence-TLS") | .url')
echo "milos_persistence_tls_profile url is $milos_persistence_tls_profile"
sleep 3

milos_persistence_clientip_profile=$(curl -s -k -XGET $url_base/applicationpersistenceprofile -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" | jq -r '.results[] | select(.name=="System-Persistence-Client-IP") | .url')
echo "milos_persistence_clientip_profile url is $milos_persistence_clientip_profile"
sleep 3


#create pool 1
pool1_json_data="$(cat <<EOF
{
   "name":"UDP-FastPath-Adv-2-pool",
   "server_count":1,
   "enabled":true,
   "tenant_ref":"$tenant",
   "cloud_ref":"$milos_cloud",
   "lb_algorithm":"LB_ALGORITHM_LEAST_CONNECTIONS",
   "use_service_port":false,
   "server_auto_scale":false,
   "host_check_enabled":false,
   "capacity_estimation":false,
   "servers":[
      {
         "hostname":"10.0.0.201",
         "ratio":1,
         "ip":{
            "type":"V4",
            "addr":"10.0.0.201"
         },
         "enabled":true,
         "verify_network":false,
         "static":false,
         "resolve_server_by_dns":false,
         "prst_hdr_val":"",
         "port":53
      }
   ],
   "fewest_tasks_feedback_delay":10,
   "fail_action":{
      "type":"FAIL_ACTION_CLOSE_CONN"
   },
   "graceful_disable_timeout":1,
   "vrf_ref": "$milos_vrf",
   "inline_health_monitor":true,
   "default_server_port":80,
   "request_queue_depth":128,
   "server_reselect":{
      "retry_nonidempotent":false,
      "enabled":false,
      "num_retries":4
   },
   "sni_enabled":true,
   "request_queue_enabled":false,
   "max_concurrent_connections_per_server":0,
   "health_monitor_refs": "$milos_hm_url",
   "connection_ramp_duration":10
}
EOF)"


milos_pool1=$(curl -s -k -XPOST $url_base/pool -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$pool1_json_data" |jq -r '.url')
echo "milos_pool1 url is $milos_pool1"
sleep 3

#create vs 1
vs1_json_data=$(cat <<EOF
{
   "name":"UDP-FastPath-Adv-2",
   "enabled":true,
   "network_profile_ref":"$milos_network_profile_udp_fast",
   "se_group_ref":"$milos_seg",
   "vrf_context_ref":"$milos_vrf",
   "analytics_profile_ref":"$milos_anaylitics_profile",
   "tenant_ref":"$tenant",
   "cloud_ref":"$milos_cloud",
   "weight":1,
   "flow_dist":"LOAD_AWARE",
   "ip_address":{
      "type":"V4",
      "addr":"192.168.1.161"
   },
   "delay_fairness":false,
   "avi_allocated_vip":false,
   "cloud_type":"CLOUD_NONE",
   "avi_allocated_fip":false,
   "scaleout_ecmp":false,
   "max_cps_per_client":0,
   "type":"VS_TYPE_NORMAL",
   "use_bridge_ip_as_vip":false,
   "application_profile_ref":"$milos_app_profile_L4",
   "auto_allocate_floating_ip":false,
   "services":[
      {
         "enable_ssl":false,
         "port_range_end":53,
         "port":53
      }
   ],
   "active_standby_se_tag":"ACTIVE_STANDBY_SE_1",
   "pool_ref":"$milos_pool1",
   "ign_pool_net_reach":false,
   "east_west_placement":false,
   "limit_doser":false,
   "ssl_sess_cache_avg_size":1024,
   "enable_autogw":true,
   "auto_allocate_ip":false,
   "remove_listening_port_on_vs_down":false,
   "analytics_policy":{
      "client_insights":"ACTIVE",
      "metrics_realtime_update":{
         "duration":0,
         "enabled":false
      },
      "full_client_logs":{
         "duration":0,
         "enabled":false
      }
   }
}
EOF)



milos_vs1=$(curl -k -s -XPOST $url_base/virtualservice -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$vs1_json_data")
#echo "milos_vs1 url is $milos_vs1"
sleep 3

pool2_json_data=$(cat <<EOF
{
   "name":"test-1-pool",
   "server_count":1,
   "enabled":true,
   "tenant_ref":"$tenant",
   "cloud_ref":"$milos_cloud",
   "lb_algorithm":"LB_ALGORITHM_LEAST_CONNECTIONS",
   "use_service_port":false,
   "server_auto_scale":false,
   "host_check_enabled":false,
   "capacity_estimation":false,
   "servers":[
      {
         "hostname":"10.0.0.201",
         "ratio":1,
         "ip":{
            "type":"V4",
            "addr":"10.0.0.201"
         },
         "enabled":true,
         "verify_network":false,
         "static":false,
         "resolve_server_by_dns":false,
         "port":53
      }
   ],
   "fewest_tasks_feedback_delay":10,
   "fail_action":{
      "type":"FAIL_ACTION_CLOSE_CONN"
   },
   "vrf_ref":"$milos_vrf",
   "inline_health_monitor":true,
   "default_server_port":80,
   "request_queue_depth":128,
   "graceful_disable_timeout":1,
   "sni_enabled":true,
   "request_queue_enabled":false,
   "max_concurrent_connections_per_server":0,
   "connection_ramp_duration":10
}
EOF)

milos_pool2=$(curl -s -k -XPOST $url_base/pool -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$pool2_json_data" |jq -r '.url')
echo "milos_pool2 url is $milos_pool2"
sleep 3

vs2_json_data=$(cat <<EOF
{
   "name":"test-1",
   "enabled":true,
   "network_profile_ref":"$milos_network_profile_tcp",
   "se_group_ref":"$milos_seg",
   "vrf_context_ref":"$milos_vrf",
   "analytics_profile_ref":"$milos_anaylitics_profile",
   "tenant_ref":"$tenant",
   "cloud_ref":"$milos_cloud",
   "weight":1,
   "flow_dist":"LOAD_AWARE",
   "ip_address":{
      "type":"V4",
      "addr":"192.168.1.77"
   },
   "delay_fairness":false,
   "avi_allocated_vip":false,
   "cloud_type":"CLOUD_NONE",
   "avi_allocated_fip":false,
   "scaleout_ecmp":false,
   "max_cps_per_client":0,
   "type":"VS_TYPE_NORMAL",
   "use_bridge_ip_as_vip":false,
   "application_profile_ref":"$milos_app_profile_http",
   "auto_allocate_floating_ip":false,
   "services":[
      {
         "enable_ssl":false,
         "port_range_end":80,
         "port":80
      }
   ],
   "active_standby_se_tag":"ACTIVE_STANDBY_SE_1",
   "pool_ref":"$milos_pool2",
   "ign_pool_net_reach":false,
   "east_west_placement":false,
   "limit_doser":false,
   "ssl_sess_cache_avg_size":1024,
   "enable_autogw":true,
   "auto_allocate_ip":false,
   "remove_listening_port_on_vs_down":false
}
EOF)

milos_vs2=$(curl -k -s -XPOST $url_base/virtualservice -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$vs2_json_data")
#echo "milos_vs2 url is $milos_vs2"
sleep 3

pool3_json_data=$(cat <<EOF
{
   "name":"HTTP-FullProxy-Adv-3-pool",
   "server_count":3,
   "enabled":true,
   "tenant_ref":"$tenant",
   "cloud_ref":"$milos_cloud",
   "lb_algorithm":"LB_ALGORITHM_ROUND_ROBIN",
   "use_service_port":false,
   "server_auto_scale":false,
   "host_check_enabled":false,
   "capacity_estimation":false,
   "servers":[
      {
         "hostname":"10.0.0.100",
         "ratio":1,
         "ip":{
            "type":"V4",
            "addr":"10.0.0.100"
         },
         "enabled":true,
         "verify_network":false,
         "static":false,
         "resolve_server_by_dns":false,
         "prst_hdr_val":"",
         "port":9093
      },
      {
         "hostname":"10.0.0.101",
         "ratio":1,
         "ip":{
            "type":"V4",
            "addr":"10.0.0.101"
         },
         "enabled":true,
         "verify_network":false,
         "static":false,
         "resolve_server_by_dns":false,
         "prst_hdr_val":"",
         "port":9093
      },
      {
         "hostname":"10.0.0.102",
         "ratio":1,
         "ip":{
            "type":"V4",
            "addr":"10.0.0.102"
         },
         "enabled":true,
         "verify_network":false,
         "static":false,
         "resolve_server_by_dns":false,
         "prst_hdr_val":"",
         "port":9093
      }
   ],
   "fewest_tasks_feedback_delay":10,
   "fail_action":{
      "type":"FAIL_ACTION_CLOSE_CONN"
   },
   "graceful_disable_timeout":1,
   "vrf_ref":"$milos_vrf",
   "inline_health_monitor":true,
   "default_server_port":80,
   "request_queue_depth":128,
   "server_reselect":{
      "retry_nonidempotent":false,
      "enabled":false,
      "num_retries":4
   },
   "sni_enabled":true,
   "request_queue_enabled":false,
   "max_concurrent_connections_per_server":0,
   "health_monitor_refs":[
      "$milos_hm_url"
   ],
   "connection_ramp_duration":10
}
EOF)

milos_pool3=$(curl -s -k -XPOST $url_base/pool -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$pool3_json_data" |jq -r '.url')
echo "milos_pool3 url is $milos_pool3"
sleep 3

vs3_json_data=$(cat <<EOF
{
   "name":"HTTP-FullProxy-Adv-3",
   "enabled":true,
   "network_profile_ref":"$milos_network_profile_tcp",
   "se_group_ref":"$milos_seg",
   "vrf_context_ref":"$milos_vrf",
   "analytics_profile_ref":"$milos_anaylitics_profile",
   "tenant_ref":"$tenant",
   "cloud_ref":"$milos_cloud",
   "auto_allocate_ip":false,
   "weight":1,
   "flow_dist":"LOAD_AWARE",
   "delay_fairness":false,
   "avi_allocated_vip":false,
   "cloud_type":"CLOUD_NONE",
   "avi_allocated_fip":false,
   "scaleout_ecmp":false,
   "max_cps_per_client":0,
   "pool_ref":"$milos_pool3",
   "type":"VS_TYPE_NORMAL",
   "use_bridge_ip_as_vip":false,
   "application_profile_ref":"$milos_app_profile_http",
   "auto_allocate_floating_ip":false,
   "services":[
      {
         "enable_ssl":false,
         "port_range_end":80,
         "port":80
      }
   ],
   "active_standby_se_tag":"ACTIVE_STANDBY_SE_1",
   "ip_address":{
      "type":"V4",
      "addr":"192.168.1.154"
   },
   "ign_pool_net_reach":false,
   "east_west_placement":false,
   "limit_doser":false,
   "ssl_sess_cache_avg_size":1024,
   "enable_autogw":true,
   "remove_listening_port_on_vs_down":false,
   "analytics_policy":{
      "client_insights":"ACTIVE",
      "metrics_realtime_update":{
         "duration":0,
         "enabled":false
      },
      "full_client_logs":{
         "duration":0,
         "enabled":false
      }
   }
}
EOF)

milos_vs3=$(curl -k -s -XPOST $url_base/virtualservice -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$vs3_json_data")
#echo "milos_vs3 url is $milos_vs3"
sleep 3



pool4_json_data=$(cat <<EOF
{
   "name":"HTTP-FullProxy-Adv-5-pool",
   "server_count":1,
   "enabled":true,
   "tenant_ref":"$tenant",
   "cloud_ref":"$milos_cloud",
   "lb_algorithm":"LB_ALGORITHM_LEAST_CONNECTIONS",
   "use_service_port":false,
   "server_auto_scale":false,
   "host_check_enabled":false,
   "capacity_estimation":false,
   "servers":[
      {
         "hostname":"192.168.1.222",
         "ratio":1,
         "ip":{
            "type":"V4",
            "addr":"192.168.1.222"
         },
         "enabled":true,
         "verify_network":false,
         "static":false,
         "resolve_server_by_dns":false,
         "prst_hdr_val":"",
         "port":5601
      }
   ],
   "fewest_tasks_feedback_delay":10,
   "fail_action":{
      "type":"FAIL_ACTION_CLOSE_CONN"
   },
   "graceful_disable_timeout":1,
   "vrf_ref":"$milos_vrf",
   "inline_health_monitor":true,
   "default_server_port":80,
   "request_queue_depth":128,
   "server_reselect":{
      "retry_nonidempotent":false,
      "enabled":false,
      "num_retries":4
   },
   "sni_enabled":true,
   "request_queue_enabled":true,
   "max_concurrent_connections_per_server":0,
   "connection_ramp_duration":10
}
EOF)

milos_pool4=$(curl -s -k -XPOST $url_base/pool -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$pool4_json_data" |jq -r '.url')
echo "milos_pool4 url is $milos_pool4"
sleep 3

vs4_json_data=$(cat <<EOF
{
   "name":"TCP-FullProxy-Adv-5",
   "enabled":true,
   "network_profile_ref":"$milos_network_profile_tcp",
   "se_group_ref":"$milos_seg",
   "vrf_context_ref":"$milos_vrf",
   "analytics_profile_ref":"$milos_anaylitics_profile",
   "tenant_ref":"$tenant",
   "cloud_ref":"$milos_cloud",
   "auto_allocate_ip":false,
   "weight":1,
   "flow_dist":"LOAD_AWARE",
   "delay_fairness":false,
   "avi_allocated_vip":false,
   "cloud_type":"CLOUD_NONE",
   "avi_allocated_fip":false,
   "scaleout_ecmp":false,
   "max_cps_per_client":0,
   "pool_ref":"$milos_pool4",
   "type":"VS_TYPE_NORMAL",
   "use_bridge_ip_as_vip":false,
   "application_profile_ref":"$milos_app_profile_L4",
   "auto_allocate_floating_ip":false,
   "services":[
      {
         "enable_ssl":false,
         "port_range_end":80,
         "port":80
      }
   ],
   "active_standby_se_tag":"ACTIVE_STANDBY_SE_1",
   "ip_address":{
      "type":"V4",
      "addr":"192.168.1.162"
   },
   "ign_pool_net_reach":false,
   "east_west_placement":false,
   "limit_doser":false,
   "ssl_sess_cache_avg_size":1024,
   "enable_autogw":true,
   "remove_listening_port_on_vs_down":false,
   "analytics_policy":{
      "client_insights":"ACTIVE",
      "metrics_realtime_update":{
         "duration":0,
         "enabled":false
      },
      "full_client_logs":{
         "duration":30,
         "enabled":false
      }
   }
}
EOF)

milos_vs4=$(curl -k -s -XPOST $url_base/virtualservice -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$vs4_json_data")
#echo "milos_vs4 url is $milos_vs4"
sleep 3


pool5_json_data=$(cat <<EOF
{
   "name":"HTTP-PassThrough-pool",
   "server_count":3,
   "enabled":true,
   "tenant_ref":"$tenant",
   "cloud_ref":"$milos_cloud",
   "lb_algorithm":"LB_ALGORITHM_ROUND_ROBIN",
   "use_service_port":false,
   "server_auto_scale":false,
   "host_check_enabled":false,
   "capacity_estimation":false,
   "servers":[
      {
         "hostname":"10.0.0.100",
         "ratio":1,
         "ip":{
            "type":"V4",
            "addr":"10.0.0.100"
         },
         "enabled":true,
         "verify_network":false,
         "static":false,
         "resolve_server_by_dns":false,
         "prst_hdr_val":"",
         "port":443
      },
      {
         "hostname":"10.0.0.101",
         "ratio":1,
         "ip":{
            "type":"V4",
            "addr":"10.0.0.101"
         },
         "enabled":true,
         "verify_network":false,
         "static":false,
         "resolve_server_by_dns":false,
         "prst_hdr_val":"",
         "port":443
      },
      {
         "hostname":"10.0.0.102",
         "ratio":1,
         "ip":{
            "type":"V4",
            "addr":"10.0.0.102"
         },
         "enabled":true,
         "verify_network":false,
         "static":false,
         "resolve_server_by_dns":false,
         "prst_hdr_val":"",
         "port":443
      }
   ],
   "fewest_tasks_feedback_delay":10,
   "fail_action":{
      "type":"FAIL_ACTION_CLOSE_CONN"
   },
   "ssl_profile_ref":"$ssl_profile_standard_url",
   "ssl_key_and_certificate_ref":"$ssl_certificate_url",
   "server_reselect":{
      "retry_nonidempotent":false,
      "enabled":false,
      "num_retries":4
   },
   "vrf_ref":"$milos_vrf",
   "inline_health_monitor":true,
   "default_server_port":80,
   "request_queue_depth":128,
   "graceful_disable_timeout":1,
   "sni_enabled":true,
   "request_queue_enabled":false,
   "max_concurrent_connections_per_server":0,
   "connection_ramp_duration":10
}
EOF)

milos_pool5=$(curl -s -k -XPOST $url_base/pool -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$pool5_json_data" |jq -r '.url')
echo "milos_pool5 url is $milos_pool5"
sleep 3

vs5_json_data=$(cat <<EOF
{
   "name":"HTTP-PassThrough",
   "enabled":true,
   "network_profile_ref":"$milos_network_profile_tcp",
   "se_group_ref":"$milos_seg",
   "vrf_context_ref":"$milos_vrf",
   "analytics_profile_ref":"$milos_anaylitics_profile",
   "tenant_ref":"$tenant",
   "cloud_ref":"$milos_cloud",
   "auto_allocate_ip":false,
   "weight":1,
   "flow_dist":"LOAD_AWARE",
   "delay_fairness":false,
   "avi_allocated_vip":false,
   "cloud_type":"CLOUD_NONE",
   "avi_allocated_fip":false,
   "ssl_profile_ref":"$ssl_profile_standard_url",
   "scaleout_ecmp":false,
   "max_cps_per_client":0,
   "pool_ref":"$milos_pool5",
   "type":"VS_TYPE_NORMAL",
   "ssl_key_and_certificate_refs":[
      "$ssl_certificate_url"
   ],
   "use_bridge_ip_as_vip":false,
   "application_profile_ref":"$milos_app_profile_http",
   "auto_allocate_floating_ip":false,
   "services":[
      {
         "enable_ssl":true,
         "port_range_end":443,
         "port":443
      }
   ],
   "active_standby_se_tag":"ACTIVE_STANDBY_SE_1",
   "ip_address":{
      "type":"V4",
      "addr":"192.168.1.164"
   },
   "ign_pool_net_reach":false,
   "east_west_placement":false,
   "limit_doser":false,
   "ssl_sess_cache_avg_size":1024,
   "enable_autogw":true,
   "remove_listening_port_on_vs_down":false,
   "analytics_policy":{
      "client_insights":"ACTIVE",
      "metrics_realtime_update":{
         "duration":0,
         "enabled":true
      },
      "full_client_logs":{
         "duration":0,
         "enabled":true
      }
   }
}
EOF)

milos_vs5=$(curl -k -s -XPOST $url_base/virtualservice -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$vs5_json_data")
#echo "milos_vs5 url is $milos_vs5"
sleep 3

pool6_json_data=$(cat <<EOF
{
   "name":"TCP-FullProxy-Adv-3-pool",
   "server_count":3,
   "enabled":true,
   "tenant_ref":"$tenant",
   "cloud_ref":"$milos_cloud",
   "lb_algorithm":"LB_ALGORITHM_ROUND_ROBIN",
   "use_service_port":false,
   "server_auto_scale":false,
   "host_check_enabled":false,
   "capacity_estimation":false,
   "servers":[
      {
         "hostname":"10.0.0.100",
         "ratio":1,
         "ip":{
            "type":"V4",
            "addr":"10.0.0.100"
         },
         "enabled":true,
         "verify_network":false,
         "static":false,
         "resolve_server_by_dns":false,
         "prst_hdr_val":"",
         "port":9093
      },
      {
         "hostname":"10.0.0.100",
         "ratio":1,
         "ip":{
            "type":"V4",
            "addr":"10.0.0.101"
         },
         "enabled":true,
         "verify_network":false,
         "static":false,
         "resolve_server_by_dns":false,
         "prst_hdr_val":"",
         "port":9093
      },
      {
         "hostname":"10.0.0.101",
         "ratio":1,
         "ip":{
            "type":"V4",
            "addr":"10.0.0.102"
         },
         "enabled":true,
         "verify_network":false,
         "static":false,
         "resolve_server_by_dns":false,
         "prst_hdr_val":"",
         "port":9093
      }
   ],
   "fewest_tasks_feedback_delay":10,
   "fail_action":{
      "type":"FAIL_ACTION_CLOSE_CONN"
   },
   "graceful_disable_timeout":1,
   "vrf_ref":"$milos_vrf",
   "inline_health_monitor":true,
   "default_server_port":80,
   "request_queue_depth":128,
   "server_reselect":{
      "retry_nonidempotent":false,
      "enabled":false,
      "num_retries":4
   },
   "sni_enabled":true,
   "request_queue_enabled":false,
   "max_concurrent_connections_per_server":0,
   "health_monitor_refs":[
      "$milos_hm_url"
   ],
   "connection_ramp_duration":10
}
EOF)

milos_pool6=$(curl -s -k -XPOST $url_base/pool -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$pool6_json_data" |jq -r '.url')
echo "milos_pool6 url is $milos_pool6"
sleep 3

vs6_json_data=$(cat <<EOF
{
   "name":"TCP-FullProxy-Adv-3",
   "enabled":true,
   "network_profile_ref":"$milos_network_profile_tcp",
   "se_group_ref":"$milos_seg",
   "vrf_context_ref":"$milos_vrf",
   "analytics_profile_ref":"$milos_anaylitics_profile",
   "tenant_ref":"$tenant",
   "cloud_ref":"$milos_cloud",
   "auto_allocate_ip":false,
   "weight":1,
   "flow_dist":"LOAD_AWARE",
   "delay_fairness":false,
   "avi_allocated_vip":false,
   "cloud_type":"CLOUD_NONE",
   "avi_allocated_fip":false,
   "ssl_profile_ref":"$ssl_profile_url",
   "scaleout_ecmp":false,
   "max_cps_per_client":0,
   "pool_ref":"$milos_pool6",
   "type":"VS_TYPE_NORMAL",
   "ssl_key_and_certificate_refs":[
      "$ssl_certificate_url"
   ],
   "use_bridge_ip_as_vip":false,
   "application_profile_ref":"$milos_app_profile_http",
   "auto_allocate_floating_ip":false,
   "services":[
      {
         "enable_ssl":false,
         "port_range_end":80,
         "port":80
      }
   ],
   "active_standby_se_tag":"ACTIVE_STANDBY_SE_1",
   "ip_address":{
      "type":"V4",
      "addr":"192.168.1.78"
   },
   "ign_pool_net_reach":false,
   "east_west_placement":false,
   "limit_doser":false,
   "ssl_sess_cache_avg_size":1024,
   "enable_autogw":true,
   "remove_listening_port_on_vs_down":false,
   "analytics_policy":{
      "client_insights":"ACTIVE",
      "metrics_realtime_update":{
         "duration":0,
         "enabled":false
      },
      "full_client_logs":{
         "duration":0,
         "enabled":false
      }
   }
}
EOF)

milos_vs6=$(curl -k -s -XPOST $url_base/virtualservice -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$vs6_json_data")
#echo "milos_vs6 url is $milos_vs6"
sleep 3

pool7_json_data=$(
cat <<EOF
{
   "name":"TCP-FullProxy-Basic-1-pool",
   "server_count":1,
   "enabled":true,
   "tenant_ref":"$tenant",
   "cloud_ref":"$milos_cloud",
   "lb_algorithm":"LB_ALGORITHM_LEAST_CONNECTIONS",
   "use_service_port":false,
   "server_auto_scale":false,
   "host_check_enabled":false,
   "capacity_estimation":false,
   "servers":[
      {
         "hostname":"10.0.0.201",
         "ratio":1,
         "ip":{
            "type":"V4",
            "addr":"10.0.0.201"
         },
         "enabled":true,
         "verify_network":false,
         "static":false,
         "resolve_server_by_dns":false,
         "port":53
      }
   ],
   "fewest_tasks_feedback_delay":10,
   "fail_action":{
      "type":"FAIL_ACTION_CLOSE_CONN"
   },
   "vrf_ref":"$milos_vrf",
   "inline_health_monitor":true,
   "default_server_port":80,
   "request_queue_depth":128,
   "graceful_disable_timeout":1,
   "sni_enabled":true,
   "request_queue_enabled":false,
   "max_concurrent_connections_per_server":0,
   "connection_ramp_duration":10
}
EOF)

milos_pool7=$(curl -s -k -XPOST $url_base/pool -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$pool7_json_data" |jq -r '.url')
echo "milos_pool7 url is $milos_pool7"
sleep 3

vs7_json_data=$(cat <<EOF
{
   "name":"TCP-FullProxy-Basic-1",
   "enabled":true,
   "network_profile_ref":"$milos_network_profile_udp_per_packet",
   "se_group_ref":"$milos_seg",
   "vrf_context_ref":"$milos_vrf",
   "analytics_profile_ref":"$milos_anaylitics_profile",
   "tenant_ref":"$tenant",
   "cloud_ref":"$milos_cloud",
   "weight":1,
   "flow_dist":"LOAD_AWARE",
   "ip_address":{
      "type":"V4",
      "addr":"192.168.1.151"
   },
   "delay_fairness":false,
   "avi_allocated_vip":false,
   "cloud_type":"CLOUD_NONE",
   "avi_allocated_fip":false,
   "scaleout_ecmp":false,
   "max_cps_per_client":0,
   "type":"VS_TYPE_NORMAL",
   "use_bridge_ip_as_vip":false,
   "application_profile_ref":"$milos_app_profile_L4",
   "auto_allocate_floating_ip":false,
   "services":[
      {
         "enable_ssl":false,
         "port_range_end":53,
         "port":53
      }
   ],
   "active_standby_se_tag":"ACTIVE_STANDBY_SE_1",
   "pool_ref":"$milos_pool7",
   "ign_pool_net_reach":false,
   "east_west_placement":false,
   "limit_doser":false,
   "ssl_sess_cache_avg_size":1024,
   "enable_autogw":true,
   "auto_allocate_ip":false,
   "remove_listening_port_on_vs_down":false
}
EOF)

milos_vs7=$(curl -k -s -XPOST $url_base/virtualservice -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$vs7_json_data")
#echo "milos_vs7 url is $milos_vs7"
sleep 3

pool8_json_data=$(cat <<EOF
{
   "name":"UDP-FullProxy-Basic-1-pool",
   "server_count":1,
   "enabled":true,
   "tenant_ref":"$tenant",
   "cloud_ref":"$milos_cloud",
   "lb_algorithm":"LB_ALGORITHM_LEAST_CONNECTIONS",
   "use_service_port":false,
   "server_auto_scale":false,
   "host_check_enabled":false,
   "capacity_estimation":false,
   "servers":[
      {
         "hostname":"10.0.0.201",
         "ratio":1,
         "ip":{
            "type":"V4",
            "addr":"10.0.0.201"
         },
         "enabled":true,
         "verify_network":false,
         "static":false,
         "resolve_server_by_dns":false,
         "port":53
      }
   ],
   "fewest_tasks_feedback_delay":10,
   "fail_action":{
      "type":"FAIL_ACTION_CLOSE_CONN"
   },
   "vrf_ref":"$milos_vrf",
   "inline_health_monitor":true,
   "default_server_port":80,
   "request_queue_depth":128,
   "graceful_disable_timeout":1,
   "sni_enabled":true,
   "request_queue_enabled":false,
   "max_concurrent_connections_per_server":0,
   "connection_ramp_duration":10
}
EOF)
milos_pool8=$(curl -s -k -XPOST $url_base/pool -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$pool8_json_data" |jq -r '.url')
echo "milos_pool8 url is $milos_pool8"
sleep 3

vs8_json_data=$(cat <<EOF
{
   "name":"UDP-FullProxy-Basic-1",
   "enabled":true,
   "network_profile_ref":"$milos_network_profile_udp_per_packet",
   "se_group_ref":"$milos_seg",
   "vrf_context_ref":"$milos_vrf",
   "analytics_profile_ref":"$milos_anaylitics_profile",
   "tenant_ref":"$tenant",
   "cloud_ref":"$milos_cloud",
   "weight":1,
   "flow_dist":"LOAD_AWARE",
   "ip_address":{
      "type":"V4",
      "addr":"192.168.1.152"
   },
   "delay_fairness":false,
   "avi_allocated_vip":false,
   "cloud_type":"CLOUD_NONE",
   "avi_allocated_fip":false,
   "scaleout_ecmp":false,
   "max_cps_per_client":0,
   "type":"VS_TYPE_NORMAL",
   "use_bridge_ip_as_vip":false,
   "application_profile_ref":"$milos_app_profile_dns",
   "auto_allocate_floating_ip":false,
   "services":[
      {
         "enable_ssl":false,
         "port_range_end":53,
         "port":53
      }
   ],
   "active_standby_se_tag":"ACTIVE_STANDBY_SE_1",
   "pool_ref":"$milos_pool8",
   "ign_pool_net_reach":false,
   "east_west_placement":false,
   "limit_doser":false,
   "ssl_sess_cache_avg_size":1024,
   "enable_autogw":true,
   "auto_allocate_ip":false,
   "remove_listening_port_on_vs_down":false,
   "analytics_policy":{
      "client_insights":"ACTIVE",
      "metrics_realtime_update":{
         "duration":0,
         "enabled":false
      },
      "full_client_logs":{
         "duration":0,
         "enabled":true
      }
   }
}
EOF)

milos_vs8=$(curl -k -s -XPOST $url_base/virtualservice -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$vs8_json_data")
#echo "milos_vs8 url is $milos_vs8"
sleep 3

pool9_json_data=$(cat <<EOF
{
   "name":"TCP-FullProxy-Adv-6-pool",
   "server_count":1,
   "enabled":true,
   "tenant_ref":"$tenant",
   "cloud_ref":"$milos_cloud",
   "lb_algorithm":"LB_ALGORITHM_LEAST_CONNECTIONS",
   "use_service_port":false,
   "server_auto_scale":false,
   "host_check_enabled":false,
   "capacity_estimation":false,
   "servers":[
      {
         "hostname":"192.168.1.25",
         "ratio":1,
         "ip":{
            "type":"V4",
            "addr":"192.168.1.25"
         },
         "enabled":true,
         "verify_network":false,
         "static":false,
         "resolve_server_by_dns":false,
         "prst_hdr_val":"",
         "port":443
      }
   ],
   "fewest_tasks_feedback_delay":10,
   "fail_action":{
      "type":"FAIL_ACTION_CLOSE_CONN"
   },
   "ssl_profile_ref":"$ssl_profile_standard_url",
   "ssl_key_and_certificate_ref":"$ssl_certificate_url",
   "server_reselect":{
      "retry_nonidempotent":false,
      "enabled":false,
      "num_retries":4
   },
   "vrf_ref":"$milos_vrf",
   "inline_health_monitor":true,
   "default_server_port":80,
   "request_queue_depth":128,
   "graceful_disable_timeout":1,
   "sni_enabled":false,
   "request_queue_enabled":false,
   "max_concurrent_connections_per_server":0,
   "connection_ramp_duration":10
}
EOF)
milos_pool9=$(curl -s -k -XPOST $url_base/pool -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$pool9_json_data" |jq -r '.url')
echo "milos_pool9 url is $milos_pool9"
sleep 3

vs9_json_data=$(cat <<EOF
{
    "name": "UDP-FullProxy-No-SNAT",
    "enabled": true,
    "network_profile_ref": "$milos_network_profile_udp_fast",
    "se_group_ref": "$milos_seg",
    "vrf_context_ref": "$milos_vrf",
    "analytics_profile_ref": "$milos_anaylitics_profile",
    "tenant_ref": "$tenant",
    "cloud_ref": "$milos_cloud",
    "weight": 1,
    "flow_dist": "LOAD_AWARE",
    "ip_address": {
        "type": "V4",
        "addr": "192.168.1.156"
    },
    "delay_fairness": false,
    "avi_allocated_vip": false,
    "cloud_type": "CLOUD_NONE",
    "avi_allocated_fip": false,
    "scaleout_ecmp": false,
    "max_cps_per_client": 0,
    "type": "VS_TYPE_NORMAL",
    "use_bridge_ip_as_vip": false,
    "application_profile_ref": "$milos_app_profile_L4",
    "auto_allocate_floating_ip": false,
    "services": [
        {
            "enable_ssl": false,
            "port_range_end": 53,
            "port": 53
        }
    ],
    "active_standby_se_tag": "ACTIVE_STANDBY_SE_1",
    "pool_ref": "$milos_pool9",
    "ign_pool_net_reach": false,
    "east_west_placement": false,
    "limit_doser": false,
    "ssl_sess_cache_avg_size": 1024,
    "enable_autogw": true,
    "auto_allocate_ip": false,
    "remove_listening_port_on_vs_down": false,
    "analytics_policy": {
        "client_insights": "ACTIVE",
        "metrics_realtime_update": {
            "duration": 0,
            "enabled": true
        },
        "full_client_logs": {
            "duration": 0,
            "enabled": true
        }
    }
}
EOF)

milos_vs9=$(curl -k -s -XPOST $url_base/virtualservice -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$vs9_json_data")
#echo "milos_vs9 url is $milos_vs9"
sleep 3

pool_cs_json_data=$(cat <<EOF
{
"name": "CS-Pool",
"server_count": 2,
"enabled": true,
"tenant_ref": "$tenant",
"cloud_ref": "$milos_cloud",
"lb_algorithm": "LB_ALGORITHM_ROUND_ROBIN",
"use_service_port": false,
"server_auto_scale": false,
"host_check_enabled": false,
"capacity_estimation": false,
"servers": [
{
"hostname": "10.0.0.100",
"ratio": 1,
"ip": {
"type": "V4",
"addr": "10.0.0.100"
},
"enabled": true,
"verify_network": false,
"static": false,
"resolve_server_by_dns": false,
"prst_hdr_val": "",
"port": 9093
},
{
"hostname": "10.0.0.100",
"ratio": 1,
"ip": {
"type": "V4",
"addr": "10.0.0.100"
},
"enabled": true,
"verify_network": false,
"static": false,
"resolve_server_by_dns": false,
"prst_hdr_val": "",
"port": 9094
}
],
"fewest_tasks_feedback_delay": 10,
"fail_action": {
"type": "FAIL_ACTION_CLOSE_CONN"
},
"graceful_disable_timeout": 1,
"vrf_ref": "$milos_vrf",
"inline_health_monitor": true,
"default_server_port": 80,
"request_queue_depth": 128,
"server_reselect": {
"retry_nonidempotent": false,
"enabled": false,
"num_retries": 4
},
"sni_enabled": true,
"request_queue_enabled": false,
"max_concurrent_connections_per_server": 0,
"connection_ramp_duration": 10
}
EOF)
milos_pool_cs=$(curl -s -k -XPOST $url_base/pool -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$pool_cs_json_data" |jq -r '.url')
echo "milos_pool_cs url is $milos_pool_cs"
sleep 3

pool10_json_data=$(cat <<EOF
{
"name": "HTTP-FullProxy-Basic-1-pool",
"server_count": 2,
"enabled": true,
"tenant_ref": "$tenant",
"cloud_ref": "$milos_cloud",
"lb_algorithm": "LB_ALGORITHM_LEAST_CONNECTIONS",
"use_service_port": false,
"server_auto_scale": false,
"host_check_enabled": false,
"capacity_estimation": false,
"servers": [
{
"hostname": "10.0.0.100",
"ratio": 1,
"ip": {
"type": "V4",
"addr": "10.0.0.100"
},
"enabled": true,
"verify_network": false,
"static": false,
"resolve_server_by_dns": false,
"port": 9091
},
{
"hostname": "10.0.0.100",
"ratio": 1,
"ip": {
"type": "V4",
"addr": "10.0.0.100"
},
"enabled": true,
"verify_network": false,
"static": false,
"resolve_server_by_dns": false,
"prst_hdr_val": "",
"port": 9092
}
],
"fewest_tasks_feedback_delay": 10,
"fail_action": {
"type": "FAIL_ACTION_CLOSE_CONN"
},
"graceful_disable_timeout": 1,
"vrf_ref": "$miloa_vrf",
"inline_health_monitor": true,
"default_server_port": 80,
"request_queue_depth": 128,
"server_reselect": {
"retry_nonidempotent": false,
"enabled": false,
"num_retries": 4
},
"sni_enabled": true,
"request_queue_enabled": false,
"max_concurrent_connections_per_server": 0,
"health_monitor_refs": [
"$milos_hm_url"
],
"connection_ramp_duration": 10
}
EOF)
milos_pool10=$(curl -s -k -XPOST $url_base/pool -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$pool10_json_data" |jq -r '.url')
echo "milos_pool10 url is $milos_pool10"
sleep 3

echo "delete existing http policy set\n"
resp=$(curl -k -s $url_base/httppolicyset  \
-H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie"|jq -r '.results[].url')
if [ -n "$resp" ]; then
  for url in $resp; do
    echo "deleting http policy set: $url"
    curl -k -s -XDELETE $url -H "X-Csrftoken: $milos_csrf" \
    -H "X-Avi-Tenant: admin" \
    -H "Content-Type: application/json" \
    -H "Referer: $milos_refer" \
    --cookie "$milos_cookie"
  done
fi

http_policy_set_json_data=$(cat <<EOF
{
    "name": "HTTP-FullProxy-Basic-1-HTTP-Policy-Set",
    "tenant_ref": "$tenant",
    "http_request_policy": {
    "rules": [
    {
    "index": 1,
    "enable": true,
    "log": true,
    "switching_action": {
    "action": "HTTP_SWITCHING_SELECT_POOL",
    "status_code": "HTTP_LOCAL_RESPONSE_STATUS_CODE_200",
    "pool_ref": "$milos_pool_cs"
    },
    "all_headers": true,
    "match": {
    "path": {
    "match_case": "INSENSITIVE",
    "match_str": [
    "/foo",
    "/bar"
    ],
    "match_criteria": "BEGINS_WITH"
    },
    "hdrs": [
    {
    "match_case": "INSENSITIVE",
    "hdr": "test",
    "value": [
    "test"
    ],
    "match_criteria": "HDR_CONTAINS"
    }
    ]
    },
    "name": "Rule 1"
    }
    ]
    },
    "is_internal_policy": false
    }
EOF)
milos_http_policyset_1=$(curl -s -k -XPOST $url_base/httppolicyset -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$http_policy_set_json_data" |jq -r '.url')
echo "milos_http_policyset_1 url is $milos_http_policyset_1"
sleep 10

vs10_json_data=$(cat <<EOF
{
    "name": "HTTP-FullProxy-Basic-1",
    "enabled": true,
    "network_profile_ref": "$milos_network_profile_tcp",
    "se_group_ref": "$milos_seg",
    "vrf_context_ref": "$milos_vrf",
    "analytics_profile_ref": "$milos_anaylitics_profile",
    "tenant_ref": "$tenant",
    "cloud_ref": "$milos_cloud",
    "auto_allocate_ip": false,
    "weight": 1,
    "flow_dist": "LOAD_AWARE",
    "delay_fairness": false,
    "avi_allocated_vip": false,
    "http_policies": [
    {
    "index": 11,
    "http_policy_set_ref": "$milos_http_policyset_1"
    }
    ],
    "cloud_type": "CLOUD_NONE",
    "avi_allocated_fip": false,
    "scaleout_ecmp": false,
    "max_cps_per_client": 0,
    "redis_db": 6,
    "pool_ref": "$milos_pool10",
    "type": "VS_TYPE_NORMAL",
    "use_bridge_ip_as_vip": false,
    "redis_port": 5023,
    "application_profile_ref": "$milos_app_profile_http",
    "auto_allocate_floating_ip": false,
    "ip_address": {
    "type": "V4",
    "addr": "192.168.1.150"
    },
    "ign_pool_net_reach": false,
    "east_west_placement": false,
    "limit_doser": false,
    "ssl_sess_cache_avg_size": 1024,
    "enable_autogw": true,
    "remove_listening_port_on_vs_down": false,
    "services": [
    {
    "enable_ssl": false,
    "port_range_end": 80,
    "port": 80
    }
    ],
    "analytics_policy": {
    "client_insights": "ACTIVE",
    "metrics_realtime_update": {
    "duration": 0,
    "enabled": true
    },
    "full_client_logs": {
    "duration": 0,
    "enabled": true
    }
    }
    }
EOF)
milos_vs10=$(curl -k -s -XPOST $url_base/virtualservice -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$vs10_json_data")
#echo "milos_vs10 url is $milos_vs10"
sleep 3

pool11_json_data=$(cat <<EOF
{
    "name": "TCP-FullProxy-Basic-2-pool",
    "server_count": 2,
    "enabled": true,
    "tenant_ref": "$tenant",
    "cloud_ref": "$milos_cloud",
    "lb_algorithm": "LB_ALGORITHM_ROUND_ROBIN",
    "use_service_port": false,
    "server_auto_scale": false,
    "host_check_enabled": false,
    "capacity_estimation": false,
    "servers": [
    {
    "hostname": "10.0.0.200",
    "ratio": 1,
    "ip": {
    "type": "V4",
    "addr": "10.0.0.100"
    },
    "enabled": true,
    "verify_network": false,
    "static": false,
    "resolve_server_by_dns": false,
    "port": 9093
    },
    {
    "hostname": "10.0.0.100",
    "ratio": 1,
    "ip": {
    "type": "V4",
    "addr": "10.0.0.100"
    },
    "enabled": true,
    "verify_network": false,
    "static": false,
    "resolve_server_by_dns": false,
    "prst_hdr_val": "",
    "port": 9094
    }
    ],
    "fewest_tasks_feedback_delay": 10,
    "fail_action": {
    "type": "FAIL_ACTION_CLOSE_CONN"
    },
    "vrf_ref": "$milos_vrf",
    "inline_health_monitor": true,
    "default_server_port": 80,
    "request_queue_depth": 128,
    "graceful_disable_timeout": 1,
    "sni_enabled": true,
    "request_queue_enabled": false,
    "max_concurrent_connections_per_server": 0,
    "connection_ramp_duration": 10
}
EOF)
milos_pool11=$(curl -s -k -XPOST $url_base/pool -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$pool11_json_data" |jq -r '.url')
echo "milos_pool11 url is $milos_pool11"
sleep 3

vs11_json_data=$(cat <<EOF
{
    "network_profile_ref": "$milos_network_profile_tcp",
    "auto_allocate_ip": false,
    "weight": 1,
    "tenant_ref": "$tenant",
    "flow_dist": "LOAD_AWARE",
    "delay_fairness": false,
    "avi_allocated_vip": false,
    "vrf_context_ref": "$milos_vrf",
    "analytics_profile_ref": "$milos_anaylitics_profile",
    "cloud_type": "CLOUD_NONE",
    "cloud_ref": "$milos_cloud",
    "avi_allocated_fip": false,
    "se_group_ref": "$milos_seg",
    "scaleout_ecmp": false,
    "max_cps_per_client": 0,
    "pool_ref": "$milos_pool11",
    "type": "VS_TYPE_NORMAL",
    "use_bridge_ip_as_vip": false,
    "application_profile_ref": "$milos_app_profile_L4",
    "auto_allocate_floating_ip": false,
    "services": [
    {
    "enable_ssl": false,
    "port_range_end": 5050,
    "port": 5050
    }
    ],
    "active_standby_se_tag": "ACTIVE_STANDBY_SE_1",
    "ip_address": {
    "type": "V4",
    "addr": "192.168.1.153"
    },
    "ign_pool_net_reach": false,
    "east_west_placement": false,
    "limit_doser": false,
    "name": "TCP-FullProxy-Basic-2",
    "ssl_sess_cache_avg_size": 1024,
    "enable_autogw": true,
    "enabled": true,
    "remove_listening_port_on_vs_down": false,
    "analytics_policy": {
    "client_insights": "ACTIVE",
    "metrics_realtime_update": {
    "duration": 0,
    "enabled": false
    },
    "full_client_logs": {
    "duration": 0,
    "enabled": true
    }
    }
}
EOF)
milos_vs11=$(curl -k -s -XPOST $url_base/virtualservice -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$vs11_json_data")
#echo "milos_vs11 url is $milos_vs11"
sleep 3

pool12_json_data=$(cat <<EOF
{
      "name": "HTTP-Pool-Encryt-pool",
      "server_count": 3,
      "enabled": true,
      "tenant_ref": "$tenant",
      "cloud_ref": "$milos_cloud",
      "lb_algorithm": "LB_ALGORITHM_ROUND_ROBIN",
      "use_service_port": false,
      "server_auto_scale": false,
      "host_check_enabled": false,
      "capacity_estimation": false,
      "servers": [
      {
      "hostname": "10.0.0.100",
      "ratio": 1,
      "ip": {
      "type": "V4",
      "addr": "10.0.0.100"
      },
      "enabled": true,
      "verify_network": false,
      "static": false,
      "resolve_server_by_dns": false,
      "prst_hdr_val": "",
      "port": 443
      },
      {
      "hostname": "10.0.0.101",
      "ratio": 1,
      "ip": {
      "type": "V4",
      "addr": "10.0.0.101"
      },
      "enabled": true,
      "verify_network": false,
      "static": false,
      "resolve_server_by_dns": false,
      "prst_hdr_val": "",
      "port": 443
      },
      {
      "hostname": "10.0.0.102",
      "ratio": 1,
      "ip": {
      "type": "V4",
      "addr": "10.0.0.102"
      },
      "enabled": true,
      "verify_network": false,
      "static": false,
      "resolve_server_by_dns": false,
      "prst_hdr_val": "",
      "port": 443
      }
      ],
      "fewest_tasks_feedback_delay": 10,
      "fail_action": {
      "type": "FAIL_ACTION_CLOSE_CONN"
      },
      "ssl_profile_ref": "$ssl_profile_standard_url",
      "ssl_key_and_certificate_ref": "$ssl_certificate_url",
      "server_reselect": {
      "retry_nonidempotent": false,
      "enabled": false,
      "num_retries": 4
      },
      "vrf_ref": "$milos_vrf",
      "inline_health_monitor": true,
      "default_server_port": 80,
      "request_queue_depth": 128,
      "graceful_disable_timeout": 1,
      "sni_enabled": true,
      "request_queue_enabled": false,
      "max_concurrent_connections_per_server": 0,
      "connection_ramp_duration": 10
}
EOF)
milos_pool12=$(curl -s -k -XPOST $url_base/pool -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$pool12_json_data" |jq -r '.url')
echo "milos_pool12 url is $milos_pool12"
sleep 3

vs12_json_data=$(cat <<EOF
{
    "network_profile_ref": "$milos_network_profile_tcp",
    "weight": 1,
    "tenant_ref": "$tenant",
    "flow_dist": "LOAD_AWARE",
    "ip_address": {
    "type": "V4",
    "addr": "192.168.1.165"
    },
    "delay_fairness": false,
    "avi_allocated_vip": false,
    "vrf_context_ref": "$milos_vrf",
    "analytics_profile_ref": "$milos_anaylitics_profile",
    "cloud_type": "CLOUD_NONE",
    "cloud_ref": "$milos_cloud",
    "avi_allocated_fip": false,
    "se_group_ref": "$milos_seg",
    "scaleout_ecmp": false,
    "max_cps_per_client": 0,
    "type": "VS_TYPE_NORMAL",
    "use_bridge_ip_as_vip": false,
    "application_profile_ref": "$milos_app_profile_http",
    "auto_allocate_floating_ip": false,
    "services": [
    {
    "enable_ssl": false,
    "port_range_end": 80,
    "port": 80
    }
    ],
    "active_standby_se_tag": "ACTIVE_STANDBY_SE_1",
    "pool_ref": "$milos_pool12",
    "ign_pool_net_reach": false,
    "east_west_placement": false,
    "limit_doser": false,
    "name": "HTTP-Pool-Encryt",
    "ssl_sess_cache_avg_size": 1024,
    "enable_autogw": true,
    "auto_allocate_ip": false,
    "enabled": true,
    "remove_listening_port_on_vs_down": false,
    "analytics_policy": {
    "client_insights": "ACTIVE",
    "metrics_realtime_update": {
    "duration": 0,
    "enabled": true
    },
    "full_client_logs": {
    "duration": 0,
    "enabled": true
    }
    }
}
EOF)
milos_vs12=$(curl -k -s -XPOST $url_base/virtualservice -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$vs12_json_data")
#echo "milos_vs12 url is $milos_vs12"
sleep 3

pool13_json_data=$(cat <<EOF
{
    "name": "HTTP-FullProxy-Adv-2-pool",
    "server_count": 2,
    "enabled": true,
    "tenant_ref": "$tenant",
    "cloud_ref": "$milos_cloud",
    "lb_algorithm": "LB_ALGORITHM_ROUND_ROBIN",
    "use_service_port": false,
    "server_auto_scale": false,
    "host_check_enabled": false,
    "capacity_estimation": false,
    "servers": [
    {
    "hostname": "10.0.0.100",
    "ratio": 1,
    "ip": {
    "type": "V4",
    "addr": "10.0.0.100"
    },
    "enabled": true,
    "verify_network": false,
    "static": false,
    "resolve_server_by_dns": false,
    "prst_hdr_val": "",
    "port": 9093
    },
    {
    "hostname": "10.0.0.100",
    "ratio": 1,
    "ip": {
    "type": "V4",
    "addr": "10.0.0.100"
    },
    "enabled": true,
    "verify_network": false,
    "static": false,
    "resolve_server_by_dns": false,
    "prst_hdr_val": "",
    "port": 9094
    }
    ],
    "fewest_tasks_feedback_delay": 10,
    "fail_action": {
    "type": "FAIL_ACTION_CLOSE_CONN"
    },
    "graceful_disable_timeout": 1,
    "vrf_ref": "$milos_vrf",
    "inline_health_monitor": true,
    "default_server_port": 80,
    "request_queue_depth": 128,
    "server_reselect": {
    "retry_nonidempotent": false,
    "enabled": false,
    "num_retries": 4
    },
    "sni_enabled": true,
    "request_queue_enabled": true,
    "max_concurrent_connections_per_server": 0,
    "connection_ramp_duration": 10
}
EOF)
milos_pool13=$(curl -s -k -XPOST $url_base/pool -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$pool13_json_data" |jq -r '.url')
echo "milos_pool13 url is $milos_pool13"
sleep 3

vs13_json_data=$(cat <<EOF
{
    "network_profile_ref": "$milos_network_profile_tcp",
    "auto_allocate_ip": false,
    "weight": 1,
    "tenant_ref": "$tenant",
    "flow_dist": "LOAD_AWARE",
    "delay_fairness": false,
    "avi_allocated_vip": false,
    "vrf_context_ref": "$milos_vrf",
    "analytics_profile_ref": "$milos_anaylitics_profile",
    "cloud_type": "CLOUD_NONE",
    "cloud_ref": "$milos_cloud",
    "avi_allocated_fip": false,
    "se_group_ref": "$milos_seg",
    "ssl_profile_ref": "$ssl_profile_standard_url",
    "scaleout_ecmp": false,
    "max_cps_per_client": 0,
    "redis_db": 6,
    "pool_ref": "milos_pool13",
    "type": "VS_TYPE_NORMAL",
    "ssl_key_and_certificate_refs": [
    "$ssl_certificate_url"
    ],
    "use_bridge_ip_as_vip": false,
    "redis_port": 5028,
    "application_profile_ref": "$milos_app_profile_http",
    "auto_allocate_floating_ip": false,
    "active_standby_se_tag": "ACTIVE_STANDBY_SE_1",
    "ip_address": {
    "type": "V4",
    "addr": "192.168.1.158"
    },
    "ign_pool_net_reach": false,
    "east_west_placement": false,
    "limit_doser": false,
    "name": "HTTP-FullProxy-Adv-2",
    "ssl_sess_cache_avg_size": 1024,
    "enable_autogw": true,
    "enabled": false,
    "remove_listening_port_on_vs_down": false,
    "services": [
    {
    "enable_ssl": true,
    "port_range_end": 443,
    "port": 443
    }
    ],
    "analytics_policy": {
    "client_insights": "ACTIVE",
    "metrics_realtime_update": {
    "duration": 0,
    "enabled": true
    },
    "full_client_logs": {
    "duration": 0,
    "enabled": true
    }
    }
}
EOF)
milos_vs13=$(curl -k -s -XPOST $url_base/virtualservice -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$vs13_json_data")
#echo "milos_vs13 url is $milos_vs13"
sleep 3

pool14_json_data=$(cat <<EOF
{
    "name": "HTTP-FullProxy-Adv-3-pool",
    "server_count": 2,
    "enabled": true,
    "tenant_ref": "$tenant",
    "cloud_ref": "$milos_cloud",
    "lb_algorithm": "LB_ALGORITHM_LEAST_CONNECTIONS",
    "use_service_port": false,
    "server_auto_scale": false,
    "host_check_enabled": false,
    "capacity_estimation": false,
    "servers": [
    {
    "hostname": "192.168.1.25",
    "ratio": 1,
    "ip": {
    "type": "V4",
    "addr": "192.168.1.25"
    },
    "enabled": true,
    "verify_network": false,
    "static": false,
    "resolve_server_by_dns": false,
    "prst_hdr_val": "",
    "port": 9091
    },
    {
    "hostname": "192.168.1.25",
    "ratio": 1,
    "ip": {
    "type": "V4",
    "addr": "192.168.1.25"
    },
    "enabled": true,
    "verify_network": false,
    "static": false,
    "resolve_server_by_dns": false,
    "prst_hdr_val": "",
    "port": 9092
    }
    ],
    "fewest_tasks_feedback_delay": 10,
    "fail_action": {
    "type": "FAIL_ACTION_CLOSE_CONN"
    },
    "graceful_disable_timeout": 1,
    "vrf_ref": "milos_vrf",
    "inline_health_monitor": true,
    "default_server_port": 80,
    "request_queue_depth": 128,
    "server_reselect": {
    "retry_nonidempotent": false,
    "enabled": false,
    "num_retries": 4
    },
    "sni_enabled": true,
    "request_queue_enabled": false,
    "max_concurrent_connections_per_server": 0,
    "connection_ramp_duration": 10
}
EOF)
vs14_json_data=$(cat <<EOF
{
      "network_profile_ref": "$milos_network_profile_tcp",
      "auto_allocate_ip": false,
      "weight": 1,
      "tenant_ref": "$tenant",
      "flow_dist": "LOAD_AWARE",
      "delay_fairness": false,
      "avi_allocated_vip": false,
      "vrf_context_ref": "$milos_vrf",
      "analytics_profile_ref": "$milos_anaylitics_profile",
      "cloud_type": "CLOUD_NONE",
      "cloud_ref": "$milos_cloud",
      "avi_allocated_fip": false,
      "se_group_ref": "$milos_seg",
      "scaleout_ecmp": false,
      "max_cps_per_client": 0,
      "pool_ref": "$milos_pool14",
      "type": "VS_TYPE_NORMAL",
      "use_bridge_ip_as_vip": false,
      "application_profile_ref": "$milos_app_profile_http",
      "auto_allocate_floating_ip": false,
      "services": [
      {
      "enable_ssl": false,
      "port_range_end": 80,
      "port": 80
      }
      ],
      "active_standby_se_tag": "ACTIVE_STANDBY_SE_1",
      "ip_address": {
      "type": "V4",
      "addr": "10.0.0.150"
      },
      "ign_pool_net_reach": false,
      "east_west_placement": false,
      "limit_doser": false,
      "name": "HTTP-FullProxy-Adv-3",
      "ssl_sess_cache_avg_size": 1024,
      "enable_autogw": true,
      "enabled": false,
      "remove_listening_port_on_vs_down": false,
      "analytics_policy": {
      "client_insights": "ACTIVE",
      "metrics_realtime_update": {
      "duration": 0,
      "enabled": false
      },
      "full_client_logs": {
      "duration": 0,
      "enabled": true
      }
      }
}
EOF)
milos_pool14=$(curl -s -k -XPOST $url_base/pool -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$pool14_json_data" |jq -r '.url')
echo "milos_pool14 url is $milos_pool14"
sleep 3
milos_vs14=$(curl -k -s -XPOST $url_base/virtualservice -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$vs14_json_data")
#echo "milos_vs13 url is $milos_vs13"
sleep 3

pool15_json_data=$(cat <<EOF
{
   "name":"UDP-FastPath-Adv-1-pool",
   "server_count":1,
   "enabled":true,
   "tenant_ref":"$tenant",
   "cloud_ref":"$milos_cloud",
   "lb_algorithm":"LB_ALGORITHM_LEAST_CONNECTIONS",
   "use_service_port":false,
   "server_auto_scale":false,
   "host_check_enabled":false,
   "capacity_estimation":false,
   "servers":[
      {
         "hostname":"10.0.0.201",
         "ratio":1,
         "ip":{
            "type":"V4",
            "addr":"10.0.0.201"
         },
         "enabled":true,
         "verify_network":false,
         "static":false,
         "resolve_server_by_dns":false,
         "prst_hdr_val":"",
         "port":53
      }
   ],
   "fewest_tasks_feedback_delay":10,
   "fail_action":{
      "type":"FAIL_ACTION_CLOSE_CONN"
   },
   "graceful_disable_timeout":1,
   "vrf_ref":"$milos_vrf",
   "inline_health_monitor":true,
   "default_server_port":80,
   "request_queue_depth":128,
   "server_reselect":{
      "retry_nonidempotent":false,
      "enabled":false,
      "num_retries":4
   },
   "sni_enabled":true,
   "request_queue_enabled":false,
   "max_concurrent_connections_per_server":0,
   "connection_ramp_duration":10
}
EOF)
vs15_json_data=$(cat <<EOF
{
    "network_profile_ref": "$milos_network_profile_udp_fast",
    "auto_allocate_ip": false,
    "weight": 1,
    "tenant_ref": "$tenant",
    "flow_dist": "LOAD_AWARE",
    "delay_fairness": false,
    "avi_allocated_vip": false,
    "vrf_context_ref": "$milos_vrf",
    "analytics_profile_ref": "$milos_anaylitics_profile",
    "cloud_type": "CLOUD_NONE",
    "cloud_ref": "$milos_cloud",
    "avi_allocated_fip": false,
    "se_group_ref": "$milos_seg",
    "scaleout_ecmp": false,
    "max_cps_per_client": 0,
    "pool_ref": "$milos_pool15",
    "type": "VS_TYPE_NORMAL",
    "use_bridge_ip_as_vip": false,
    "application_profile_ref": "$milos_app_profile_L4",
    "auto_allocate_floating_ip": false,
    "services": [
    {
    "enable_ssl": false,
    "port_range_end": 53,
    "port": 53
    }
    ],
    "active_standby_se_tag": "ACTIVE_STANDBY_SE_1",
    "ip_address": {
    "type": "V4",
    "addr": "192.168.1.155"
    },
    "ign_pool_net_reach": false,
    "east_west_placement": false,
    "limit_doser": false,
    "name": "UDP-FastPath-Adv-1",
    "ssl_sess_cache_avg_size": 1024,
    "enable_autogw": true,
    "enabled": true,
    "remove_listening_port_on_vs_down": false,
    "analytics_policy": {
    "client_insights": "ACTIVE",
    "metrics_realtime_update": {
    "duration": 0,
    "enabled": false
    },
    "full_client_logs": {
    "duration": 0,
    "enabled": false
    }
    }
}
EOF)
milos_pool15=$(curl -s -k -XPOST $url_base/pool -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$pool15_json_data" |jq -r '.url')
echo "milos_pool15 url is $milos_pool15"
sleep 3
milos_vs15=$(curl -k -s -XPOST $url_base/virtualservice -H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie" -d "$vs15_json_data")
#echo "milos_vs15 url is $milos_vs15"
sleep 3

echo "Generating the test traffic..."
resp=$(curl -k -s $url_base/virtualservice  \
-H "X-Csrftoken: $milos_csrf" \
-H "X-Avi-Tenant: admin" \
-H "Content-Type: application/json" \
-H "Referer: $milos_refer" \
--cookie "$milos_cookie"|jq -r '.results[].url')
if [ -n "$resp" ]; then
  for i in {1..50}; do
    for url in $resp; do
      #echo "vs url: $url"
      ip=$(curl -k -s -XGET $url -H "X-Csrftoken: $milos_csrf" \
      -H "X-Avi-Tenant: admin" \
      -H "Content-Type: application/json" \
      -H "Referer: $milos_refer" \
      --cookie "$milos_cookie"|jq -r '.ip_address.addr')
      port=$(curl -k -s -XGET $url -H "X-Csrftoken: $milos_csrf" \
      -H "X-Avi-Tenant: admin" \
      -H "Content-Type: application/json" \
      -H "Referer: $milos_refer" \
      --cookie "$milos_cookie"|jq -r '.services[0].port')
      profile_ref=$(curl -k -s -XGET $url -H "X-Csrftoken: $milos_csrf" \
      -H "X-Avi-Tenant: admin" \
      -H "Content-Type: application/json" \
      -H "Referer: $milos_refer" \
      --cookie "$milos_cookie" | jq -r '.network_profile_ref')
      profile=$(curl -k -s -XGET $profile_ref -H "X-Csrftoken: $milos_csrf" \
      -H "X-Avi-Tenant: admin" \
      -H "Content-Type: application/json" \
      -H "Referer: $milos_refer" \
      --cookie "$milos_cookie" | jq -r '.name')
      if [[ $port == 443 ]]; then
        curl -k -s -XGET "https://$ip:$port"
      elif [[ $port == 53 && "$profile" == "System-UDP-*" ]]; then
        dig  a.test.local  @192.168.1.151 +short
      else
        curl -s -XGET "http://$ip:$port"
      fi
      sleep 1
      done
  done
fi
