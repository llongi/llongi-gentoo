inherit java-pkg-2

KEYWORDS="~amd64 ~x86"

DESCRIPTION="SonarQube Runner is a simple Java runner for SonarQube."
HOMEPAGE="http://www.sonarqube.org/"
LICENSE="LGPL-3"
SRC_URI="http://repo1.maven.org/maven2/org/codehaus/sonar/runner/sonar-runner-dist/${PV}/sonar-runner-dist-${PV}.zip"
SLOT="0"
IUSE=""

S="${WORKDIR}/sonar-runner-${PV}"

DEPEND="app-arch/unzip"
RDEPEND=">=virtual/jdk-1.6
		dev-java/sonar-bin"

INSTALL_DIR="/opt/sonar-runner"

src_install() {
	insinto ${INSTALL_DIR}

	doins -r conf lib

	insinto ${INSTALL_DIR}/bin

	doins -r bin/sonar-runner

	fowners -R sonar:sonar ${INSTALL_DIR}

	fperms 0755 ${INSTALL_DIR}/bin/sonar-runner

	# Protect Sonar-Runner configuration on upgrade
	echo "CONFIG_PROTECT=\"${INSTALL_DIR}/conf\"" > "${T}/25sonar-runner" || die "Failed to generate config-protect"
	doenvd "${T}/25sonar-runner"
}
