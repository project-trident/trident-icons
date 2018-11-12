# $FreeBSD$

PORTNAME=	trident-icons
PORTVERSION=	%%CHGVERSION%%
CATEGORIES=	trident

MAINTAINER=	jt@ixsystems.com
COMMENT=	Icon Themes for Project Trident

LICENSE=	BSD3CLAUSE

USE_GITHUB=	yes
GH_ACCOUNT=	project-trident
GH_PROJECT=	trident-icons
GH_TAGNAME=	%%GHTAG%%

NO_BUILD=	yes

do-install:
	${MKDIR} ${STAGEDIR}/usr/local/share/icons
	cd ${WRKSRC} && ${WRKSRC}/install-local.sh ${STAGEDIR}/usr/local/share/icons
	(cd ${STAGEDIR}${PREFIX}/; ${FIND} . -type f \
		| ${SED} -e 's,^\./,,g' \
		| ${AWK} '{print length, $$0}' | ${SORT} -rn \
		| cut -d " " -f 2- \
		| ${AWK} '{print $$0 }' >> ${TMPPLIST})

.include <bsd.port.mk>
