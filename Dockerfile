FROM broadinstitute/gatk:4.1.3.0

LABEL gatk.version="4.1.3.0"

RUN conda install -c bioconda -y bwa seqtk
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

ENV PATH /opt/miniconda/bin:$PATH
ADD fetch_and_run.sh /usr/local/bin/fetch_and_run.sh
WORKDIR /tmp
USER nobody

ENTRYPOINT ["/usr/local/bin/fetch_and_run.sh"]
