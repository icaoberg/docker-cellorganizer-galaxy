FROM bgruening/galaxy-stable

RUN if [ ! -d docker-cellorganizer-galaxy ]; then git clone https://github.com/icaoberg/docker-cellorganizer-galaxy.git; fi && \
	cd docker-cellorganizer-galaxy && \
	git fetch --all && \
	git pull origin master
RUN if [ ! -d cellorganizer-galaxy-tools ]; then git clone https://github.com/icaoberg/cellorganizer-galaxy-tools.git; fi && \
	cd cellorganizer-galaxy-tools && \
	git fetch --all && \
	git checkout dev && \
	git pull origin dev
RUN rm -fv $(pwd)/config/tool_conf.xml && cp -v $(pwd)/docker-cellorganizer-galaxy/tool_conf.xml $(pwd)/config/tool_conf.xml
RUN cd cellorganizer-galaxy-tools && git fetch --all && git checkout dev && cd ..
RUN rm -rfv $(pwd)/tools/*
RUN cp -rv $(pwd)/cellorganizer-galaxy-tools/tools/cellorganizer $(pwd)/tools/
