FROM yukinying/chrome-headless-browser:65.0.3294.5


ENTRYPOINT ["/usr/bin/dumb-init", "--", \
            "/usr/bin/google-chrome-unstable", \
            "--disable-gpu", \
            "--headless", \
            "--window-size=1025,550", \
            "--disable-dev-shm-usage", \
            "--remote-debugging-address=0.0.0.0", \
            "--remote-debugging-port=9222", \
            "--user-data-dir=/data"]