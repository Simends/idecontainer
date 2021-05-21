DESTPREFIX=${HOME}/.local/bin
SRC=startide.sh

install:
	cp ${SRC} ${DESTPREFIX}/ide
	chmod 755 ${DESTPREFIX}/ide
	docker build -t idecontainer .

uninstall:
	rm -f ${DESTPREFIX}/ide
	docker rmi idecontainer
