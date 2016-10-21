FROM bgruening/galaxy-stable

RUN git clone https://github.com/icaoberg/cellorganizer-galaxy-tools.git
RUN git clone https://github.com/icaoberg/docker-cellorganizer-galaxy.git
RUN ln -s $(pwd)/docker-cellorganizer-galaxy/tool_conf.xml $(pwd)/config/tool_conf.xml
RUN cd cellorganizer-galaxy-tools
RUN git fetch --all
RUN git checkout dev
RUN cd ..
RUN ln -s $(pwd)/cellorganizer-galaxy-tools/tools/cellorganizer $(pwd)/tools/cellorganizer
