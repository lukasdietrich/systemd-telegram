.PHONY: install update install-script install-config install-systemd

SRC_BIN     = $(wildcard usr/local/bin/*)
SRC_ETC     = $(wildcard usr/local/etc/systemd-telegram/*)
SRC_SYSTEMD = $(wildcard etc/systemd/system/*)
SRC_SYSTEMD_USER = $(wildcard etc/systemd/user/*)

DST_BIN     = /usr/local/bin
DST_ETC     = /usr/local/etc/systemd-telegram
DST_SYSTEMD = /etc/systemd/system
DST_SYSTEMD_USER = /etc/systemd/user

BACKUP      = existing
INSTALL     = install --backup=$(BACKUP)

install: update install-config 

update: install-script install-systemd install-systemd-user

install-script:
	$(INSTALL) -d $(DST_BIN)
	$(INSTALL) -m 0755 -t $(DST_BIN) $(SRC_BIN)

install-config:
	$(INSTALL) -d $(DST_ETC)
	$(INSTALL) -m 0600 -t $(DST_ETC) $(SRC_ETC)

install-systemd: 
	$(INSTALL) -d $(DST_SYSTEMD)
	$(INSTALL) -m 0644 -t $(DST_SYSTEMD) $(SRC_SYSTEMD)

install-systemd-user: 
	$(INSTALL) -d $(DST_SYSTEMD_USER)
	$(INSTALL) -m 0644 -t $(DST_SYSTEMD_USER) $(SRC_SYSTEMD_USER)
