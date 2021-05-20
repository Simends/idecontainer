DESTPREFIX=${HOME}/.local/bin
SRC=startide.sh

install:
	cp ${SRC} ${DESTPREFIX}/startide
	chmod 755 ${DESTPREFIX}/startide
	docker build -t idecontainer .

uninstall:
	rm -f ${DESTPREFIX}/startide
	docker rmi idecontainer
