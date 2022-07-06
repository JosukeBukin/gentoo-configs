#!/bin/bash


__xorg_sgid() {
  [ "${CATEGORY}/${PN}" = x11-base/xorg-server ] || return 0
  ebegin 'Changin sgid'
  (
    set -e
    chown :input -- "${ED}/usr/bin/Xorg"
    chmod g+s    -- "${ED}/usr/bin/Xorg"
  )
  eend "${?}" 'failed to change sgid' || die "${_}"
}

BashrcdPhase instprep __xorg_sgid
