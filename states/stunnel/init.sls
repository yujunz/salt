stunnel:
  pkg:
    - installed
    - name: stunnel4

  service:
    - name: stunnel4

/etc/stunnel:
  file:
    - directory
    - user: root
    - group: root
    - mode: 700
    - require:
      - pkg: stunne
