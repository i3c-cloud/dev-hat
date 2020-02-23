

export USERDIR=$uData

dParams="-d -p 8123:8123 \
		-v ${USERDIR}/config:/config \
		-v /etc/localtime:/etc/localtime:ro \
		-v ${USERDIR}/shared:/shared"
