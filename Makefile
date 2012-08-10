NAME=rhoconnect-redis
VERSION=2.4.15
DEB_FILES = redis_deb_install redis_deb_uninstall rhoconnect-redis.conf redis_deb_init_script logrotate.conf
RPM_FILES = redis_rpm_install redis_rpm_uninstall redis_init_script logrotate.conf 

clean:
	rm -f rhoconnect-redis*.deb
	rm -f rhoconnect-redis*.rpm

prepare:
	mkdir -p /tmp/installdir

deb: prepare
	cp $(DEB_FILES) /tmp/installdir
	fpm -s dir -t deb -n $(NAME) -v $(VERSION) -a all -C /tmp/installdir \
	--after-install /tmp/installdir/redis_deb_install \
	--after-remove  /tmp/installdir/redis_deb_uninstall \
	--prefix /opt/rhoconnect/installer \
	--description "RhoConnect Redis Server" \
	-d "build-essential (>= 0)" ./
	rm -rf /tmp/installdir	

rpm: prepare
	cp $(RPM_FILES) /tmp/installdir
	fpm -s dir -t rpm -n $(NAME) -v $(VERSION) -a noarch -C /tmp/installdir \
	--after-install /tmp/installdir/redis_rpm_install \
	--after-remove  /tmp/installdir/redis_rpm_uninstall \
	--prefix /opt/rhoconnect/installer \
	--description "RhoConnect Redis Server" \
	-d "make >= 3.0" -d "initscripts >= 0" \
	-d "gcc >= 4.0" -d "gcc-c++ >= 4.0"  ./
#	--category "Development Tools"  ./
	rm -rf /tmp/installdir

# Build both rpm/deb packagees
all: prepare
	cp $(DEB_FILES) /tmp/installdir
	fpm -s dir -t deb -n $(NAME) -v $(VERSION) -a all -C /tmp/installdir \
	--after-install /tmp/installdir/redis_deb_install \
	--after-remove  /tmp/installdir/redis_deb_uninstall \
	--prefix /opt/rhoconnect/installer \
	--description "RhoConnect Redis Server" \
	-d "build-essential (>= 0)" ./
	rm -rf /tmp/installdir/*
	cp $(RPM_FILES) /tmp/installdir
	fpm -s dir -t rpm -n $(NAME) -v $(VERSION) -a noarch -C /tmp/installdir \
	--after-install /tmp/installdir/redis_rpm_install \
	--after-remove  /tmp/installdir/redis_rpm_uninstall \
	--prefix /opt/rhoconnect/installer \
	--description "RhoConnect Redis Server" \
	-d "make >= 3.0" -d "initscripts >= 0" \
	-d "gcc >= 4.0" -d "gcc-c++ >= 4.0"  ./
#	--category "Development Tools"  ./
	rm -rf /tmp/installdir
