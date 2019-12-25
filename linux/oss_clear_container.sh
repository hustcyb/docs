# user信息
USER=ESG-BDUS-CORE-SIT
# account信息
ACCOUNT=${USER}
# 密码
# KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
KEY=5b43f4bc03d8c50a07690d3b91a8955a
# 存储URL
DCN=ESG-BDUS-CORE-DCN.osssit.sfdc.com.cn:8080
# 容器名称，支持正则表达式
CONTAINER_PATTERN=efp

TOKEN=$(curl -s -i -H "X-Auth-User: ${USER}:${ACCOUNT}" -H "X-Auth-Key: ${KEY}" "http://${DCN}/auth/v1.0" | grep "X-Auth-Token: " | sed 's/X-Auth-Token: //')
for CONTAINER in $(curl -s -H "X-Storage-Token: ${TOKEN}" "http://${DCN}/v1.0/AUTH_${ACCOUNT}/" | grep -E "${CONTAINER_PATTERN}")
do
	for OBJECT in $(curl -s -H "X-Storage-Token: ${TOKEN}" "http://${DCN}/v1.0/AUTH_${ACCOUNT}/${CONTAINER}")
	do
		# 删除对象
		HTTP_CODE=$(curl -s -o /dev/null -XDELETE -H "X-Storage-Token: ${TOKEN}" "http://${DCN}/v1.0/AUTH_${ACCOUNT}/${CONTAINER}/${OBJECT}" -w "%{http_code}")
		echo "delete ${CONTAINER}/${OBJECT} ${HTTP_CODE}"
	done

	# 删除容器
	# HTTP_CODE=$(curl -s -o /dev/null -XDELETE -H "X-Storage-Token: ${TOKEN}" "http://${DCN}/v1.0/AUTH_${ACCOUNT}/${CONTAINER}" -w "%{http_code}")
	# echo "delete ${CONTAINER} ${HTTP_CODE}"
done