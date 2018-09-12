TARGET=ochelper
SUPERVISOR=/etc/supervisord.d/ochelper.ini

all: 
	wget http://soft.alphaz.cn/ochelper
	chmod +x ochelper

install:	
	cp $(TARGET) /usr/local/bin/
	echo '[program:ochelper]' > $(SUPERVISOR)
	echo 'command=ochelper' >> $(SUPERVISOR)
	echo 'autostart=true' >> $(SUPERVISOR)
	echo 'autorestart=true' >> $(SUPERVISOR)
	echo 'stderr_logfile = /var/log/ochelper_stderr.log' >> $(SUPERVISOR)
	echo 'stdout_logfile = /var/log/ochelper_stdout.log' >> $(SUPERVISOR)

clean: 
	-rm -rf $(SUPERVISOR)	