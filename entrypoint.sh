#!/bin/sh
cat <<EOF > /usr/share/nginx/html/env-config.js
window._env_ = {
  REACT_APP_BASEURL: "${REACT_APP_BASEURL}"
};
EOF
exec nginx -g 'daemon off;'