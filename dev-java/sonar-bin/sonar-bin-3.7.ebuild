inherit java-pkg-2

KEYWORDS="~amd64 ~x86"

DESCRIPTION="SonarQube is an open-source platform to manage code quality."
HOMEPAGE="http://www.sonarqube.org/"
LICENSE="LGPL-3"
SRC_URI="http://dist.sonar.codehaus.org/sonar-${PV}.zip"
SLOT="0"
IUSE=""

S="${WORKDIR}/sonar-${PV}"

DEPEND="app-arch/unzip"
RDEPEND=">=virtual/jdk-1.6"

INSTALL_DIR="/opt/sonar"

pkg_setup() {
	#enewgroup <name> [gid]
	enewgroup sonar

	#enewuser <user> [uid] [shell] [homedir] [groups] [params]
	enewuser sonar -1 /bin/bash ${INSTALL_DIR} "sonar"
}

src_install() {
	insinto ${INSTALL_DIR}

	doins -r conf data extensions lib logs temp war COPYING

	insinto ${INSTALL_DIR}/bin

	doins -r bin/jsw-license

	if use amd64 ; then
		doins -r bin/linux-x86-64
	else
		doins -r bin/linux-x86-32
	fi

	fowners -R sonar:sonar ${INSTALL_DIR}

	if use amd64 ; then
		fperms 0755 ${INSTALL_DIR}/bin/linux-x86-64/sonar.sh
		fperms 0755 ${INSTALL_DIR}/bin/linux-x86-64/wrapper
	else
		fperms 0755 ${INSTALL_DIR}/bin/linux-x86-32/sonar.sh
		fperms 0755 ${INSTALL_DIR}/bin/linux-x86-32/wrapper
	fi

	if use amd64 ; then
		newinitd "${FILESDIR}/sonar-init-64" sonar
	else
		newinitd "${FILESDIR}/sonar-init-32" sonar
	fi

	# Protect Sonar configuration on upgrade
	echo "CONFIG_PROTECT=\"${INSTALL_DIR}/conf\"" > "${T}/25sonar" || die "Failed to generate config-protect"
	doenvd "${T}/25sonar"
}
