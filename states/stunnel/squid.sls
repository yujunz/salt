include:
  - squid
  - stunnel

extend:
  stunnel:
    service:
      - running
      - enable: true
      - sig: /usr/bin/stunnel4 /etc/stunnel/squid.conf
      - require:
        - file: /etc/stunnel/squid.conf
        - file: /etc/ssl/private/squid.pem
      - watch:
        - file: /etc/stunnel/squid.conf
        - file: /etc/ssl/private/squid.pem

/etc/stunnel/squid.conf:
  file:
    - managed
    - source: salt://stunnel/files/squid.conf
    - user: root
    - group: root
    - mode: 600
    - require:
      - file: /etc/stunnel

/etc/ssl/private/squid.pem:
  file:
    - managed
    - source: salt://openssl/files/self-signed-certificate
    - template: py
    - user: root
    - group: root
    - mode: 700
    - replace: false
