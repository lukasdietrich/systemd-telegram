SRC_BIN            = $(wildcard usr/local/bin/*)
SRC_ETC            = $(wildcard usr/local/etc/systemd-telegram/*)
SRC_SYSTEMD_SYSTEM = $(wildcard etc/systemd/system/*)
SRC_SYSTEMD_USER   = $(wildcard etc/systemd/user/*)

DST_BIN            = /usr/local/bin
DST_ETC            = /usr/local/etc/systemd-telegram
DST_SYSTEMD_SYSTEM = /etc/systemd/system
DST_SYSTEMD_USER   = /etc/systemd/user

BACKUP             = existing
INSTALL            = install --backup=$(BACKUP)

.PHONY: install
install: update install-config 

.PHONY: update
update: install-script install-systemd

.PHONY: install-script
install-script:
	$(INSTALL) -d $(DST_BIN)
	$(INSTALL) -m 0755 -t $(DST_BIN) $(SRC_BIN)

.PHONY: install-config
install-config:
	$(INSTALL) -d $(DST_ETC)
	$(INSTALL) -m 0600 -t $(DST_ETC) $(SRC_ETC)

.PHONY: install-systemd
install-systemd: install-systemd-system install-systemd-user

.PHONY: install-system-system
install-systemd-system: 
	$(INSTALL) -d $(DST_SYSTEMD_SYSTEM)
	$(INSTALL) -m 0644 -t $(DST_SYSTEMD_SYSTEM) $(SRC_SYSTEMD_SYSTEM)

.PHONY: install-systemd-user
install-systemd-user: 
	$(INSTALL) -d $(DST_SYSTEMD_USER)
	$(INSTALL) -m 0644 -t $(DST_SYSTEMD_USER) $(SRC_SYSTEMD_USER)
